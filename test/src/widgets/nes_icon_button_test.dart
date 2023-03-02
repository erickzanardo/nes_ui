import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  group('NesPressable', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesIconButton(
              onPress: () {},
              icon: NesIcons.instance.add,
            ),
          ),
        ),
      );

      expect(find.byType(NesPressable), findsOneWidget);
    });

    testWidgets('calls the callbacks correctly', (tester) async {
      var calls = 0;

      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesIconButton(
              onPress: () => calls++,
              icon: NesIcons.instance.add,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(NesIcon));
      await tester.pumpAndSettle();

      expect(calls, equals(1));
    });
  });
}
