import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Buttons', style: theme.textTheme.displayMedium),
        const SizedBox(height: 16),
        Wrap(
          children: [
            NesButton(
              type: NesButtonType.normal,
              onPressed: () {},
              child: const Text('Normal'),
            ),
            const SizedBox(width: 8),
            NesButton(
              type: NesButtonType.primary,
              onPressed: () {},
              child: const Text('Primary'),
            ),
            const SizedBox(width: 8),
            NesButton(
              type: NesButtonType.success,
              onPressed: () {},
              child: const Text('Success'),
            ),
            const SizedBox(width: 8),
            NesButton(
              type: NesButtonType.warning,
              onPressed: () {},
              child: const Text('Warning'),
            ),
            const SizedBox(width: 8),
            NesButton(
              type: NesButtonType.error,
              onPressed: () {},
              child: const Text('Error'),
            ),
            const SizedBox(width: 8),
          ],
        ),
        const SizedBox(height: 32),
        Text('With icons', style: theme.textTheme.displayMedium),
        const SizedBox(height: 16),
        Wrap(
          children: [
            NesButton(
              type: NesButtonType.normal,
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  NesIcon(iconData: NesIcons.check),
                  const SizedBox(width: 8),
                  const Text('Normal'),
                ],
              ),
            ),
            const SizedBox(width: 8),
            NesButton(
              type: NesButtonType.primary,
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  NesIcon(iconData: NesIcons.check),
                  const SizedBox(width: 8),
                  const Text('Primary'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Text('With material icons', style: theme.textTheme.displayMedium),
        const SizedBox(height: 16),
        Wrap(
          children: [
            NesButton(
              type: NesButtonType.normal,
              onPressed: () {},
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check),
                  SizedBox(width: 8),
                  Text('Normal'),
                ],
              ),
            ),
            const SizedBox(width: 8),
            NesButton(
              type: NesButtonType.primary,
              onPressed: () {},
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check),
                  SizedBox(width: 8),
                  Text('Primary'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
