// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default', type: NesBlinker)
Widget normal(BuildContext context) => Center(
  child: NesBlinker(child: NesIcon(iconData: NesIcons.gamepad)),
);
