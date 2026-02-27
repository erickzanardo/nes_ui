// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default', type: NesIconButton)
Widget defaultUseCase(BuildContext context) => Center(
  child: NesIconButton(icon: NesIcons.gamepad, onPress: _onPress),
);

@widgetbook.UseCase(name: 'custom size', type: NesIconButton)
Widget customSize(BuildContext context) => Center(
  child: NesIconButton(
    icon: NesIcons.gamepad,
    size: const Size(48, 48),
    onPress: _onPress,
  ),
);

@widgetbook.UseCase(name: 'custom colors', type: NesIconButton)
Widget customColors(BuildContext context) => Center(
  child: NesIconButton(
    icon: NesIcons.gamepad,
    primaryColor: Colors.red,
    secondaryColor: Colors.blue,
    onPress: _onPress,
  ),
);

@widgetbook.UseCase(name: 'disabled', type: NesIconButton)
Widget disabled(BuildContext context) =>
    Center(child: NesIconButton(icon: NesIcons.gamepad, disabled: true));

@widgetbook.UseCase(name: 'with badge', type: NesIconButton)
Widget withBadge(BuildContext context) => Center(
  child: NesIconButton(icon: NesIcons.gamepad, badge: '1', onPress: _onPress),
);

void _onPress() {}
