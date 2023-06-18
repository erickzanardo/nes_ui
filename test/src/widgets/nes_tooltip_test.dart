import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  group('NesTooltip', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const Scaffold(
            body: NesTooltip(
              message: 'Test',
              child: Text('Child'),
            ),
          ),
        ),
      );

      expect(find.byType(NesTooltip), findsOneWidget);
    });

    testWidgets('renders its child correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const Scaffold(
            body: NesTooltip(
              message: 'Test',
              child: Text('Child'),
            ),
          ),
        ),
      );

      expect(find.text('Child'), findsOneWidget);
    });
  });
}
