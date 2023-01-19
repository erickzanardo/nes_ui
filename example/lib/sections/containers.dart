import 'package:flutter/material.dart';
import 'package:nes_ui/nes.dart';

class ContainersSection extends StatelessWidget {
  const ContainersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Containers',
          style: theme.textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        const NesContainer(
          width: double.infinity,
          child: Text('Hello'),
        ),
        const SizedBox(height: 16),
        const NesContainer(
          width: double.infinity,
          label: 'With a label',
          child: Text('Hello'),
        ),
      ],
    );
  }
}
