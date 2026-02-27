// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default', type: NesIconBadge)
Widget normal(BuildContext context) => Center(
  child: NesIconBadge(iconData: NesIcons.gamepad, badge: '1'),
);

@widgetbook.UseCase(name: 'custom size', type: NesIconBadge)
Widget customSize(BuildContext context) => Center(
  child: NesIconBadge(
    iconData: NesIcons.gamepad,
    badge: '99+',
    size: const Size(48, 48),
  ),
);
