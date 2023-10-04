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
        Wrap(
          children: [
            const _Entry(
              label: 'Hourglass',
              child: NesHourglassLoadingIndicator(),
            ),
            const _Entry(
              label: 'Terminal',
              child: NesTerminalLoadingIndicator(),
            ),
            _Entry(
              label: 'Jumping Icons',
              child: NesJumpingIconsLoadingIndicator(
                icons: [
                  NesIcons.sword,
                  NesIcons.shield,
                  NesIcons.arrow,
                  NesIcons.helm,
                ],
              ),
            ),
            _Entry(
              label: 'Mutating Icons',
              child: NesMutatingIconsLoadingIndicator(
                icons: [
                  NesIcons.sword,
                  NesIcons.shield,
                  NesIcons.arrow,
                  NesIcons.helm,
                ],
              ),
            ),
            const _Entry(
              label: 'Pixel Row',
              child: NesPixelRowLoadingIndicator(),
            ),
          ],
        ),
      ],
    );
  }
}

class _Entry extends StatelessWidget {
  const _Entry({
    required this.child,
    required this.label,
  });

  final Widget child;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: NesContainer(
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            child,
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontSize: 10,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
