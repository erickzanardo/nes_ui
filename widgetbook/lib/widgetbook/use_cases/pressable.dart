// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default', type: NesPressable)
Widget normal(BuildContext context) => Center(
  child: Builder(
    builder: (context) {
      return NesPressable(
        onPress: () {},
        child: const Text('A Text wrapped by a NesPressable'),
      );
    },
  ),
);
