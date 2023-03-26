import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class FileExplorerSection extends StatelessWidget {
  const FileExplorerSection({super.key});

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
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: NesFileExplorer(
              onOpenFile: (_) {},
              entries: const [
                NesFolder('/assets'),
                NesFolder('/assets/images'),
                NesFile('/assets/images/sprite-sheet.png'),
                NesFile('/assets/images/char.png'),
                NesFolder('/assets/music'),
                NesFile('/assets/music/battle.mp3'),
                NesFile('/assets/music/title.mp3'),
                NesFile('/assets/LICENSE'),
                NesFolder('/src'),
                NesFile('/src/char.dart'),
                NesFile('/src/map.dart'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
