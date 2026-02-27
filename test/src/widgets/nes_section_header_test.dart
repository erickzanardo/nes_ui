import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  group('NesSectionHeader', () {
    testWidgets('renders', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const Scaffold(body: NesSectionHeader(title: 'Title')),
        ),
      );

      expect(find.text('Title'), findsOneWidget);
    });
  });
}
