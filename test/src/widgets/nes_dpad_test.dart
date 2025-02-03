// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  group('NesContainer', () {
    testWidgets('renders its child', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const NesDpad(),
        ),
      );

      expect(find.byType(NesDpad), findsOneWidget);
      // By default the dpad has 4 icons
      expect(find.byType(NesIcon), findsNWidgets(4));
    });
  });
}
