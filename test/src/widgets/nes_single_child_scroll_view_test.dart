import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  group('NesContainer', () {
    testWidgets('renders its child', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: SizedBox(
            width: 200,
            height: 200,
            child: NesSingleChildScrollView(
              child: Column(
                children: List.generate(20, (i) => Text('The Child $i')),
              ),
            ),
          ),
        ),
      );

      expect(find.text('The Child 0'), findsOneWidget);
    });

    testWidgets('renders a scrollbar', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: SizedBox(
            width: 200,
            height: 200,
            child: NesSingleChildScrollView(
              child: Column(
                children: List.generate(20, (i) => Text('The Child $i')),
              ),
            ),
          ),
        ),
      );

      expect(find.text('The Child 0'), findsOneWidget);
    });

    testWidgets('can scroll when clicking in the icons', (tester) async {
      final scrollController = ScrollController();
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: SizedBox(
            width: 200,
            height: 200,
            child: NesSingleChildScrollView(
              scrollController: scrollController,
              child: Column(
                children: List.generate(20, (i) => Text('The Child $i')),
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(NesIcon).last);
      await tester.pumpAndSettle();

      expect(scrollController.offset, isNot(equals(0.0)));

      await tester.tap(find.byType(NesIcon).first);
      await tester.pumpAndSettle();

      expect(scrollController.offset, equals(0.0));
    });

    testWidgets("can't find children down in the scroll", (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: SizedBox(
            width: 200,
            height: 200,
            child: NesSingleChildScrollView(
              child: Column(
                children: List.generate(20, (i) => Text('The Child $i')),
              ),
            ),
          ),
        ),
      );

      expect(find.text('The Child 20'), findsNothing);
    });

    testWidgets('clips the child when clipContent is true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: SizedBox(
            width: 200,
            height: 200,
            child: NesSingleChildScrollView(
              clipContent: true,
              child: Column(
                children: List.generate(20, (i) => Text('The Child $i')),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(UnconstrainedBox), findsOneWidget);
    });
  });
}
