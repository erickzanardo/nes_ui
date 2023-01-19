import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes.dart';

void main() {
  group('NesContainer', () {
    testWidgets('renders its child', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const NesContainer(
            child: Text('The Child'),
          ),
        ),
      );

      expect(find.text('The Child'), findsOneWidget);
    });
  });
}
