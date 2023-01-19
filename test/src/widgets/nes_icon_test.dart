import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  group('NesIcon', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesIcon(
              iconData: NesIcons.instance.check,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(NesIcon));
    });
  });
}
