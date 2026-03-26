import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

const _testColors = [
  Color(0xff000000),
  Color(0xff111111),
  Color(0xff333333),
  Color(0xff555555),
  Color(0xff777777),
  Color(0xff999999),
  Color(0xffbbbbbb),
  Color(0xffdddddd),
];

void main() {
  group('NesPalette', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesPalette(
              value: const Color(0xff209cee),
              colors: _testColors,
              onChanged: (color) {},
            ),
          ),
        ),
      );

      expect(find.byType(NesPalette), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('displays color preview', (tester) async {
      const testColor = Color(0xffff0000);

      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesPalette(
              value: testColor,
              colors: _testColors,
              onChanged: (color) {},
            ),
          ),
        ),
      );

      final containers = tester.widgetList<Container>(find.byType(Container));
      final colorPreview = containers.firstWhere(
        (c) {
          final decoration = c.decoration;
          if (decoration is! BoxDecoration) return false;
          return decoration.color?.toARGB32() == testColor.toARGB32();
        },
      );
      expect(colorPreview, isNotNull);
    });

    testWidgets('calls onChanged when a color is selected', (tester) async {
      Color? selectedColor;

      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesPalette(
              value: const Color(0xff209cee),
              colors: _testColors,
              onChanged: (color) {
                selectedColor = color;
              },
            ),
          ),
        ),
      );

      final colorSwatches = find.byType(GestureDetector);
      await tester.tap(colorSwatches.at(1));
      await tester.pumpAndSettle();

      expect(selectedColor, isNotNull);
    });

    testWidgets('updates hex input when color changes', (tester) async {
      const testColor = Color(0xffff5733);

      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return NesPalette(
                  value: testColor,
                  colors: _testColors,
                  onChanged: (color) {},
                );
              },
            ),
          ),
        ),
      );

      final textField = find.byType(TextField);
      final textFieldWidget = tester.widget<TextField>(textField);
      expect(textFieldWidget.controller?.text, contains('#'));
    });

    testWidgets('respects colors parameter', (tester) async {
      const customColors = [
        Colors.red,
        Colors.green,
        Colors.blue,
      ];

      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesPalette(
              value: Colors.red,
              colors: customColors,
              onChanged: (color) {},
            ),
          ),
        ),
      );

      final textField = find.byType(TextField);
      expect(textField, findsOneWidget);

      Color? selectedColor;
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesPalette(
              value: Colors.red,
              colors: customColors,
              onChanged: (color) {
                selectedColor = color;
              },
            ),
          ),
        ),
      );

      final gestures = find.byType(GestureDetector);
      await tester.tap(gestures.at(1));
      await tester.pumpAndSettle();

      expect(selectedColor, isNotNull);
      expect(
        customColors.any((c) => c.toARGB32() == selectedColor!.toARGB32()),
        isTrue,
      );
    });

    testWidgets('respects columnCount parameter', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesPalette(
              value: const Color(0xff209cee),
              colors: _testColors,
              onChanged: (color) {},
              columnCount: 4,
            ),
          ),
        ),
      );

      expect(find.byType(NesPalette), findsOneWidget);
    });

    testWidgets('respects size parameter', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesPalette(
              value: const Color(0xff209cee),
              colors: _testColors,
              onChanged: (color) {},
              size: 48,
            ),
          ),
        ),
      );

      expect(find.byType(NesPalette), findsOneWidget);
    });

    testWidgets('hides hex input when enableCustomInput is false', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesPalette(
              value: const Color(0xff209cee),
              colors: _testColors,
              onChanged: (color) {},
              enableCustomInput: false,
            ),
          ),
        ),
      );

      expect(find.byType(TextField), findsNothing);
    });

    testWidgets('shows hex input by default', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesPalette(
              value: const Color(0xff209cee),
              colors: _testColors,
              onChanged: (color) {},
            ),
          ),
        ),
      );

      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('validates hex input on submit', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesPalette(
              value: const Color(0xff209cee),
              colors: _testColors,
              onChanged: (color) {},
            ),
          ),
        ),
      );

      final textField = find.byType(TextField);
      await tester.enterText(textField, 'invalid');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      expect(find.text('Invalid hex color'), findsOneWidget);
    });
  });
}
