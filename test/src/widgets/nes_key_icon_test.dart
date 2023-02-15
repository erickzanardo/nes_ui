import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  group('NesIcon', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const Scaffold(
            body: NesKeyIcon(
              buttonKey: 'A',
            ),
          ),
        ),
      );

      expect(find.byType(NesKeyIcon), findsOneWidget);
    });

    testWidgets('renders pressed correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const Scaffold(
            body: NesKeyIcon(
              buttonKey: 'A',
              pressed: true,
            ),
          ),
        ),
      );

      expect(find.byType(NesKeyIcon), findsOneWidget);
    });
  });
}
