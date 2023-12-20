import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class RunningTextSection extends StatelessWidget {
  const RunningTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Running text',
          style: theme.textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        const NesRunningText(
          text: 'This is a simple running text.',
        ),
      ],
    );
  }
}
