import 'package:flutter/material.dart';
import 'package:nes_ui/nes.dart';

class CheckBoxesSection extends StatelessWidget {
  const CheckBoxesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'CheckBoxes',
          style: theme.textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        Wrap(
          children: const [
            NesCheckBox(
              value: true,
            ),
            SizedBox(width: 16),
            NesCheckBox(
              value: false,
            ),
          ],
        ),
      ],
    );
  }
}
