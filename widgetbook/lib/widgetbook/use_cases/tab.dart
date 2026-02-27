// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: NesTab,
)
Widget normal(BuildContext context) => Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: NesTab(
          tab: const NesTabItem(
            label: 'Tab',
          ),
          selected: false,
        ),
      ),
    );

@widgetbook.UseCase(
  name: 'selected',
  type: NesTab,
)
Widget selected(BuildContext context) => Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: NesTab(
          tab: const NesTabItem(
            label: 'Selected Tab',
          ),
          selected: true,
        ),
      ),
    );

@widgetbook.UseCase(
  name: 'with icon',
  type: NesTab,
)
Widget withIcon(BuildContext context) => Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: NesTab(
          tab: const NesTabItem(
            label: 'Home',
            icon: NesIcons.home,
          ),
        ),
      ),
    );

@widgetbook.UseCase(
  name: 'with icon only',
  type: NesTab,
)
Widget withIconOnly(BuildContext context) => Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: NesTab(
          tab: const NesTabItem(
            icon: NesIcons.home,
          ),
        ),
      ),
    );

@widgetbook.UseCase(
  name: 'with close button',
  type: NesTab,
)
Widget withCloseButton(BuildContext context) => Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: NesTab(
          tab: const NesTabItem(
            label: 'Closable Tab',
          ),
          onClosed: () {},
        ),
      ),
    );

@widgetbook.UseCase(
  name: 'selected with close button',
  type: NesTab,
)
Widget selectedWithCloseButton(BuildContext context) => Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: NesTab(
          tab: const NesTabItem(
            label: 'Closable Selected Tab',
          ),
          selected: true,
          onClosed: () {},
        ),
      ),
    );
