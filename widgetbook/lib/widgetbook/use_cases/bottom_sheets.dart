// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default', type: NesBottomSheet)
Widget normal(BuildContext context) => Center(
      child: Builder(
        builder: (context) {
          return NesButton(
            onPressed: () {
              NesBottomSheet.show<void>(
                context: context,
                builder: (_) => const Text('This is a basic bottom sheet'),
              );
            },
            type: NesButtonType.primary,
            child: const Text('Show Bottom Sheet'),
          );
        },
      ),
    );
