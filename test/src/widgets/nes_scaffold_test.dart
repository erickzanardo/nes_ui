// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  group('NesScaffold', () {
    testWidgets('renders', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(body: NesScaffold(body: const Text('Hello World'))),
        ),
      );

      expect(find.byType(NesScaffold), findsOneWidget);
      expect(find.text('Hello World'), findsOneWidget);
    });

    testWidgets('show snackbar', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesScaffold(
              body: Builder(
                builder: (context) {
                  return ElevatedButton(
                    child: const Text('Show Snackbar'),
                    onPressed: () {
                      NesScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const NesSnackbar(text: 'Hello World'));
                    },
                  );
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Snackbar'));
      await tester.pumpAndSettle();

      expect(find.text('Hello World'), findsOneWidget);

      await tester.idle();
    });
  });
}
