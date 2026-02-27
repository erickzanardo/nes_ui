import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

extension PumpNessRunningTextLines on WidgetTester {
  Future<void> pumpRunningTextLines({
    required List<String> texts,
    bool running = true,
    VoidCallback? onEnd,
    Widget? child,
  }) async {
    return pumpWidget(
      MaterialApp(
        theme: flutterNesTheme(),
        home: NesRunningTextLines(texts: texts, running: running, onEnd: onEnd),
      ),
    );
  }
}

void main() {
  group('NesButton', () {
    testWidgets('renders', (tester) async {
      await tester.pumpRunningTextLines(
        texts: ['The Child', 'The Mandalorian'],
      );

      await tester.pumpAndSettle();
      expect(find.text('The Child'), findsOneWidget);
      expect(find.text('The Mandalorian'), findsOneWidget);
    });

    testWidgets('calls onEnd when finishes', (tester) async {
      var called = false;
      await tester.pumpRunningTextLines(
        texts: ['The Child', 'The Mandalorian'],
        onEnd: () => called = true,
      );

      await tester.pumpAndSettle();
      expect(find.text('The Child'), findsOneWidget);
      expect(find.text('The Mandalorian'), findsOneWidget);
      expect(called, isTrue);
    });

    testWidgets('does not starts if playing is false', (tester) async {
      await tester.pumpRunningTextLines(
        texts: ['The Child', 'The Mandalorian'],
        running: false,
      );

      await tester.pumpAndSettle();
      expect(find.text('The Child'), findsNothing);
    });

    testWidgets('plays the text once running changes to true', (tester) async {
      var running = false;
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: [
                  NesRunningTextLines(
                    texts: const ['The Child', 'The Mandalorian'],
                    running: running,
                  ),
                  ElevatedButton(
                    onPressed: () => setState(() => running = true),
                    child: const Text('Start'),
                  ),
                ],
              );
            },
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.text('The Child'), findsNothing);
      expect(find.text('The Mandalorian'), findsNothing);

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text('The Child'), findsOneWidget);
      expect(find.text('The Mandalorian'), findsOneWidget);
    });

    testWidgets('plays the new text when received a new one', (tester) async {
      var texts = ['The Child', 'The Mandalorian'];
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: [
                  NesRunningTextLines(texts: texts),
                  ElevatedButton(
                    onPressed: () =>
                        setState(() => texts = ['Ramona', 'Salazar']),
                    child: const Text('Start'),
                  ),
                ],
              );
            },
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.text('The Child'), findsOneWidget);
      expect(find.text('The Mandalorian'), findsOneWidget);

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text('Ramona'), findsOneWidget);
      expect(find.text('Salazar'), findsOneWidget);
    });
  });
}
