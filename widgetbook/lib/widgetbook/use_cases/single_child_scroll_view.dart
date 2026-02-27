// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default', type: NesSingleChildScrollView)
Widget normal(BuildContext context) => Center(
  child: NesContainer(
    height: 300,
    width: 300,
    child: NesSingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(100, (index) => Text('Item $index')),
      ),
    ),
  ),
);

@widgetbook.UseCase(name: 'horizontal', type: NesSingleChildScrollView)
Widget horizontal(BuildContext context) => Center(
  child: NesContainer(
    height: 200,
    width: 300,
    child: NesSingleChildScrollView(
      direction: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          100,
          (index) => Padding(
            padding: const EdgeInsets.all(8),
            child: Text('Item $index'),
          ),
        ),
      ),
    ),
  ),
);

@widgetbook.UseCase(name: 'with clip content', type: NesSingleChildScrollView)
Widget clipContent(BuildContext context) => Center(
  child: NesContainer(
    height: 300,
    width: 300,
    child: NesSingleChildScrollView(
      clipContent: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(100, (index) => Text('Item $index')),
      ),
    ),
  ),
);
