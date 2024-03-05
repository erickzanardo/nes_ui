import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class SectionHeaderSection extends StatelessWidget {
  const SectionHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          'Section Header',
          style: theme.textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        const NesContainer(child: NesSectionHeader(title: 'Center (default)')),
        const SizedBox(height: 16),
        const NesContainer(
          child: NesSectionHeader(
            title: 'Start',
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ],
    );
  }
}
