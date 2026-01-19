// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: NesInputDialog,
)
Widget normal(BuildContext context) {
  String? lastValue;
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
                final value = await NesInputDialog.show(
                  context: context,
                  message: 'Please enter your name:',
                );
                if (value != null) {
                  setState(() {
                    lastValue = value;
                  });
                }
              },
              child: const Text('Show Input Dialog'),
            ),
            Text('Last value: $lastValue'),
          ],
        ),
      );
    },
  );
}
