import 'package:flutter/material.dart';
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
      expect(find.byType(NesIcon), findsOneWidget);
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
      expect(find.byType(NesIcon), findsOneWidget);
    });

    testWidgets('selects an item', (tester) async {
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
  });
}
