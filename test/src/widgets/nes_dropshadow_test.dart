import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  group('NesDropshadow', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const Scaffold(body: NesDropshadow(child: NesWindow())),
        ),
      );

      expect(find.byType(NesDropshadow), findsOneWidget);
    });

    testWidgets('renders its child', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const Scaffold(body: NesDropshadow(child: NesWindow())),
        ),
      );

      expect(find.byType(NesWindow), findsOneWidget);
    });

    testWidgets('does not support negative x values', (tester) async {
      expect(
        () => NesDropshadow(x: -1, child: const Text('')),
        throwsAssertionError,
      );
    });

    testWidgets('does not support negative y values', (tester) async {
      expect(
        () => NesDropshadow(y: -1, child: const Text('')),
        throwsAssertionError,
      );
    });
  });
}
