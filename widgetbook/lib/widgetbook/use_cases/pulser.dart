// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default', type: NesPulser)
Widget defaultPulser(BuildContext context) => Center(
      child: NesPulser(child: NesIcon(iconData: NesIcons.gamepad)),
    );

@widgetbook.UseCase(name: 'with text', type: NesPulser)
Widget withText(BuildContext context) =>
    Center(child: NesPulser(child: const Text('NES Pulser')));

@widgetbook.UseCase(name: 'with custom scale', type: NesPulser)
Widget customScale(BuildContext context) => Center(
      child: NesPulser(
        pulseScale: 1.5,
        child: NesIcon(iconData: NesIcons.gamepad),
      ),
    );

@widgetbook.UseCase(name: 'with custom duration', type: NesPulser)
Widget customDuration(BuildContext context) => Center(
      child: NesPulser(
        duration: const Duration(milliseconds: 500),
        child: NesIcon(iconData: NesIcons.gamepad),
      ),
    );

@widgetbook.UseCase(name: 'with curve', type: NesPulser)
Widget withCurve(BuildContext context) => Center(
      child: NesPulser(
        curve: Curves.easeOut,
        child: NesIcon(iconData: NesIcons.gamepad),
      ),
    );
