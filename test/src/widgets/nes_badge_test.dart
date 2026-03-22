import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  group('NesBadge', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const Scaffold(
            body: NesBadge(badge: '5', child: Icon(Icons.star)),
          ),
        ),
      );

      expect(find.byType(NesBadge), findsOneWidget);
      expect(find.byType(Icon), findsOneWidget);
      expect(find.text('5'), findsOneWidget);
    });

    testWidgets('renders with NesIcon child', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesBadge(
              badge: '99+',
              child: NesIcon(iconData: NesIcons.heart),
            ),
          ),
        ),
      );

      expect(find.byType(NesBadge), findsOneWidget);
      expect(find.byType(NesIcon), findsOneWidget);
      expect(find.text('99+'), findsOneWidget);
    });
  });
}
