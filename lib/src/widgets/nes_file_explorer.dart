import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_file_explorer}
/// A widget that displays a list of folders and files in a tree format.
/// {@endtemplate}
class NesFileExplorer extends StatefulWidget {
  /// {@macro nes_file_explorer}
  const NesFileExplorer({
    required this.entries,
    super.key,
  });

  /// The lists of files and folders to display.
  final List<FileSystemEntity> entries;

  @override
  State createState() => _NesFileExplorerState();
}

class _NesFileExplorerState extends State<NesFileExplorer> {
  final Map<String, List<FileSystemEntity>> _files = {};
  final List<FileSystemEntity> _root = [];

  List<String> openFolders = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    widget.entries.whereType<Directory>().forEach((directory) {
      _files[directory.path] = [];
    });

    for (final entry in widget.entries) {
      final parent = entry.parent;
      if (_files.containsKey(parent.path)) {
        _files[parent.path]!.add(entry);
      } else {
        _root.add(entry);
      }
    }
  }

  void _onToggleFolder(Directory directory) {
    if (openFolders.contains(directory.path)) {
      setState(() {
        openFolders = [
          ...openFolders.where((path) => path != directory.path),
        ];
      });
    } else {
      setState(() {
        openFolders = [
          directory.path,
          ...openFolders,
        ];
      });
    }
  }

  void _onOpenFile(File file) {
    print(file);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final entry in _root)
          _Entry(
            entry: entry,
            onOpenFile: _onOpenFile,
            onToggleFolder: _onToggleFolder,
            openFolders: openFolders,
            files: _files,
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
  });

  final Map<String, List<FileSystemEntity>> files;
  final FileSystemEntity entry;
  final void Function(Directory) onToggleFolder;
  final void Function(File) onOpenFile;
  final List<String> openFolders;

  String separator() => !kIsWeb && Platform.isWindows ? r'\' : '/';

  String getEntryName() {
    return entry.path.split(separator()).last;
  }

  static const _itemHeight = 36.0;

  NesIconData _fileIcon(File file) {
    final name = file.path.split(separator()).last;
    final extension = file.path.split('.').last.toLowerCase();

    switch (name) {
      case 'LICENSE':
        return NesIcons.instance.keyHole;
    }

    switch (extension) {
      case 'mp3':
      case 'wav':
      case 'ogg':
        return NesIcons.instance.musicNote;
      case 'png':
      case 'jpg':
      case 'jpeg':
        return NesIcons.instance.gallery;
      case 'dart':
        return NesIcons.instance.dartLang;
      default:
        return NesIcons.instance.questionMark;
    }
  }

  NesIconData _getConnectionIcon(int i, int length) {
    if (i == 0 && length == 1) {
      return NesIcons.instance.bottomConnection;
    } else if (i == length - 1) {
      return NesIcons.instance.bottomConnection;
    } else {
      return NesIcons.instance.middleConnection;
    }
  }

  @override
  Widget build(BuildContext context) {
    late Widget child;
    if (entry is File) {
      child = NesPressable(
        onPress: () => onOpenFile(entry as File),
        child: SizedBox(
          height: _itemHeight,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                NesIcon(
                  iconData: _fileIcon(entry as File),
                ),
                const SizedBox(width: 8),
                Text(getEntryName()),
              ],
            ),
          ),
        ),
      );
    } else if (entry is Directory) {
      final isOpen = openFolders.contains(entry.path);
      child = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NesPressable(
            onPress: () {
              onToggleFolder(entry as Directory);
            },
            child: SizedBox(
              height: _itemHeight,
              child: Row(
                children: [
                  NesIcon(
                    iconData: isOpen
                        ? NesIcons.instance.openFolder
                        : NesIcons.instance.closedFolder,
                  ),
                  const SizedBox(width: 8),
                  Text(getEntryName()),
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
