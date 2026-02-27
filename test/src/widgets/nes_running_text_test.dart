import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

extension PumpNessRunningText on WidgetTester {
  Future<void> pumpRunningText({
    required String text,
    bool running = true,
    VoidCallback? onEnd,
    Widget? child,
  }) async {
    return pumpWidget(
      MaterialApp(
        theme: flutterNesTheme(),
        home: NesRunningText(text: text, running: running, onEnd: onEnd),
      ),
    );
  }
}

void main() {
  group('NesButton', () {
    testWidgets('renders', (tester) async {
      await tester.pumpRunningText(text: 'The Child');

      await tester.pumpAndSettle();
      expect(find.text('The Child'), findsOneWidget);
    });

    testWidgets('calls onEnd when finishes', (tester) async {
      var called = false;
      await tester.pumpRunningText(
        text: 'The Child',
        onEnd: () => called = true,
      );

      await tester.pumpAndSettle();
      expect(find.text('The Child'), findsOneWidget);
      expect(called, isTrue);
    });

    testWidgets('does not starts if playing is false', (tester) async {
      await tester.pumpRunningText(text: 'The Child', running: false);

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
                  NesRunningText(text: 'The Child', running: running),
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

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text('The Child'), findsOneWidget);
    });

    testWidgets('plays the new text when received a new one', (tester) async {
      var text = 'The Child';
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: StatefulBuilder(
            builder: (context, setState) {
              return Column(
                children: [
                  NesRunningText(text: text),
                  ElevatedButton(
                    onPressed: () => setState(() => text = 'The Mandalorian'),
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

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      expect(find.text('The Mandalorian'), findsOneWidget);
    });
  });
}
