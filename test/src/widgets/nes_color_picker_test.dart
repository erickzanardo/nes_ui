import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  group('NesColorPicker', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesColorPicker(
              value: const Color(0xff209cee),
              onChanged: (color) {},
            ),
          ),
        ),
      );

      expect(find.byType(NesColorPicker), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('displays color preview', (tester) async {
      const testColor = Color(0xffff0000);

      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesColorPicker(value: testColor, onChanged: (color) {}),
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
            body: NesColorPicker(
              value: const Color(0xff209cee),
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
                return NesColorPicker(value: testColor, onChanged: (color) {});
              },
            ),
          ),
        ),
      );

      final textField = find.byType(TextField);
      final textFieldWidget = tester.widget<TextField>(textField);
      expect(textFieldWidget.controller?.text, contains('#'));
    });

    testWidgets('respects presetColors parameter', (tester) async {
      const customColors = [
        Colors.red,
        Colors.green,
        Colors.blue,
      ];

      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesColorPicker(
              value: Colors.red,
              onChanged: (color) {},
              presetColors: customColors,
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
            body: NesColorPicker(
              value: Colors.red,
              onChanged: (color) {
                selectedColor = color;
              },
              presetColors: customColors,
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
            body: NesColorPicker(
              value: const Color(0xff209cee),
              onChanged: (color) {},
              columnCount: 4,
            ),
          ),
        ),
      );

      expect(find.byType(NesColorPicker), findsOneWidget);
    });

    testWidgets('respects size parameter', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesColorPicker(
              value: const Color(0xff209cee),
              onChanged: (color) {},
              size: 48,
            ),
          ),
        ),
      );

      expect(find.byType(NesColorPicker), findsOneWidget);
    });

    testWidgets('hides hex input when enableCustomInput is false', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesColorPicker(
              value: const Color(0xff209cee),
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
            body: NesColorPicker(
              value: const Color(0xff209cee),
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
            body: NesColorPicker(
              value: const Color(0xff209cee),
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
