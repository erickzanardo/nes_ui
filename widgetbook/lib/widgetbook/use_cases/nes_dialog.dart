// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: NesDialog,
)
Widget normal(BuildContext context) => Center(
      child: Builder(
        builder: (context) {
          return NesButton(
            onPressed: () {
              NesDialog.show<void>(
                context: context,
                builder: (_) => const Text('This is a basic dialog'),
              );
            },
            type: NesButtonType.primary,
            child: const Text('Show Dialog'),
          );
        },
      ),
    );

@widgetbook.UseCase(
  name: 'window style',
  type: NesDialog,
)
Widget windowStyle(BuildContext context) => Center(
      child: Builder(
        builder: (context) {
          return NesButton(
            onPressed: () {
              NesDialog.show<void>(
                context: context,
                builder: (_) => const Text('This is a window style dialog'),
                frame: NesWindowDialogFrame(
                  title: 'Window Dialog',
                  leftIcon: NesIcons.gem,
                ),
              );
            },
            type: NesButtonType.primary,
            child: const Text('Show Window Dialog'),
          );
        },
      ),
    );
