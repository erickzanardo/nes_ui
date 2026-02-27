// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:mini_sprite/mini_sprite.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default', type: NesFileExplorer)
Widget normal(BuildContext context) => Center(
  child: NesContainer(
    height: 300,
    width: 300,
    child: NesSingleChildScrollView(
      child: NesFileExplorer(
        onOpenFile: (file) {},
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
          NesFile('/pubspec.yaml'),
          NesFile('/ci.yml'),
        ],
      ),
    ),
  ),
);

@widgetbook.UseCase(name: 'with custom icons', type: NesFileExplorer)
Widget customIcons(BuildContext context) => Center(
  child: NesContainer(
    height: 300,
    width: 300,
    child: NesFileExplorer(
      entries: const [
        NesFolder('/emojis'),
        NesFile('/emojis/happy'),
        NesFile('/emojis/sad'),
        NesFolder('/songs'),
        NesFile('/songs/rock.mp3'),
      ],
      onOpenFile: (_) {},
      fileIconResolver: (entry) {
        if (entry.path == '/emojis/happy') {
          return NesIconData(
            MiniSprite.fromDataString(
              '8,8;18,-1;1,0;2,-1;1,0;4,-1;1,0;2,-1;1,0;4,-1;1,0;2,-1;1,0;2,-1;1,0;6,-1;1,0;1,-1;6,0;9,-1',
            ),
          );
        } else if (entry.path == '/emojis/sad') {
          return NesIconData(
            MiniSprite.fromDataString(
              '8,8;18,-1;1,0;2,-1;1,0;4,-1;1,0;2,-1;1,0;4,-1;1,0;2,-1;1,0;11,-1;6,0;1,-1;1,0;6,-1;1,0',
            ),
          );
        }
        return null;
      },
    ),
  ),
);
