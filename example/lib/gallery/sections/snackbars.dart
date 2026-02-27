import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class SnackbarSection extends StatelessWidget {
  const SnackbarSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Snackbars', style: theme.textTheme.displayMedium),
        const SizedBox(height: 16),
        Wrap(
          children: [
            NesButton(
              type: NesButtonType.normal,
              onPressed: () {
                NesSnackbar.show(context, text: 'Normal');
              },
              child: const Text('Normal'),
            ),
            const SizedBox(width: 8),
            NesButton(
              type: NesButtonType.success,
              onPressed: () {
                NesSnackbar.show(
                  context,
                  text: 'Success',
                  type: NesSnackbarType.success,
                );
              },
              child: const Text('Success'),
            ),
            const SizedBox(width: 8),
            NesButton(
              type: NesButtonType.warning,
              onPressed: () {
                NesSnackbar.show(
                  context,
                  text: 'Warning',
                  type: NesSnackbarType.warning,
                );
              },
              child: const Text('Warning'),
            ),
            const SizedBox(width: 8),
            NesButton(
              type: NesButtonType.error,
              onPressed: () {
                NesSnackbar.show(
                  context,
                  text: 'Error',
                  type: NesSnackbarType.error,
                );
              },
              child: const Text('Error'),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ],
    );
  }
}
