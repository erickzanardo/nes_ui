import 'package:flutter/material.dart';
import 'package:flutter_nes/flutter_nes.dart';
import 'package:flutter_test/flutter_test.dart';

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
