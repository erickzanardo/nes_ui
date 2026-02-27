// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:mini_sprite/mini_sprite.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default', type: NesContainer)
Widget normal(BuildContext context) => const Center(
  child: NesContainer(
    width: 200,
    height: 200,
    child: Center(child: Text('Hello World')),
  ),
);

@widgetbook.UseCase(name: 'with label', type: NesContainer)
Widget label(BuildContext context) => const Center(
  child: NesContainer(
    width: 200,
    height: 200,
    label: 'Label',
    child: Center(child: Text('Hello World')),
  ),
);

@widgetbook.UseCase(name: 'with square corner painter', type: NesContainer)
Widget squareConer(BuildContext context) => const Center(
  child: NesContainer(
    painterBuilder: NesContainerSquareCornerPainter.new,
    width: 200,
    height: 200,
    label: 'Label',
    child: Center(child: Text('Hello World')),
  ),
);

@widgetbook.UseCase(
  name: 'with corner inner square painter',
  type: NesContainer,
)
Widget cornerInnerSquare(BuildContext context) => const Center(
  child: NesContainer(
    painterBuilder: NesContainerCornerInnerSquarePainter.new,
    width: 200,
    height: 200,
    label: 'Label',
    child: Center(child: Text('Hello World')),
  ),
);

@widgetbook.UseCase(name: 'with mini sprite painter', type: NesContainer)
Widget miniSpritePainer(BuildContext context) => Center(
  child: NesContainer(
    painterBuilder:
        ({
          required String? label,
          required int pixelSize,
          required TextStyle textStyle,
          required Color backgroundColor,
          required Color borderColor,
        }) => NesContainerMiniSpritePainter(
          label: label,
          pixelSize: pixelSize,
          textStyle: textStyle,
          backgroundColor: backgroundColor,
          borderColor: borderColor,
          topLeftCorner: MiniSprite.fromDataString(
            '8,8;1,-1;8,0;7,-1;9,0;1,-1;1,0;7,-1;1,0;2,-1;1,0;3,-1;6,0;3,-1;1,0;1,-1;1,0;3,-1;5,0;3,-1',
          ),
          topRightCorner: MiniSprite.fromDataString(
            '8,8;7,0;8,-1;9,0;5,-1;1,0;1,-1;1,0;2,-1;1,0;2,-1;1,0;3,-1;6,0;4,-1;1,0;1,-1;1,0;5,-1;5,0',
          ),
          bottomLeftCorner: MiniSprite.fromDataString(
            '8,8;5,0;5,-1;1,0;1,-1;1,0;4,-1;6,0;3,-1;1,0;2,-1;1,0;2,-1;1,0;1,-1;1,0;5,-1;9,0;8,-1;7,0',
          ),
          bottomRightCorner: MiniSprite.fromDataString(
            '8,8;3,-1;5,0;3,-1;1,0;1,-1;1,0;3,-1;6,0;3,-1;1,0;2,-1;1,0;7,-1;1,0;1,-1;9,0;7,-1;8,0;1,-1',
          ),
          topBar: MiniSprite.fromDataString('8,8;8,0;8,-1;8,0;3,-1;2,0;35,-1'),
          bottomBar: MiniSprite.fromDataString(
            '8,8;35,-1;2,0;3,-1;8,0;8,-1;8,0',
          ),
          rightBar: MiniSprite.fromDataString(
            '8,8;5,-1;1,0;1,-1;1,0;5,-1;1,0;1,-1;1,0;5,-1;1,0;1,-1;1,0;4,-1;2,0;1,-1;1,0;4,-1;2,0;1,-1;1,0;5,-1;1,0;1,-1;1,0;5,-1;1,0;1,-1;1,0;5,-1;1,0;1,-1;1,0',
          ),
          leftBar: MiniSprite.fromDataString(
            '8,8;1,0;1,-1;1,0;5,-1;1,0;1,-1;1,0;5,-1;1,0;1,-1;1,0;5,-1;1,0;1,-1;2,0;4,-1;1,0;1,-1;2,0;4,-1;1,0;1,-1;1,0;5,-1;1,0;1,-1;1,0;5,-1;1,0;1,-1;1,0;5,-1',
          ),
        ),
    width: 600,
    height: 190,
    label: 'Label',
    child: const Center(child: Text('Hello World')),
  ),
);
