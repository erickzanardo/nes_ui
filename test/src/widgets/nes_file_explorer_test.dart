// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

import '../../helpers/helpers.dart';

void main() {
  group('NesFileExplorer', () {
    testWidgets('renders its root entries', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: NesFileExplorer(
            onOpenFile: (_) {},
            entries: const [NesFolder('/assets'), NesFile('/LICENSE')],
          ),
        ),
      );

      expect(find.text('assets'), findsOneWidget);
      expect(find.text('LICENSE'), findsOneWidget);
    });

    testWidgets('entries can be added to the entries', (tester) async {
      var entries = [const NesFolder('/assets'), const NesFile('/LICENSE')];
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: StatefulBuilder(
            builder: (context, setState) {
              return Row(
                children: [
                  NesFileExplorer(onOpenFile: (_) {}, entries: entries),
                  NesButton(
                    type: NesButtonType.primary,
                    onPressed: () {
                      setState(() {
                        entries = [...entries, const NesFile('/new_char')];
                      });
                    },
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Add'));
      await tester.pumpAndSettle();

      expect(find.text('assets'), findsOneWidget);
      expect(find.text('LICENSE'), findsOneWidget);
      expect(find.text('new_char'), findsOneWidget);
    });

    testWidgets('can select a root file', (tester) async {
      NesFile? selectedFile;
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: NesFileExplorer(
            onOpenFile: (value) => selectedFile = value,
            entries: const [NesFolder('/assets'), NesFile('/LICENSE')],
          ),
        ),
      );

      await tester.tap(find.text('LICENSE'));
      await tester.pumpAndSettle();

      expect(selectedFile, isNotNull);
      expect(selectedFile?.path, equals('/LICENSE'));
    });

    testWidgets('can open a root folder', (tester) async {
      await tester.setDisplaySize(const Size(1200, 800));
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: NesContainer(
            height: 600,
            child: NesFileExplorer(
              onOpenFile: (_) {},
              entries: const [
                NesFolder('/assets'),
                NesFile('/assets/sprite-sheet.png'),
                NesFile('/LICENSE'),
              ],
            ),
          ),
        ),
      );

      await tester.tap(find.text('assets'));
      await tester.pumpAndSettle();

      expect(find.text('sprite-sheet.png'), findsOneWidget);
    });

    testWidgets('can open a file from a nested folder', (tester) async {
      await tester.setDisplaySize(const Size(1200, 800));

      NesFile? selectedFile;
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: NesContainer(
            height: 600,
            child: NesFileExplorer(
              onOpenFile: (value) => selectedFile = value,
              entries: const [
                NesFolder('/assets'),
                NesFile('/assets/sprite-sheet.png'),
                NesFile('/LICENSE'),
              ],
            ),
          ),
        ),
      );

      await tester.tap(find.text('assets'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('sprite-sheet.png'));
      await tester.pumpAndSettle();

      expect(selectedFile, isNotNull);
      expect(selectedFile?.name, equals('sprite-sheet.png'));
    });
  });
}
