// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

Widget build() {
  var selected = false;
    return Center(
      child: StatefulBuilder(
        builder: (context, setState) {
          return NesCheckBox(
            onChange: (value) {
              setState(() {
                selected = value;
              });
            },
            value: selected,
          );
        },
      ),
    );
}

@widgetbook.UseCase(
  name: 'default',
  type: NesCheckBox,
)
Widget checkbox(BuildContext context) => build();
