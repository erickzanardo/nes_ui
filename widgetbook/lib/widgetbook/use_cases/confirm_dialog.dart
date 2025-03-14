// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: NesConfirmDialog,
)
Widget normal(BuildContext context) => Center(
      child: NesButton(
        type: NesButtonType.primary,
        onPressed: () {
          NesConfirmDialog.show(
            context: context,
            message: 'Are you sure you want to proceed?',
          );
        },
        child: const Text('Show Confirm Dialog'),
      ),
    );
