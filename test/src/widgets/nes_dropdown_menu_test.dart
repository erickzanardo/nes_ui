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

      expect(find.text('Option 1'), findsOneWidget);

      await tester.tap(find.byType(NesIcon));
      await tester.pumpAndSettle();

      expect(find.text('Option 1'), findsExactly(2));
      expect(find.text('Option 2'), findsOneWidget);
      expect(find.text('Option 3'), findsOneWidget);
    });

    testWidgets('refreshs the options', (tester) async {
      var options = const [
        NesDropdownMenuEntry(value: 'Option 1', label: 'Option 1'),
        NesDropdownMenuEntry(value: 'Option 2', label: 'Option 2'),
        NesDropdownMenuEntry(value: 'Option 3', label: 'Option 3'),
      ];
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  children: [
                    NesButton.text(
                      type: NesButtonType.primary,
                      text: 'Refresh',
                      onPressed: () {
                        setState(() {
                          options = const [
                            NesDropdownMenuEntry(
                              value: 'Option 4',
                              label: 'Option 4',
                            ),
                          ];
                        });
                      },
                    ),
                    NesDropdownMenu<String>(
                      initialValue: 'Option 1',
                      entries: options,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Refresh'));
      await tester.pumpAndSettle();

      await tester.tap(find.byType(NesIcon));
      await tester.pumpAndSettle();

      expect(find.text('Option 1'), findsNothing);
      expect(find.text('Option 2'), findsNothing);
      expect(find.text('Option 3'), findsNothing);

      expect(find.text('Option 4'), findsOneWidget);
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
