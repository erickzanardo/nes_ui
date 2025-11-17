// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nes_ui/nes_ui.dart';

class _MockAnimation<T> extends Mock implements Animation<T> {}

void main() {
  group('NesVerticalCloseTransition', () {
    late Animation<double> animation;

    setUp(() {
      animation = _MockAnimation();
    });

    testWidgets('does not renders its child before half', (tester) async {
      when(() => animation.value).thenReturn(.4);
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: NesVerticalCloseTransition(
            animation: animation,
            child: Text('Child'),
          ),
        ),
      );

      expect(find.text('Child'), findsNothing);
    });

    testWidgets('renders its child after half', (tester) async {
      when(() => animation.value).thenReturn(.6);
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: NesVerticalCloseTransition(
            animation: animation,
            child: Text('Child'),
          ),
        ),
      );

      expect(find.text('Child'), findsOneWidget);
    });

    testWidgets('renders two colored box', (tester) async {
      when(() => animation.value).thenReturn(.6);
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: NesVerticalCloseTransition(
            animation: animation,
            child: Text('Child'),
          ),
        ),
      );

      expect(find.byType(NesVerticalCloseColoredBox), findsNWidgets(2));
    });
  });
}
