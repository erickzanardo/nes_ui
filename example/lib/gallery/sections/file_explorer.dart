import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class FileExplorerSection extends StatefulWidget {
  const FileExplorerSection({super.key});

  @override
  State<FileExplorerSection> createState() => _FileExplorerSectionState();
}

class _FileExplorerSectionState extends State<FileExplorerSection> {
  var _wasAdded = false;
  var _entries = [
    const NesFolder('/assets'),
    const NesFolder('/assets/images'),
    const NesFile('/assets/images/sprite-sheet.png'),
    const NesFile('/assets/images/char.png'),
    const NesFolder('/assets/music'),
    const NesFile('/assets/music/battle.mp3'),
    const NesFile('/assets/music/title.mp3'),
    const NesFile('/assets/LICENSE'),
    const NesFolder('/src'),
    const NesFile('/src/char.dart'),
    const NesFile('/src/map.dart'),
    const NesFile('/pubspec.yaml'),
    const NesFile('/ci.yml'),
    const NesFolder('/android'),
    const NesFile('/android/AndroidManifest.xml'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'NesFile Explorer',
          style: theme.textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        NesContainer(
          height: 300,
          width: 600,
          child: Stack(
            children: [
              Positioned.fill(
                child: NesSingleChildScrollView(
                  child: NesFileExplorer(
                    onOpenFile: (_) {},
                    entries: _entries,
                  ),
                ),
              ),
              if (!_wasAdded)
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: NesIconButton(
                    icon: NesIcons.instance.newFile,
                    onPress: () {
                      setState(() {
                        _wasAdded = true;
                        _entries = [
                          ..._entries,
                          const NesFile('/src/new_char.dart'),
                        ];
                      });
                      NesSnackbar.show(
                        context,
                        text: 'Added new file: /src/new_char.dart',
                        type: NesSnackbarType.success,
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
