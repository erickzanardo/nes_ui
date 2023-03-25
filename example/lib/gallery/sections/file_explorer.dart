import 'dart:io';

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
          'File Explorer',
          style: theme.textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        NesContainer(
          height: 300,
          width: 600,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: NesFileExplorer(
              entries: [
                Directory('/assets'),
                Directory('/assets/images'),
                File('/assets/images/sprite-sheet.png'),
                File('/assets/images/char.png'),
                Directory('/assets/music'),
                File('/assets/music/battle.mp3'),
                File('/assets/music/title.mp3'),
                File('/assets/LICENSE'),
                Directory('/src'),
                File('/src/char.dart'),
                File('/src/map.dart'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
