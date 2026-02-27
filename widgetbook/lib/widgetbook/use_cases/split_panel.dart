// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default', type: NesSplitPanel)
Widget defaultCase(BuildContext context) => const Center(
      child: SizedBox(
        height: 200,
        width: 400,
        child: NesSplitPanel(
          children: [
            NesContainer(
              width: double.infinity,
              height: double.infinity,
              child: Center(child: Text('Panel 1')),
            ),
            NesContainer(
              width: double.infinity,
              height: double.infinity,
              child: Center(child: Text('Panel 2')),
            ),
          ],
        ),
      ),
    );

@widgetbook.UseCase(name: 'vertical', type: NesSplitPanel)
Widget vertical(BuildContext context) => const Center(
      child: SizedBox(
        height: 300,
        width: 200,
        child: NesSplitPanel(
          orientation: Axis.vertical,
          children: [
            NesContainer(
              width: double.infinity,
              height: double.infinity,
              child: Center(child: Text('Panel 1')),
            ),
            NesContainer(
              width: double.infinity,
              height: double.infinity,
              child: Center(child: Text('Panel 2')),
            ),
          ],
        ),
      ),
    );

@widgetbook.UseCase(name: 'with initial sizes', type: NesSplitPanel)
Widget withInitialSizes(BuildContext context) => Center(
      child: SizedBox(
        height: 200,
        width: 400,
        child: NesSplitPanel(
          initialSizes: const [0.3, 0.7],
          children: const [
            NesContainer(
              width: double.infinity,
              height: double.infinity,
              child: Center(child: Text('Panel 1 (30%)')),
            ),
            NesContainer(
              width: double.infinity,
              height: double.infinity,
              child: Center(child: Text('Panel 2 (70%)')),
            ),
          ],
        ),
      ),
    );

@widgetbook.UseCase(name: 'nested panels', type: NesSplitPanel)
Widget nestedPanels(BuildContext context) => const Center(
      child: SizedBox(
        height: 300,
        width: 400,
        child: NesSplitPanel(
          orientation: Axis.vertical,
          children: [
            NesSplitPanel(
              children: [
                NesContainer(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(child: Text('Panel 1')),
                ),
                NesContainer(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(child: Text('Panel 2')),
                ),
                NesContainer(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(child: Text('Panel 3')),
                ),
              ],
            ),
            NesSplitPanel(
              children: [
                NesContainer(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(child: Text('Panel 4')),
                ),
                NesContainer(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(child: Text('Panel 5')),
                ),
              ],
            ),
          ],
        ),
      ),
    );

@widgetbook.UseCase(name: 'with custom resizer size', type: NesSplitPanel)
Widget customResizerSize(BuildContext context) => const Center(
      child: SizedBox(
        height: 200,
        width: 400,
        child: NesSplitPanel(
          resizerSize: 32,
          children: [
            NesContainer(
              width: double.infinity,
              height: double.infinity,
              child: Center(child: Text('Panel 1')),
            ),
            NesContainer(
              width: double.infinity,
              height: double.infinity,
              child: Center(child: Text('Panel 2')),
            ),
          ],
        ),
      ),
    );
