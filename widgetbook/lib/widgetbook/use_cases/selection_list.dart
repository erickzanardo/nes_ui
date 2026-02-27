// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

Widget _vertical() {
  var selected = 0;
  return Center(
    child: StatefulBuilder(
      builder: (context, setState) {
        return NesSelectionList(
          initialIndex: selected,
          children: const [
            Text('Characters'),
            Text('Items'),
            Text('Skills'),
            Text('Status'),
          ],
          onSelect: (value) {
            setState(() => selected = value);
          },
        );
      },
    ),
  );
}

Widget _horizontal() {
  var selected = 0;
  return Center(
    child: StatefulBuilder(
      builder: (context, setState) {
        return NesSelectionList(
          initialIndex: selected,
          axis: Axis.horizontal,
          children: const [Text('Yes'), Text('No')],
          onSelect: (value) {
            setState(() => selected = value);
          },
        );
      },
    ),
  );
}

Widget _withDisabledItems() {
  var selected = 0;
  return Center(
    child: StatefulBuilder(
      builder: (context, setState) {
        return NesSelectionList(
          initialIndex: selected,
          disabledItems: const [1, 2],
          children: const [
            Text('Available'),
            Text('Disabled'),
            Text('Also Disabled'),
            Text('Available'),
          ],
          onSelect: (value) {
            setState(() => selected = value);
          },
        );
      },
    ),
  );
}

@widgetbook.UseCase(name: 'vertical', type: NesSelectionList)
Widget vertical(BuildContext context) => _vertical();

@widgetbook.UseCase(name: 'horizontal', type: NesSelectionList)
Widget horizontal(BuildContext context) => _horizontal();

@widgetbook.UseCase(name: 'with disabled items', type: NesSelectionList)
Widget withDisabledItems(BuildContext context) => _withDisabledItems();
