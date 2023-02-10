import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  group('NesSelectionList', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesSelectionList(
              children: const [
                Text('Items'),
                Text('Quests'),
              ],
              onSelect: (_) {},
            ),
          ),
        ),
      );

      expect(find.text('Items'), findsOneWidget);
      expect(find.text('Quests'), findsOneWidget);
    });

    testWidgets('renders correctly in horizontal mode', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesSelectionList(
              axis: Axis.horizontal,
              children: const [
                Text('Items'),
                Text('Quests'),
              ],
              onSelect: (_) {},
            ),
          ),
        ),
      );

      expect(find.text('Items'), findsOneWidget);
      expect(find.text('Quests'), findsOneWidget);
    });

    testWidgets('on a tap, renders the marker', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesSelectionList(
              children: const [
                Text('Items'),
                Text('Quests'),
              ],
              onSelect: (_) {},
            ),
          ),
        ),
      );

      await tester.tap(find.text('Quests'));
      await tester.pump();

      expect(find.byType(NesIcon), findsOneWidget);
    });

    testWidgets('selects an item on click', (tester) async {
      int? selected;
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesSelectionList(
              children: const [
                Text('Items'),
                Text('Quests'),
              ],
              onSelect: (value) {
                selected = value;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Quests'));
      await tester.pump();

      expect(selected, equals(1));
    });

    testWidgets('can not select if can not auto focus', (tester) async {
      int? selected;
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesSelectionList(
              canAutoFocus: false,
              children: const [
                Text('Items'),
                Text('Quests'),
              ],
              onSelect: (value) {
                selected = value;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Quests'));
      await tester.pump();

      expect(selected, isNull);
    });

    testWidgets('can use keyboard to select items', (tester) async {
      int? selected;
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesSelectionList(
              children: const [
                Text('Items'),
                Text('Quests'),
              ],
              onSelect: (value) {
                selected = value;
              },
            ),
          ),
        ),
      );

      await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);
      await tester.pump();
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);

      expect(selected, equals(1));
    });

    testWidgets('can cancel the selection with the cancel key', (tester) async {
      var called = false;
      final node = FocusNode()..requestFocus();
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesSelectionList(
              focusNode: node,
              children: const [
                Text('Items'),
                Text('Quests'),
              ],
              onCancelSelection: () {
                called = true;
              },
              onSelect: (_) {},
            ),
          ),
        ),
      );

      await tester.sendKeyEvent(LogicalKeyboardKey.escape);
      await tester.pump();

      expect(called, isTrue);
    });

    testWidgets(
      'can not cancel the selection with the cancel key when '
      'canCancelSelection is false',
      (tester) async {
        var called = false;
        final node = FocusNode()..requestFocus();
        await tester.pumpWidget(
          MaterialApp(
            theme: flutterNesTheme(),
            home: Scaffold(
              body: NesSelectionList(
                focusNode: node,
                canCancelSelection: false,
                children: const [
                  Text('Items'),
                  Text('Quests'),
                ],
                onCancelSelection: () {
                  called = true;
                },
                onSelect: (_) {},
              ),
            ),
          ),
        );

        await tester.sendKeyEvent(LogicalKeyboardKey.escape);
        await tester.pump();

        expect(called, isFalse);
      },
    );
  });
}
