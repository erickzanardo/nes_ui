import 'package:alchemist/alchemist.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

extension PumpNessButton on WidgetTester {
  Future<void> pumpButton({
    NesButtonType? buttonType,
    VoidCallback? onPressed,
    Widget? child,
  }) async {
    return pumpWidget(
      MaterialApp(
        theme: flutterNesTheme(),
        home: NesButton(
          type: buttonType ?? NesButtonType.error,
          onPressed: onPressed ?? () {},
          child: child ?? const Text('The Child'),
        ),
      ),
    );
  }
}

void main() {
  group('NesButton', () {
    testWidgets('renders its child', (tester) async {
      var pressed = false;
      await tester.pumpButton(
        buttonType: NesButtonType.primary,
        onPressed: () {
          pressed = true;
        },
        child: const Text('The Child'),
      );

      await tester.tap(find.text('The Child'));
      expect(pressed, isTrue);
    });

    group('reders correctly based on the NesButtonType', () {
      testWidgets('when [NesButtonType.normal]', (tester) async {
        await tester.pumpButton(
          buttonType: NesButtonType.normal,
        );

        expect(find.byType(NesButton), findsOneWidget);
      });

      testWidgets('when [NesButtonType.success]', (tester) async {
        await tester.pumpButton(
          buttonType: NesButtonType.success,
        );

        expect(find.byType(NesButton), findsOneWidget);
      });

      testWidgets('when [NesButtonType.error]', (tester) async {
        await tester.pumpButton(
          buttonType: NesButtonType.error,
        );

        expect(find.byType(NesButton), findsOneWidget);
      });

      testWidgets('when [NesButtonType.warning]', (tester) async {
        await tester.pumpButton(
          buttonType: NesButtonType.warning,
        );

        expect(find.byType(NesButton), findsOneWidget);
      });
    });

    group('hover layout', () {
      goldenTest(
        'renders hover layout when there is a hover',
        builder: () => GoldenTestGroup(
          scenarioConstraints: const BoxConstraints(maxWidth: 600),
          children: [
            GoldenTestScenario(
              name: 'when is hovered',
              child: NesButton(
                onPressed: () {},
                type: NesButtonType.normal,
                child: const Text('child'),
              ),
            ),
          ],
        ),
        fileName: 'nes_button/hovered_button',
        whilePerforming: (tester) async {
          final gesture = await tester.createGesture(
            kind: PointerDeviceKind.mouse,
          );
          await gesture.addPointer(location: Offset.zero);
          await gesture.moveTo(tester.getCenter(find.byType(NesButton)));
          await tester.pumpAndSettle();
          return null;
        },
      );

      goldenTest(
        'renders layout',
        builder: () => GoldenTestGroup(
          scenarioConstraints: const BoxConstraints(maxWidth: 600),
          children: [
            GoldenTestScenario(
              name: 'when is pressed',
              child: NesButton(
                onPressed: () {},
                type: NesButtonType.normal,
                child: const Text('child'),
              ),
            ),
          ],
        ),
        fileName: 'nes_button/pressed_button',
        whilePerforming: (tester) async {
          await tester.longPress(find.byType(NesButton));
          return null;
        },
      );

      goldenTest(
        'renders layout',
        builder: () => GoldenTestGroup(
          scenarioConstraints: const BoxConstraints(maxWidth: 600),
          children: [
            GoldenTestScenario(
              name: 'when exit hover',
              child: NesButton(
                onPressed: () {},
                type: NesButtonType.normal,
                child: const Text('child'),
              ),
            ),
          ],
        ),
        fileName: 'nes_button/exit_hover',
        whilePerforming: (tester) async {
          final gesture = await tester.createGesture(
            kind: PointerDeviceKind.mouse,
          );
          await gesture.addPointer(location: Offset.zero);
          await gesture.moveTo(tester.getCenter(find.byType(NesButton)));
          await tester.pump();
          await gesture.moveTo(const Offset(400, 300));
          await tester.pump();
          return null;
        },
      );
    });
  });
}
