import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  group('NesSplitPanel', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: SizedBox(
            width: 300,
            height: 300,
            child: NesSplitPanel(
              children: [
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.green,
                ),
                Container(
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(NesSplitPanel), findsOneWidget);
    });

    testWidgets('renders correctly when is vertical', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: SizedBox(
            width: 300,
            height: 300,
            child: NesSplitPanel(
              orientation: Axis.vertical,
              children: [
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.green,
                ),
                Container(
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(NesSplitPanel), findsOneWidget);
    });

    testWidgets('can resize horizontally', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: SizedBox(
            width: 300,
            height: 300,
            child: NesSplitPanel(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Text(
                      'W: ${constraints.maxWidth}',
                      key: const Key('left_panel'),
                    );
                  },
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Text(
                      'W: ${constraints.maxWidth}',
                      key: const Key('right_panel'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );

      final leftPanelText =
          tester.widget<Text>(find.byKey(const Key('left_panel'))).data;
      final rightPanelText =
          tester.widget<Text>(find.byKey(const Key('right_panel'))).data;

      await tester.drag(
        find.byType(NesIcon),
        const Offset(-100, 0),
      );

      await tester.pumpAndSettle();

      final updatedLeftPanelText =
          tester.widget<Text>(find.byKey(const Key('left_panel'))).data;
      final updatedRightPanelText =
          tester.widget<Text>(find.byKey(const Key('right_panel'))).data;

      expect(leftPanelText, isNot(equals(updatedLeftPanelText)));
      expect(rightPanelText, isNot(equals(updatedRightPanelText)));
    });

    testWidgets('can resize with initial values', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: SizedBox(
            width: 300,
            height: 300,
            child: NesSplitPanel(
              initialSizes: const [.2, .8],
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Text(
                      'W: ${constraints.maxWidth}',
                      key: const Key('left_panel'),
                    );
                  },
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Text(
                      'W: ${constraints.maxWidth}',
                      key: const Key('right_panel'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );

      final leftPanelText =
          tester.widget<Text>(find.byKey(const Key('left_panel'))).data;
      final rightPanelText =
          tester.widget<Text>(find.byKey(const Key('right_panel'))).data;

      await tester.drag(
        find.byType(NesIcon),
        const Offset(-100, 0),
      );

      await tester.pumpAndSettle();

      final updatedLeftPanelText =
          tester.widget<Text>(find.byKey(const Key('left_panel'))).data;
      final updatedRightPanelText =
          tester.widget<Text>(find.byKey(const Key('right_panel'))).data;

      expect(leftPanelText, isNot(equals(updatedLeftPanelText)));
      expect(rightPanelText, isNot(equals(updatedRightPanelText)));
    });

    testWidgets('can resize vertically', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: SizedBox(
            width: 300,
            height: 300,
            child: NesSplitPanel(
              orientation: Axis.vertical,
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Text(
                      'H: ${constraints.maxHeight}',
                      key: const Key('top_panel'),
                    );
                  },
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Text(
                      'H: ${constraints.maxHeight}',
                      key: const Key('bottom_panel'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );

      final topPanelText =
          tester.widget<Text>(find.byKey(const Key('top_panel'))).data;
      final bottomPanelText =
          tester.widget<Text>(find.byKey(const Key('bottom_panel'))).data;

      await tester.drag(
        find.byType(NesIcon),
        const Offset(0, -100),
      );

      await tester.pumpAndSettle();

      final updatedTopPanelText =
          tester.widget<Text>(find.byKey(const Key('top_panel'))).data;
      final updatedBottomPanelText =
          tester.widget<Text>(find.byKey(const Key('bottom_panel'))).data;

      expect(topPanelText, isNot(equals(updatedTopPanelText)));
      expect(bottomPanelText, isNot(equals(updatedBottomPanelText)));
    });
  });
}
