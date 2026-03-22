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
            body: NesBadge(child: Icon(Icons.star), badge: '5'),
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
          home: const Scaffold(
            body: NesBadge(
              child: NesIcon(iconData: NesIcons.heart),
              badge: '99+',
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
