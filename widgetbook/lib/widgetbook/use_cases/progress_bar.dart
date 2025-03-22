// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'pixel',
  type: NesProgressBar,
  path: 'widgets/progressbar',
)
Widget pixel(BuildContext context) => const Center(
      child: NesProgressBar(value: 0),
    );

@widgetbook.UseCase(
  name: 'smooth',
  type: NesProgressBar,
  path: 'widgets/progressbar',
)
Widget smooth(BuildContext context) => const Center(
      child: NesProgressBar(value: 0, style: NesProgressBarStyle.smooth),
    );
