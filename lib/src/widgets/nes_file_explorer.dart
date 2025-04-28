import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:universal_platform/universal_platform.dart';

/// A function that resolves an icon for a file.
typedef NesFileExplorerFileIconResolver = NesIconData? Function(NesFile file);

/// {@template nes_file_entity}
/// Describes a file or folder.
/// {@endtemplate}
abstract class NesFileEntity {
  /// {@macro nes_file_entity}
  const NesFileEntity(this.path);

  /// The path of the entity.
  final String path;

  String _separator() {
    if (kIsWeb) {
      return '/';
    }
    return UniversalPlatform.isWindows ? r'\' : '/';
  }

  /// The name of the entity.
  String get name => path.split(_separator()).last;

  /// The path of the entity split into parts.
  List<String> split() => path.split(_separator());

  /// The parent folder of the entity.
  String parentPath() {
    final parts = split()..removeLast();

    return parts.join(_separator());
  }
}

/// {@template nes_file}
/// Describes a file.
/// {@endtemplate}
class NesFile extends NesFileEntity {
  /// {@macro nes_file}
  const NesFile(super.path);
}

/// {@template nes_folder}
/// Describes a folder.
/// {@endtemplate}
class NesFolder extends NesFileEntity {
  /// {@macro nes_folder}
  const NesFolder(super.path);
}

/// {@template nes_file_explorer}
/// A widget that displays a list of folders and files in a tree format.
/// {@endtemplate}
class NesFileExplorer extends StatefulWidget {
  /// {@macro nes_file_explorer}
  const NesFileExplorer({
    required this.entries,
    required this.onOpenFile,
    this.fileIconResolver,
    super.key,
  });

  /// The lists of files and folders to display.
  final List<NesFileEntity> entries;

  /// The callback to call when a file is opened.
  final void Function(NesFile file) onOpenFile;

  /// A function that resolves an icon for a file.
  final NesFileExplorerFileIconResolver? fileIconResolver;

  @override
  State createState() => _NesFileExplorerState();
}

class _NesFileExplorerState extends State<NesFileExplorer> {
  final Map<String, List<NesFileEntity>> _files = {};
  final List<NesFileEntity> _root = [];

  List<String> _openFolders = [];

  void _loadEntries(List<NesFileEntity> entries) {
    entries.whereType<NesFolder>().forEach((directory) {
      _files[directory.path] = [];
    });

    for (final entry in entries) {
      final parent = entry.parentPath();
      if (_files.containsKey(parent)) {
        _files[parent]!.add(entry);
      } else {
        _root.add(entry);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _loadEntries(widget.entries);
  }

  @override
  void didUpdateWidget(NesFileExplorer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.entries != widget.entries) {
      _root.clear();
      _files.clear();

      setState(() {
        _loadEntries(widget.entries);
        _openFolders.removeWhere((path) => !_files.containsKey(path));
      });
    }
  }

  void _onToggleFolder(NesFolder folder) {
    if (_openFolders.contains(folder.path)) {
      setState(() {
        _openFolders = [
          ..._openFolders.where((path) => path != folder.path),
        ];
      });
    } else {
      setState(() {
        _openFolders = [
          folder.path,
          ..._openFolders,
        ];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final entry in _root)
          _Entry(
            entry: entry,
            onOpenFile: widget.onOpenFile,
            onToggleFolder: _onToggleFolder,
            openFolders: _openFolders,
            files: _files,
            fileIconResolver: widget.fileIconResolver,
          ),
      ],
    );
  }
}

class _Entry extends StatelessWidget {
  const _Entry({
    required this.entry,
    required this.onOpenFile,
    required this.onToggleFolder,
    required this.openFolders,
    required this.files,
    required this.fileIconResolver,
  });

  final Map<String, List<NesFileEntity>> files;
  final NesFileEntity entry;
  final void Function(NesFolder) onToggleFolder;
  final void Function(NesFile) onOpenFile;
  final List<String> openFolders;
  final NesFileExplorerFileIconResolver? fileIconResolver;

  static const _itemHeight = 36.0;

  NesIconData _fileIcon(NesFile file) {
    final customIcon = fileIconResolver?.call(file);
    if (customIcon != null) {
      return customIcon;
    }

    final extension = file.path.split('.').last.toLowerCase();

    switch (file.name) {
      case 'LICENSE':
        return NesIcons.keyHole;
    }

    switch (extension) {
      case 'mp3':
      case 'wav':
      case 'ogg':
        return NesIcons.musicNote;
      case 'png':
      case 'jpg':
      case 'jpeg':
        return NesIcons.gallery;
      case 'dart':
        return NesIcons.dartLang;
      case 'txt':
        return NesIcons.textFile;
      case 'yml':
      case 'yaml':
        return NesIcons.yamlFile;
      case 'xml':
        return NesIcons.xmlFile;
      default:
        return NesIcons.questionMark;
    }
  }

  NesIconData _getConnectionIcon(int i, int length) {
    if (i == 0 && length == 1) {
      return NesIcons.bottomConnection;
    } else if (i == length - 1) {
      return NesIcons.bottomConnection;
    } else {
      return NesIcons.middleConnection;
    }
  }

  @override
  Widget build(BuildContext context) {
    late Widget child;
    if (entry is NesFile) {
      child = NesPressable(
        onPress: () => onOpenFile(entry as NesFile),
        child: SizedBox(
          height: _itemHeight,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                NesIcon(
                  iconData: _fileIcon(entry as NesFile),
                ),
                const SizedBox(width: 8),
                Text(entry.name),
              ],
            ),
          ),
        ),
      );
    } else if (entry is NesFolder) {
      final isOpen = openFolders.contains(entry.path);
      child = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NesPressable(
            onPress: () {
              onToggleFolder(entry as NesFolder);
            },
            child: SizedBox(
              height: _itemHeight,
              child: Row(
                children: [
                  NesIcon(
                    iconData:
                        isOpen ? NesIcons.openFolder : NesIcons.closedFolder,
                  ),
                  const SizedBox(width: 8),
                  Text(entry.name),
                ],
              ),
            ),
          ),
          if (isOpen)
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < files[entry.path]!.length; i++)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NesIcon(
                          size: const Size.square(_itemHeight),
                          iconData: _getConnectionIcon(
                            i,
                            files[entry.path]!.length,
                          ),
                        ),
                        const SizedBox(width: 8),
                        _Entry(
                          entry: files[entry.path]![i],
                          onOpenFile: onOpenFile,
                          onToggleFolder: onToggleFolder,
                          openFolders: openFolders,
                          files: files,
                          fileIconResolver: fileIconResolver,
                        ),
                      ],
                    ),
                ],
              ),
            ),
        ],
      );
    }

    return child;
  }
}
