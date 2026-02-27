import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  group('NesPressable', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const Scaffold(body: NesPressable(child: Text('Hello'))),
        ),
      );

      expect(find.byType(NesPressable), findsOneWidget);
      expect(find.text('Hello'), findsOneWidget);
    });

    testWidgets('calls the callbacks correctly', (tester) async {
      var calls = 0;

      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesPressable(
              onPress: () => calls++,
              onPressStart: () => calls++,
              onPressEnd: () => calls++,
              child: const Text('Hello'),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Hello'));
      await tester.pumpAndSettle();

      expect(calls, equals(3));
    });
  });
}
