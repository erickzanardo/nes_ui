// ignore_for_file: public_member_api_docs

import 'package:flutter/widgets.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default', type: NesDropdownMenu)
Widget normal(BuildContext context) {
  return const Center(
    child: NesDropdownMenu<String>(
      entries: [
        NesDropdownMenuEntry(value: '1', label: 'Option 1'),
        NesDropdownMenuEntry(value: '2', label: 'Option 2'),
        NesDropdownMenuEntry(value: '3', label: 'Option 3'),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'with icons', type: NesDropdownMenu)
Widget icons(BuildContext context) {
  return Center(
    child: NesDropdownMenu<String>(
      entries: [
        NesDropdownMenuEntry(icon: NesIcons.sword, value: '1', label: 'Sword'),
        NesDropdownMenuEntry(
          icon: NesIcons.shield,
          value: '2',
          label: 'Shield',
        ),
        NesDropdownMenuEntry(icon: NesIcons.arrow, value: '3', label: 'Arrow'),
        NesDropdownMenuEntry(icon: NesIcons.axe, value: '4', label: 'Axe'),
      ],
    ),
  );
}
