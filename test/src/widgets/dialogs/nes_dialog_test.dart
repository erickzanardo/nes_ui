import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

extension NesDialogTest on WidgetTester {
  Future<void> pumpAndShow({Completer<bool>? completer}) async {
    await pumpWidget(
      MaterialApp(
        theme: flutterNesTheme(),
        home: Builder(
          builder: (context) {
            return NesButton(
              type: NesButtonType.normal,
              onPressed: () async {
                final value = await NesDialog.show<bool>(
                  context: context,
                  builder: (_) => const Text('Hello World'),
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

    testWidgets('renders the child', (tester) async {
      final completer = Completer<bool>();
      await tester.pumpAndShow(completer: completer);

      expect(find.text('Hello World'), findsOneWidget);
    });
  });
}
