import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  group('NesDropdownMenu', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const Scaffold(
            body: NesDropdownMenu<String>(
              initialValue: 'Option 1',
              entries: [
                NesDropdownMenuEntry(value: 'Option 1', label: 'Option 1'),
                NesDropdownMenuEntry(value: 'Option 2', label: 'Option 2'),
                NesDropdownMenuEntry(value: 'Option 3', label: 'Option 3'),
              ],
            ),
          ),
        ),
      );

      await tester.tap(find.byType(NesDropdownMenu<String>));
    });

    testWidgets('shows the selected initial value', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const Scaffold(
            body: NesDropdownMenu<String>(
              initialValue: 'Option 2',
              entries: [
                NesDropdownMenuEntry(value: 'Option 1', label: 'Option 1'),
                NesDropdownMenuEntry(value: 'Option 2', label: 'Option 2'),
                NesDropdownMenuEntry(value: 'Option 3', label: 'Option 3'),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Option 2'), findsOneWidget);
    });

    testWidgets('calls onChanged when an entry is selected', (tester) async {
      String? selectedValue;

      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: NesDropdownMenu<String>(
              initialValue: 'Option 1',
              entries: const [
                NesDropdownMenuEntry(value: 'Option 1', label: 'Option 1'),
                NesDropdownMenuEntry(value: 'Option 2', label: 'Option 2'),
                NesDropdownMenuEntry(value: 'Option 3', label: 'Option 3'),
              ],
              onChanged: (value) {
                selectedValue = value;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(NesIcon));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Option 2'));
      await tester.pumpAndSettle();

      expect(selectedValue, 'Option 2');
    });
  });
}
