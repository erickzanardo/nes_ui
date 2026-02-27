// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'unpressed', type: NesKeyIcon)
Widget unpressed(BuildContext context) =>
    const Center(child: NesKeyIcon(buttonKey: 'A'));

@widgetbook.UseCase(name: 'pressed', type: NesKeyIcon)
Widget pressed(BuildContext context) =>
    const Center(child: NesKeyIcon(buttonKey: 'A', pressed: true));

@widgetbook.UseCase(name: 'various keys', type: NesKeyIcon)
Widget variousKeys(BuildContext context) => const Center(
  child: Wrap(
    spacing: 8,
    runSpacing: 8,
    children: [
      NesKeyIcon(buttonKey: 'A'),
      NesKeyIcon(buttonKey: 'B'),
      NesKeyIcon(buttonKey: 'X'),
      NesKeyIcon(buttonKey: 'Y'),
      NesKeyIcon(buttonKey: 'Z'),
      NesKeyIcon(buttonKey: '1'),
      NesKeyIcon(buttonKey: '2'),
    ],
  ),
);
