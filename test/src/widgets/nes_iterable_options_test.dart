import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  group('NesIterableOptions', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesIterableOptions<String>(
              values: const ['A', 'B', 'C'],
              value: 'A',
              onChange: (_) {},
            ),
          ),
        ),
      );

      expect(
        find.byType(NesIterableOptions<String>),
        findsOneWidget,
      );
    });

    testWidgets('cycles left', (tester) async {
      final values = <String>[];
      var value = 'A';

      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return NesIterableOptions<String>(
                  values: const ['A', 'B', 'C'],
                  value: value,
                  onChange: (newValue) {
                    values.add(newValue);
                    setState(() {
                      value = newValue;
                    });
                  },
                );
              },
            ),
          ),
        ),
      );

      final leftButton = find.byType(NesIcon).first;
      await tester.tap(leftButton);
      await tester.pumpAndSettle();

      await tester.tap(leftButton);
      await tester.pumpAndSettle();

      await tester.tap(leftButton);
      await tester.pumpAndSettle();

      expect(
        values,
        equals(['C', 'B', 'A']),
      );
    });

    testWidgets('cycles right', (tester) async {
      final values = <String>[];
      var value = 'A';

      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return NesIterableOptions<String>(
                  values: const ['A', 'B', 'C'],
                  value: value,
                  onChange: (newValue) {
                    values.add(newValue);
                    setState(() {
                      value = newValue;
                    });
                  },
                );
              },
            ),
          ),
        ),
      );

      final rightButton = find.byType(NesIcon).last;
      await tester.tap(rightButton);
      await tester.pumpAndSettle();

      await tester.tap(rightButton);
      await tester.pumpAndSettle();

      await tester.tap(rightButton);
      await tester.pumpAndSettle();

      expect(
        values,
        equals(['B', 'C', 'A']),
      );
    });
  });
}
