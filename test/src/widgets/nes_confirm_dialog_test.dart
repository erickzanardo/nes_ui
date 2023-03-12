import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

extension NesConfirmDialogTest on WidgetTester {
  Future<void> pumpAndShow({Completer<bool>? completer}) async {
    await pumpWidget(
      MaterialApp(
        theme: flutterNesTheme(),
        home: Builder(
          builder: (context) {
            return NesButton(
              type: NesButtonType.normal,
              onPressed: () async {
                final value = await NesConfirmDialog.show(
                  context: context,
                );
                completer?.complete(value);
              },
              child: const Text('Show'),
            );
          },
        ),
      ),
    );
    await tap(find.text('Show'));
    await pumpAndSettle();
  }
}

void main() {
  group('NesButton', () {
    testWidgets('shows the dialog', (tester) async {
      await tester.pumpAndShow();
      expect(find.byType(NesConfirmDialog), findsOneWidget);
    });

    testWidgets('returns true when confirming', (tester) async {
      final completer = Completer<bool>();
      await tester.pumpAndShow(completer: completer);

      await tester.tap(find.text('Yes'));
      expect(await completer.future, isTrue);
    });

    testWidgets('returns false when canceling', (tester) async {
      final completer = Completer<bool>();
      await tester.pumpAndShow(completer: completer);

      await tester.tap(find.text('No'));
      expect(await completer.future, isFalse);
    });
  });
}
