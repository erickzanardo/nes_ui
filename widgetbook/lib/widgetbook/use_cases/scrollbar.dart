// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default', type: NesScrollbar)
Widget defaultScrollbar(BuildContext context) {
  final scrollController = ScrollController();

  return Center(
    child: NesContainer(
      height: 300,
      width: 300,
      child: Stack(
        children: [
          NesSingleChildScrollView(
            scrollController: scrollController,
            child: Column(
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
          Positioned(
            right: 0,
            bottom: 0,
            child: NesScrollbar(
              scrollController: scrollController,
              direction: Axis.vertical,
            ),
          ),
        ],
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'horizontal', type: NesScrollbar)
Widget horizontalScrollbar(BuildContext context) {
  final scrollController = ScrollController();

  return Center(
    child: NesContainer(
      height: 150,
      width: 300,
      child: Stack(
        children: [
          NesSingleChildScrollView(
            scrollController: scrollController,
            direction: Axis.horizontal,
            child: Row(
              children: List.generate(
                100,
                (index) => Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('Item $index'),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: NesScrollbar(
              scrollController: scrollController,
              direction: Axis.horizontal,
            ),
          ),
        ],
      ),
    ),
  );
}
