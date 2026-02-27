import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  const TextSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Typography', style: theme.textTheme.displayMedium),
        const SizedBox(height: 16),
        Text('Title Small', style: theme.textTheme.titleSmall),
        Text('Title Medium', style: theme.textTheme.titleMedium),
        Text('Title Large', style: theme.textTheme.titleLarge),
        const SizedBox(height: 16),
        Text('Body Small', style: theme.textTheme.bodySmall),
        Text('Body Medium', style: theme.textTheme.bodyMedium),
        Text('Body Large', style: theme.textTheme.bodyLarge),
        const SizedBox(height: 16),
        Text('Label Small', style: theme.textTheme.labelSmall),
        Text('Label Medium', style: theme.textTheme.labelMedium),
        Text('Label Large', style: theme.textTheme.labelLarge),
      ],
    );
  }
}
