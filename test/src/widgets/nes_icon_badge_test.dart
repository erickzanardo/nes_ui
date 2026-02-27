import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  group('NesIconBadge', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesIconBadge(iconData: NesIcons.check, badge: '1'),
          ),
        ),
      );

      expect(find.byType(NesIconBadge), findsOneWidget);
      expect(find.byType(NesIcon), findsOneWidget);
      expect(find.text('1'), findsOneWidget);
    });
  });
}
