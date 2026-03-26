// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default', type: NesColorPicker)
Widget defaultColorPicker(BuildContext context) {
  return Center(
    child: NesColorPicker(
      value: const Color(0xff209cee),
      onChanged: (color) {},
    ),
  );
}

@widgetbook.UseCase(name: 'with custom colors', type: NesColorPicker)
Widget customColors(BuildContext context) {
  return Center(
    child: NesColorPicker(
      value: Colors.red,
      onChanged: (color) {},
      presetColors: const [
        Colors.red,
        Colors.green,
        Colors.blue,
        Colors.yellow,
        Colors.orange,
        Colors.purple,
        Colors.pink,
        Colors.teal,
      ],
      columnCount: 4,
    ),
  );
}

@widgetbook.UseCase(name: 'without custom input', type: NesColorPicker)
Widget withoutCustomInput(BuildContext context) {
  return Center(
    child: NesColorPicker(
      value: const Color(0xff92cc41),
      onChanged: (color) {},
      enableCustomInput: false,
    ),
  );
}
