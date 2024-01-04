// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: NesRunningText,
)
Widget normal(BuildContext context) {
  return const Center(
    child: NesContainer(
      width: 400,
      height: 200,
      child: NesRunningText(
        text: 'Get ready!',
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'default',
  type: NesRunningTextLines,
)
Widget lines(BuildContext context) {
  return const Center(
    child: NesContainer(
      width: 600,
      height: 160,
      child: NesRunningTextLines(
        texts: [
          'Welcome back adventurer!',
          'Hope you gathered all your gear!',
          'The journey is about to begin!',
        ],
      ),
    ),
  );
}
