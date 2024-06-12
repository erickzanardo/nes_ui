import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class DropDownMenusSection extends StatelessWidget {
  const DropDownMenusSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Drop Down Menus',
          style: theme.textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        const NesDropdownMenu<String>(
          initialValue: 'Option 1',
          entries: [
            NesDropdownMenuEntry(value: 'Option 1', label: 'Option 1'),
            NesDropdownMenuEntry(value: 'Option 2', label: 'Option 2'),
            NesDropdownMenuEntry(value: 'Option 3', label: 'Option 3'),
          ],
        ),
      ],
    );
  }
}
