import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  group('NesIconButton', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesIconButton(onPress: () {}, icon: NesIcons.add),
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
            body: NesIconButton(onPress: () => calls++, icon: NesIcons.add),
          ),
        ),
      );

      await tester.tap(find.byType(NesIcon));
      await tester.pumpAndSettle();

      expect(calls, equals(1));
    });

    testWidgets('is disabled when there is no listener', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(body: NesIconButton(icon: NesIcons.add)),
        ),
      );

      final nesPressable = tester.widget<NesPressable>(
        find.byType(NesPressable),
      );
      expect(nesPressable.disabled, isTrue);
    });

    testWidgets('is not disabled when there is is a onPress', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesIconButton(onPress: () {}, icon: NesIcons.add),
          ),
        ),
      );

      final nesPressable = tester.widget<NesPressable>(
        find.byType(NesPressable),
      );
      expect(nesPressable.disabled, isFalse);
    });

    testWidgets('is not disabled when there is is a onPressStart', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesIconButton(onPressStart: () {}, icon: NesIcons.add),
          ),
        ),
      );

      final nesPressable = tester.widget<NesPressable>(
        find.byType(NesPressable),
      );
      expect(nesPressable.disabled, isFalse);
    });

    testWidgets('is not disabled when there is is a onPressEnd', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesIconButton(onPressEnd: () {}, icon: NesIcons.add),
          ),
        ),
      );

      final nesPressable = tester.widget<NesPressable>(
        find.byType(NesPressable),
      );
      expect(nesPressable.disabled, isFalse);
    });

    testWidgets('is disabled when there is is a listener but disabled = true', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesIconButton(
              onPressEnd: () {},
              disabled: true,
              icon: NesIcons.add,
            ),
          ),
        ),
      );

      final nesPressable = tester.widget<NesPressable>(
        find.byType(NesPressable),
      );
      expect(nesPressable.disabled, isTrue);
    });
  });
}
