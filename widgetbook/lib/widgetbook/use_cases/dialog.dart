// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default', type: NesDialog)
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

@widgetbook.UseCase(name: 'without close button', type: NesDialog)
Widget noCloseButton(BuildContext context) => Center(
  child: Builder(
    builder: (context) {
      return NesButton(
        onPressed: () {
          NesDialog.show<void>(
            context: context,
            showCloseButton: false,
            builder: (_) => Column(
              spacing: 16,
              children: [
                const Text('This is a basic dialog'),
                Builder(
                  builder: (context) {
                    return NesButton(
                      onPressed: () => Navigator.of(context).pop(),
                      type: NesButtonType.primary,
                      child: const Text('Close'),
                    );
                  },
                ),
              ],
            ),
          );
        },
        type: NesButtonType.primary,
        child: const Text('Show Dialog'),
      );
    },
  ),
);

@widgetbook.UseCase(name: 'using confirm shortcut', type: NesDialog)
Widget confirmShortcut(BuildContext context) => Center(
  child: Builder(
    builder: (context) {
      return NesButton(
        onPressed: () {
          NesDialog.show<void>(
            context: context,
            onShortcutConfirm: () => NesDialogConfirmAction.closeDialog,
            builder: (_) => const Text(
              'This is a basic dialog. Both ESC and ENTER will close this.',
            ),
          );
        },
        type: NesButtonType.primary,
        child: const Text('Show Dialog'),
      );
    },
  ),
);

@widgetbook.UseCase(name: 'window style', type: NesDialog)
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
