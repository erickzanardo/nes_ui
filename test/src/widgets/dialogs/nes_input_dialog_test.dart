import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

extension NesDialogTest on WidgetTester {
  Future<void> pumpAndShow({Completer<String>? completer}) async {
    await pumpWidget(
      MaterialApp(
        theme: flutterNesTheme(),
        home: Builder(
          builder: (context) {
            return NesButton(
              type: NesButtonType.normal,
              onPressed: () async {
                final value = await NesInputDialog.show(
                  context: context,
                  message: 'Message',
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
      expect(find.byType(NesDialog), findsOneWidget);
    });

    testWidgets('renders the message', (tester) async {
      final completer = Completer<String>();
      await tester.pumpAndShow(completer: completer);

      expect(find.text('Message'), findsOneWidget);
    });

    testWidgets('completes with the input value', (tester) async {
      final completer = Completer<String>();
      await tester.pumpAndShow(completer: completer);

      await tester.enterText(find.byType(TextField), 'Hello World');
      await tester.tap(find.text('Ok'));

      final value = await completer.future;
      expect(value, equals('Hello World'));
    });
  });
}
