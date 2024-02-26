// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  group('NesBottomSheet', () {
    testWidgets('renders', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesBottomSheet(
              child: const Text('Hello World'),
            ),
          ),
        ),
      );

      expect(find.byType(NesBottomSheet), findsOneWidget);
      expect(find.text('Hello World'), findsOneWidget);
    });

    testWidgets('show', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: Builder(
              builder: (context) {
                return ElevatedButton(
                  child: const Text('Show Bottom Sheet'),
                  onPressed: () {
                    NesBottomSheet.show<void>(
                      context: context,
                      builder: (_) => const Text('Hello World'),
                    );
                  },
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Show Bottom Sheet'));
      await tester.pumpAndSettle();

      expect(find.byType(NesBottomSheet), findsOneWidget);
    });
  });
}
