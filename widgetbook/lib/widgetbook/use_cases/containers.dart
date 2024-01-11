// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: NesContainer,
)
Widget normal(BuildContext context) => const Center(
      child: NesContainer(
        width: 200,
        height: 200,
        child: Center(
          child: Text(
            'Hello World',
          ),
        ),
      ),
    );

@widgetbook.UseCase(
  name: 'with label',
  type: NesContainer,
)
Widget label(BuildContext context) => const Center(
      child: NesContainer(
        width: 200,
        height: 200,
        label: 'Label',
        child: Center(
          child: Text(
            'Hello World',
          ),
        ),
      ),
    );

@widgetbook.UseCase(
  name: 'with square corner painter',
  type: NesContainer,
)
Widget squareConer(BuildContext context) => const Center(
      child: NesContainer(
        painterBuilder: NesContainerSquareCornerPainter.new,
        width: 200,
        height: 200,
        label: 'Label',
        child: Center(
          child: Text(
            'Hello World',
          ),
        ),
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
        child: Center(
          child: Text(
            'Hello World',
          ),
        ),
      ),
    );
