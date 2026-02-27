// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default', type: NesTab)
Widget normal(BuildContext context) => const Center(
  child: Padding(
    padding: EdgeInsets.all(32),
    child: NesTab(
      tab: NesTabItem(child: SizedBox.shrink(), label: 'Tab'),
    ),
  ),
);

@widgetbook.UseCase(name: 'selected', type: NesTab)
Widget selected(BuildContext context) => const Center(
  child: Padding(
    padding: EdgeInsets.all(32),
    child: NesTab(
      tab: NesTabItem(child: SizedBox.shrink(), label: 'Selected Tab'),
      selected: true,
    ),
  ),
);

@widgetbook.UseCase(name: 'with icon', type: NesTab)
Widget withIcon(BuildContext context) => Center(
  child: Padding(
    padding: const EdgeInsets.all(32),
    child: NesTab(
      tab: NesTabItem(
        child: const SizedBox.shrink(),
        label: 'Home',
        icon: NesIcons.home,
      ),
    ),
  ),
);

@widgetbook.UseCase(name: 'with icon only', type: NesTab)
Widget withIconOnly(BuildContext context) => Center(
  child: Padding(
    padding: const EdgeInsets.all(32),
    child: NesTab(
      tab: NesTabItem(child: const SizedBox.shrink(), icon: NesIcons.home),
    ),
  ),
);

@widgetbook.UseCase(name: 'with close button', type: NesTab)
Widget withCloseButton(BuildContext context) => const Center(
  child: Padding(
    padding: EdgeInsets.all(32),
    child: NesTab(
      tab: NesTabItem(child: SizedBox.shrink(), label: 'Closable Tab'),
      onClosed: _emptyCallback,
    ),
  ),
);

@widgetbook.UseCase(name: 'selected with close button', type: NesTab)
Widget selectedWithCloseButton(BuildContext context) => const Center(
  child: Padding(
    padding: EdgeInsets.all(32),
    child: NesTab(
      tab: NesTabItem(child: SizedBox.shrink(), label: 'Closable Selected Tab'),
      selected: true,
      onClosed: _emptyCallback,
    ),
  ),
);

void _emptyCallback() {}
