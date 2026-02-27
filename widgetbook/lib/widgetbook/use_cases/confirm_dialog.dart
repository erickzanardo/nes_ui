// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default', type: NesConfirmDialog)
Widget normal(BuildContext context) {
  bool? lastValue;
  return StatefulBuilder(
    builder: (context, setState) {
      return Center(
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NesButton(
              type: NesButtonType.primary,
              onPressed: () async {
                final value = await NesConfirmDialog.show(
                  context: context,
                  message:
                      'Are you sure you want to proceed?\n'
                      '(Use ENTER to confirm and ESC to cancel)',
                );
                setState(() {
                  lastValue = value;
                });
              },
              child: const Text('Show Confirm Dialog'),
            ),
            Text('Last value: $lastValue'),
          ],
        ),
      );
    },
  );
}
