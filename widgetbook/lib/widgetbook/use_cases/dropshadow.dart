// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: NesDropshadow,
)
Widget normal(BuildContext context) => Center(
      child: NesDropshadow(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.blue,
          child: const Center(
            child: Text('Content'),
          ),
        ),
      ),
    );

@widgetbook.UseCase(
  name: 'custom offset',
  type: NesDropshadow,
)
Widget customOffset(BuildContext context) => Center(
      child: NesDropshadow(
        x: 4,
        y: 4,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
          child: const Center(
            child: Text('Content'),
          ),
        ),
      ),
    );
