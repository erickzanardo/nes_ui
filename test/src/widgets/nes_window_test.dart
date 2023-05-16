import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  group('NesWindow', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const Scaffold(
            body: NesWindow(),
          ),
        ),
      );

      expect(find.byType(NesWindow), findsOneWidget);
    });

    testWidgets('renders a title', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const Scaffold(
            body: NesWindow(
              title: 'Title',
            ),
          ),
        ),
      );

      expect(find.text('Title'), findsOneWidget);
    });

    testWidgets('renders an icon', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesWindow(
              icon: NesIcons.instance.sword,
            ),
          ),
        ),
      );

      expect(find.byType(NesIcon), findsOneWidget);
    });

    testWidgets('renders its child', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const Scaffold(
            body: NesWindow(
              child: Text('child'),
            ),
          ),
        ),
      );

      expect(find.text('child'), findsOneWidget);
    });

    testWidgets(
      'renders the close icon when a onClose is provided',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: flutterNesTheme(),
            home: Scaffold(
              body: NesWindow(
                child: const Text('child'),
                onClose: () {},
              ),
            ),
          ),
        );

        expect(find.byType(NesIconButton), findsOneWidget);
      },
    );

    testWidgets(
      'calls onClose when clicking the close icon',
      (tester) async {
        var called = false;
        await tester.pumpWidget(
          MaterialApp(
            theme: flutterNesTheme(),
            home: Scaffold(
              body: NesWindow(
                child: const Text('child'),
                onClose: () {
                  called = true;
                },
              ),
            ),
          ),
        );

        await tester.tap(find.byType(NesIcon));
        await tester.pump();

        expect(called, isTrue);
      },
    );

    group('when is moveable and resizable', () {
      testWidgets('renders correctly', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: flutterNesTheme(),
            home: Scaffold(
              body: NesWindow(
                onMove: (_) {},
                onResize: (_) {},
              ),
            ),
          ),
        );

        expect(find.byType(NesWindow), findsOneWidget);
      });

      testWidgets('renders a title', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: flutterNesTheme(),
            home: Scaffold(
              body: NesWindow(
                title: 'Title',
                onMove: (_) {},
                onResize: (_) {},
              ),
            ),
          ),
        );

        expect(find.text('Title'), findsOneWidget);
      });

      testWidgets('renders an icon', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: flutterNesTheme(),
            home: Scaffold(
              body: NesWindow(
                icon: NesIcons.instance.sword,
                onMove: (_) {},
                onResize: (_) {},
              ),
            ),
          ),
        );

        expect(find.byType(NesIcon), findsOneWidget);
      });

      testWidgets('renders its child', (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            theme: flutterNesTheme(),
            home: Scaffold(
              body: NesWindow(
                child: const Text('child'),
                onMove: (_) {},
                onResize: (_) {},
              ),
            ),
          ),
        );

        expect(find.text('child'), findsOneWidget);
      });
    });
  });
}
