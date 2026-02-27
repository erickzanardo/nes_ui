// ignore_for_file: prefer_const_constructors

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

void main() {
  group('NesContainer', () {
    testWidgets('renders its child', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          theme: flutterNesTheme(),
          home: const NesContainer(child: Text('The Child')),
        ),
      );

      expect(find.text('The Child'), findsOneWidget);
    });
  });

  group('NesContainer golden tests', () {
    goldenTest(
      'renders correctly',
      builder: () => GoldenTestGroup(
        scenarioConstraints: const BoxConstraints(maxWidth: 600),
        children: [
          GoldenTestScenario(
            name: 'with child',
            child: NesContainer(child: Text('ListTile.title')),
          ),
          GoldenTestScenario(
            name: 'with label',
            child: NesContainer(label: 'label'),
          ),
          GoldenTestScenario(
            name: 'with child and label',
            child: NesContainer(label: 'label', child: Text('child')),
          ),
        ],
      ),
      fileName: 'nes_container/nes_container_goldens',
    );
  });
}
