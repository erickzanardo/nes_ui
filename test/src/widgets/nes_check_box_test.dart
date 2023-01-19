import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  group('NesCheckBox', () {
    testWidgets('can receive input', (tester) async {
      bool? value;
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: NesCheckBox(
            value: false,
            onChange: (newValue) {
              value = newValue;
            },
          ),
        ),
      );

      await tester.tap(find.byType(NesCheckBox));
      expect(value, isTrue);
    });
  });
}
