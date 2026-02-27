// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default', type: NesCheckeredDecoration)
Widget normal(BuildContext context) => const Center(
  child: DecoratedBox(
    decoration: BoxDecoration(image: NesCheckeredDecoration()),
    child: SizedBox.square(dimension: 280),
  ),
);
