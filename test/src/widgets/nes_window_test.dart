import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  group('NesWindow', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const Scaffold(
            body: NesWindow(),
          ),
        ),
      );

      expect(find.byType(NesWindow), findsOneWidget);
    });

    testWidgets('renders a title', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const Scaffold(
            body: NesWindow(
              title: 'Title',
            ),
          ),
        ),
      );

      expect(find.text('Title'), findsOneWidget);
    });

    testWidgets('renders an icon', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesWindow(
              icon: NesIcons.instance.sword,
            ),
          ),
        ),
      );

      expect(find.byType(NesIcon), findsOneWidget);
    });

    testWidgets('renders its child', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const Scaffold(
            body: NesWindow(
              child: Text('child'),
            ),
          ),
        ),
      );

      expect(find.text('child'), findsOneWidget);
    });
  });
}
