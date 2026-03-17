// ignore_for_file: cascade_invocations
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

/// Fixed seed for deterministic random values.
const _testSeed = 42;

Widget _buildApp({
  NesShakeEffectController? controller,
  bool shaking = false,
  double intensity = 4.0,
  Duration duration = const Duration(milliseconds: 300),
  int? seed = _testSeed,
}) {
  return MaterialApp(
    theme: flutterNesTheme(),
    home: Scaffold(
      body: NesShakeEffect(
        controller: controller,
        shaking: shaking,
        intensity: intensity,
        duration: duration,
        seed: seed,
        child: const Text('child'),
      ),
    ),
  );
}

/// Finds the [Transform] widget that is a direct descendant of
/// [NesShakeEffect].
Finder _findShakeTransform() {
  return find.descendant(
    of: find.byType(NesShakeEffect),
    matching: find.byType(Transform),
  );
}

/// Extracts the translation offset from the shake effect's transform.
Offset _getShakeOffset(WidgetTester tester) {
  final transform = tester.widget<Transform>(_findShakeTransform().first);
  return Offset(
    transform.transform.storage[12],
    transform.transform.storage[13],
  );
}

void main() {
  // ═══════════════════════════════════════════
  //  Controller unit tests
  // ═══════════════════════════════════════════
  group('NesShakeEffectController', () {
    test('initial shouldShake is false', () {
      final controller = NesShakeEffectController();
      expect(controller.shouldShake, isFalse);
      controller.dispose();
    });

    test('shake() sets shouldShake to true and notifies listeners', () {
      final controller = NesShakeEffectController();
      var notifyCount = 0;
      controller.addListener(() => notifyCount++);

      controller.shake();

      expect(controller.shouldShake, isTrue);
      expect(notifyCount, 1);
      controller.dispose();
    });

    test('multiple shake() calls each notify', () {
      final controller = NesShakeEffectController();
      var notifyCount = 0;
      controller.addListener(() => notifyCount++);

      controller.shake();
      controller.shake();

      expect(notifyCount, 2);
      controller.dispose();
    });

    test('reset() sets shouldShake back to false without notifying', () {
      final controller = NesShakeEffectController();
      controller.shake();

      var notifiedAfterReset = false;
      controller.addListener(() => notifiedAfterReset = true);
      controller.reset();

      expect(controller.shouldShake, isFalse);
      expect(notifiedAfterReset, isFalse);
      controller.dispose();
    });
  });

  // ═══════════════════════════════════════════
  //  Widget spec tests
  // ═══════════════════════════════════════════
  group('NesShakeEffect', () {
    // --- Rendering ---

    testWidgets('renders its child widget', (tester) async {
      await tester.pumpWidget(_buildApp());
      expect(find.text('child'), findsOneWidget);
    });

    // --- Declarative (shaking: bool) ---

    testWidgets('offset is zero when shaking is false', (tester) async {
      await tester.pumpWidget(_buildApp());
      expect(_getShakeOffset(tester), Offset.zero);
    });

    testWidgets('offset is non-zero when shaking is true', (tester) async {
      await tester.pumpWidget(_buildApp(shaking: true));
      await tester.pump(const Duration(milliseconds: 16));

      final offset = _getShakeOffset(tester);
      expect(offset, isNot(Offset.zero));
    });

    testWidgets('offset resets to zero when shaking switches to false',
        (tester) async {
      await tester.pumpWidget(_buildApp(shaking: true));
      await tester.pump(const Duration(milliseconds: 50));
      expect(_getShakeOffset(tester), isNot(Offset.zero));

      await tester.pumpWidget(_buildApp());
      await tester.pump();
      expect(_getShakeOffset(tester), Offset.zero);
    });

    testWidgets('continuous shake restarts after animation completes',
        (tester) async {
      await tester.pumpWidget(
        _buildApp(
          shaking: true,
          duration: const Duration(milliseconds: 100),
        ),
      );

      // Let first cycle complete and one frame of next cycle start
      await tester.pump(const Duration(milliseconds: 100));
      await tester.pump(const Duration(milliseconds: 16));

      expect(_getShakeOffset(tester), isNot(Offset.zero));
    });

    // --- Imperative (controller) ---

    testWidgets('controller.shake() starts animation', (tester) async {
      final controller = NesShakeEffectController();
      await tester.pumpWidget(_buildApp(controller: controller));

      controller.shake();
      await tester.pump(const Duration(milliseconds: 16));

      expect(_getShakeOffset(tester), isNot(Offset.zero));
      controller.dispose();
    });

    testWidgets('controller shake auto-stops and resets offset to zero',
        (tester) async {
      final controller = NesShakeEffectController();
      await tester.pumpWidget(
        _buildApp(
          controller: controller,
          duration: const Duration(milliseconds: 100),
        ),
      );

      controller.shake();
      await tester.pumpAndSettle();

      expect(_getShakeOffset(tester), Offset.zero);
      expect(controller.shouldShake, isFalse);
      controller.dispose();
    });

    // --- Intensity ---

    testWidgets('offset never exceeds intensity bounds', (tester) async {
      const intensity = 5.0;
      await tester.pumpWidget(
        _buildApp(
          shaking: true,
          intensity: intensity,
          duration: const Duration(milliseconds: 500),
        ),
      );

      for (var i = 0; i < 20; i++) {
        await tester.pump(const Duration(milliseconds: 16));
        final offset = _getShakeOffset(tester);
        expect(offset.dx.abs(), lessThanOrEqualTo(intensity));
        expect(offset.dy.abs(), lessThanOrEqualTo(intensity));
      }
    });

    testWidgets('intensity of zero produces no offset', (tester) async {
      await tester.pumpWidget(
        _buildApp(shaking: true, intensity: 0),
      );

      for (var i = 0; i < 10; i++) {
        await tester.pump(const Duration(milliseconds: 16));
        expect(_getShakeOffset(tester), Offset.zero);
      }
    });

    testWidgets('higher intensity produces larger offsets', (tester) async {
      final controller = NesShakeEffectController();

      // Low intensity — collect max magnitude
      await tester.pumpWidget(
        _buildApp(controller: controller, intensity: 2),
      );
      controller.shake();
      var maxLow = 0.0;
      for (var i = 0; i < 10; i++) {
        await tester.pump(const Duration(milliseconds: 16));
        final mag = _getShakeOffset(tester).distance;
        if (mag > maxLow) maxLow = mag;
      }

      // High intensity — collect max magnitude (same seed → same random
      // sequence restarts because we rebuild with new widget)
      await tester.pumpWidget(
        _buildApp(controller: controller, intensity: 20),
      );
      controller.shake();
      var maxHigh = 0.0;
      for (var i = 0; i < 10; i++) {
        await tester.pump(const Duration(milliseconds: 16));
        final mag = _getShakeOffset(tester).distance;
        if (mag > maxHigh) maxHigh = mag;
      }

      expect(maxHigh, greaterThan(maxLow));
      controller.dispose();
    });

    // --- Decay ---

    testWidgets('offset decays over animation duration', (tester) async {
      final controller = NesShakeEffectController();
      await tester.pumpWidget(
        _buildApp(
          controller: controller,
          intensity: 100,
          duration: const Duration(milliseconds: 1000),
        ),
      );

      controller.shake();

      // Collect magnitudes at early, mid, and late stages
      await tester.pump(const Duration(milliseconds: 100)); // 10%
      final earlyMag = _getShakeOffset(tester).distance;

      await tester.pump(const Duration(milliseconds: 400)); // 50%
      final midMag = _getShakeOffset(tester).distance;

      await tester.pump(const Duration(milliseconds: 400)); // 90%
      final lateMag = _getShakeOffset(tester).distance;

      // Decay means: early > mid > late (with high intensity + seed this
      // is statistically guaranteed)
      expect(earlyMag, greaterThan(midMag), reason: 'early > mid');
      expect(midMag, greaterThan(lateMag), reason: 'mid > late');
      controller.dispose();
    });

    // --- didUpdateWidget ---

    testWidgets('duration change is applied via didUpdateWidget',
        (tester) async {
      final controller = NesShakeEffectController();

      // Start with 200ms duration
      await tester.pumpWidget(
        _buildApp(
          controller: controller,
          duration: const Duration(milliseconds: 200),
        ),
      );

      // Update to 1000ms duration
      await tester.pumpWidget(
        _buildApp(
          controller: controller,
          duration: const Duration(milliseconds: 1000),
        ),
      );

      controller.shake();
      // At 300ms — old duration would have ended, new one still running
      await tester.pump(const Duration(milliseconds: 300));
      expect(_getShakeOffset(tester), isNot(Offset.zero));

      await tester.pumpAndSettle();
      controller.dispose();
    });

    // --- effectiveController lifecycle ---

    testWidgets('works with no external controller (internal created)',
        (tester) async {
      // Just verify no exceptions are thrown
      await tester.pumpWidget(_buildApp(shaking: true));
      await tester.pump(const Duration(milliseconds: 50));
      await tester.pumpWidget(_buildApp());
      await tester.pumpAndSettle();
    });

    testWidgets('old controller has no effect after swap', (tester) async {
      final oldController = NesShakeEffectController();
      await tester.pumpWidget(_buildApp(controller: oldController));

      // Swap to no controller
      await tester.pumpWidget(_buildApp());
      await tester.pump();

      // Old controller should have no effect
      oldController.shake();
      await tester.pump(const Duration(milliseconds: 50));
      expect(_getShakeOffset(tester), Offset.zero);

      oldController.dispose();
    });

    testWidgets('swapping from internal to external controller works',
        (tester) async {
      // Start with internal
      await tester.pumpWidget(_buildApp());

      // Swap to external
      final controller = NesShakeEffectController();
      await tester.pumpWidget(_buildApp(controller: controller));

      controller.shake();
      await tester.pump(const Duration(milliseconds: 16));
      expect(_getShakeOffset(tester), isNot(Offset.zero));

      await tester.pumpAndSettle();
      controller.dispose();
    });

    testWidgets('disposes without error when widget is removed',
        (tester) async {
      final controller = NesShakeEffectController();
      await tester.pumpWidget(_buildApp(controller: controller));

      controller.shake();
      await tester.pump(const Duration(milliseconds: 50));

      // Remove the widget mid-shake
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const Scaffold(body: SizedBox()),
        ),
      );
      await tester.pumpAndSettle();

      controller.dispose();
    });

    // --- Edge case ---

    testWidgets('shake() during active shake restarts animation',
        (tester) async {
      final controller = NesShakeEffectController();
      await tester.pumpWidget(
        _buildApp(
          controller: controller,
          duration: const Duration(milliseconds: 500),
        ),
      );

      controller.shake();
      await tester.pump(const Duration(milliseconds: 250));

      // Shake again mid-animation — should restart
      controller.shake();
      await tester.pump(const Duration(milliseconds: 16));
      expect(_getShakeOffset(tester), isNot(Offset.zero));

      // Original 500ms from first shake would be done, but since we
      // restarted at 250ms, animation should still be running after 300ms
      await tester.pump(const Duration(milliseconds: 300));
      expect(_getShakeOffset(tester), isNot(Offset.zero));

      await tester.pumpAndSettle();
      controller.dispose();
    });
  });
}
