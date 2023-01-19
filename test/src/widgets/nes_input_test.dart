import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes/nes.dart';

void main() {
  group('NesInput', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const Scaffold(body: TextField()),
        ),
      );

      await tester.tap(find.byType(TextField));
    });
  });
}
