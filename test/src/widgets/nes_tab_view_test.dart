import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  group('NesTabView', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const Scaffold(
            body: NesTabView(
              tabs: [
                NesTabItem(label: 'Tab 1', child: Text('Tab 1 content')),
                NesTabItem(label: 'Tab 2', child: Text('Tab 2 content')),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(NesTabView), findsOneWidget);
      expect(find.text('Tab 1'), findsOneWidget);
      expect(find.text('Tab 1 content'), findsOneWidget);
      expect(find.text('Tab 2'), findsOneWidget);
      expect(find.text('Tab 2 content'), findsNothing);
    });

    testWidgets(
      'renders the last tab when the initial index is out of bounds',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: flutterNesTheme(),
            home: const Scaffold(
              body: NesTabView(
                initialTabIndex: 99,
                tabs: [
                  NesTabItem(label: 'Tab 1', child: Text('Tab 1 content')),
                  NesTabItem(label: 'Tab 2', child: Text('Tab 2 content')),
                ],
              ),
            ),
          ),
        );

        expect(find.byType(NesTabView), findsOneWidget);
        expect(find.text('Tab 1'), findsOneWidget);
        expect(find.text('Tab 1 content'), findsNothing);
        expect(find.text('Tab 2'), findsOneWidget);
        expect(find.text('Tab 2 content'), findsOneWidget);
      },
    );

    testWidgets('renders correctly with initial tab index', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const Scaffold(
            body: NesTabView(
              initialTabIndex: 1,
              tabs: [
                NesTabItem(label: 'Tab 1', child: Text('Tab 1 content')),
                NesTabItem(label: 'Tab 2', child: Text('Tab 2 content')),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(NesTabView), findsOneWidget);
      expect(find.text('Tab 1'), findsOneWidget);
      expect(find.text('Tab 1 content'), findsNothing);
      expect(find.text('Tab 2'), findsOneWidget);
      expect(find.text('Tab 2 content'), findsOneWidget);
    });

    testWidgets('can select a different tab', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const Scaffold(
            body: NesTabView(
              tabs: [
                NesTabItem(label: 'Tab 1', child: Text('Tab 1 content')),
                NesTabItem(label: 'Tab 2', child: Text('Tab 2 content')),
              ],
            ),
          ),
        ),
      );

      await tester.tap(find.text('Tab 2'));
      await tester.pumpAndSettle();
      expect(find.text('Tab 1'), findsOneWidget);
      expect(find.text('Tab 1 content'), findsNothing);
      expect(find.text('Tab 2'), findsOneWidget);
      expect(find.text('Tab 2 content'), findsOneWidget);
    });
  });
}
