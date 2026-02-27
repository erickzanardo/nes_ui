// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default', type: NesFixedViewport)
Widget defaultViewport(BuildContext context) => Center(
  child: NesFixedViewport(
    builder: (_) => Container(
      color: Colors.blue,
      alignment: Alignment.center,
      child: const Text('Default 256x240'),
    ),
  ),
);

@widgetbook.UseCase(name: 'custom resolution', type: NesFixedViewport)
Widget customResolution(BuildContext context) => Center(
  child: NesFixedViewport(
    resolution: const Size(512, 480),
    builder: (_) => Container(
      color: Colors.red,
      alignment: Alignment.center,
      child: const Text('512x480'),
    ),
  ),
);

@widgetbook.UseCase(name: 'top left alignment', type: NesFixedViewport)
Widget topLeftAlignment(BuildContext context) => Center(
  child: NesFixedViewport(
    alignment: Alignment.topLeft,
    builder: (_) => Container(
      color: Colors.green,
      alignment: Alignment.center,
      child: const Text('Top Left'),
    ),
  ),
);

@widgetbook.UseCase(name: 'bottom right alignment', type: NesFixedViewport)
Widget bottomRightAlignment(BuildContext context) => Center(
  child: NesFixedViewport(
    alignment: Alignment.bottomRight,
    builder: (_) => Container(
      color: Colors.orange,
      alignment: Alignment.center,
      child: const Text('Bottom Right'),
    ),
  ),
);
