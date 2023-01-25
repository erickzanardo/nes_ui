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

    testWidgets('renders [NesIcons.check] when true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: NesCheckBox(
            value: true,
            onChange: (_) {},
          ),
        ),
      );

      await tester.tap(find.byType(NesCheckBox));

      final icon = tester.widget<NesIcon>(find.byType(NesIcon));

      expect(icon.iconData, equals(NesIcons.instance.check));
    });
  });
}
