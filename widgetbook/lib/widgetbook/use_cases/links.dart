// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'normal', type: NesLink)
Widget normal(BuildContext context) => Center(
  child: NesLink(label: 'This is a link, click it!', onPressed: () {}),
);

@widgetbook.UseCase(name: 'disabled', type: NesLink)
Widget primary(BuildContext context) => const Center(
  child: NesLink(label: "Disabled links don't have the onPressed callback"),
);
