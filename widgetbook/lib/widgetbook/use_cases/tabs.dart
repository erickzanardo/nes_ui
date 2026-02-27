// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default', type: NesTabView)
Widget normal(BuildContext context) => const Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: NesTabView(
          tabs: [
            NesTabItem(
              child: SizedBox.expand(child: Center(child: Text('Hello'))),
              label: 'Home',
            ),
            NesTabItem(
              child: SizedBox.expand(child: Center(child: Text('Settings'))),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );

@widgetbook.UseCase(name: 'with icon', type: NesTabView)
Widget withIcon(BuildContext context) => Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: NesTabView(
          tabs: [
            NesTabItem(
              child: const SizedBox.expand(child: Center(child: Text('Moon'))),
              icon: NesIcons.moon,
              label: 'Moon',
            ),
            NesTabItem(
              child: const SizedBox.expand(child: Center(child: Text('Sun'))),
              label: 'Sun',
              icon: NesIcons.sun,
            ),
          ],
        ),
      ),
    );

@widgetbook.UseCase(name: 'with icon only', type: NesTabView)
Widget withIconOnly(BuildContext context) => Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: NesTabView(
          tabs: [
            NesTabItem(
              child: const SizedBox.expand(child: Center(child: Text('Moon'))),
              icon: NesIcons.moon,
            ),
            NesTabItem(
              child: const SizedBox.expand(child: Center(child: Text('Sun'))),
              icon: NesIcons.sun,
            ),
          ],
        ),
      ),
    );
