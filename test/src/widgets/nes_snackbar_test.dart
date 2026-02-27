import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  group('NesSnackbar', () {
    testWidgets('renders correctly when is normal', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const NesSnackbar(text: 'Normal'),
        ),
      );

      expect(find.byType(NesSnackbar), findsOneWidget);
      expect(find.text('Normal'), findsOneWidget);
    });

    testWidgets('renders correctly when is success', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const NesSnackbar(
            text: 'Success',
            type: NesSnackbarType.success,
          ),
        ),
      );

      expect(find.byType(NesSnackbar), findsOneWidget);
      expect(find.text('Success'), findsOneWidget);
    });

    testWidgets('renders correctly when is warning', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const NesSnackbar(
            text: 'Warning',
            type: NesSnackbarType.warning,
          ),
        ),
      );

      expect(find.byType(NesSnackbar), findsOneWidget);
      expect(find.text('Warning'), findsOneWidget);
    });

    testWidgets('renders correctly when is error', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const NesSnackbar(text: 'Error', type: NesSnackbarType.error),
        ),
      );

      expect(find.byType(NesSnackbar), findsOneWidget);
      expect(find.text('Error'), findsOneWidget);
    });
  });
}
