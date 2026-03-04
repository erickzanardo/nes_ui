// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

Widget build({required NesButtonType type, required String text}) => Center(
      child: NesButton(onPressed: () {}, type: type, child: Text(text)),
    );

@widgetbook.UseCase(name: 'normal', type: NesButton)
Widget normal(BuildContext context) =>
    build(type: NesButtonType.normal, text: 'Normal');

@widgetbook.UseCase(name: 'primary', type: NesButton)
Widget primary(BuildContext context) =>
    build(type: NesButtonType.primary, text: 'Primary');

@widgetbook.UseCase(name: 'success', type: NesButton)
Widget success(BuildContext context) =>
    build(type: NesButtonType.success, text: 'Success');

@widgetbook.UseCase(name: 'warning', type: NesButton)
Widget warning(BuildContext context) =>
    build(type: NesButtonType.warning, text: 'Warning');

@widgetbook.UseCase(name: 'error', type: NesButton)
Widget error(BuildContext context) =>
    build(type: NesButtonType.error, text: 'Error');

@widgetbook.UseCase(name: 'with fixed width', type: NesButton)
Widget withFixedWidth(BuildContext context) => Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          NesButton(
            onPressed: () {},
            type: NesButtonType.normal,
            buttonWidth: 150,
            child: const Text('Normal'),
          ),
          const SizedBox(height: 8),
          NesButton(
            onPressed: () {},
            type: NesButtonType.primary,
            buttonWidth: 150,
            child: const Text('Primary'),
          ),
          const SizedBox(height: 8),
          NesButton(
            onPressed: () {},
            type: NesButtonType.success,
            buttonWidth: 150,
            child: const Text('Success'),
          ),
        ],
      ),
    );
