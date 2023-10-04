import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class LoadingIndicatorsSection extends StatelessWidget {
  const LoadingIndicatorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Loading Indicators',
          style: theme.textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        const _Entry(child: NesHourglassLoadingIndicator()),
      ],
    );
  }
}

class _Entry extends StatelessWidget {
  const _Entry({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NesContainer(
      child: Column(
        children: [
          child,
          const SizedBox(height: 8),
          Text(
            'NesHourglassLoadingIndicator',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 10,
                ),
          ),
        ],
      ),
    );
  }
}
