import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class DialogsSection extends StatelessWidget {
  const DialogsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dialogs',
          style: theme.textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            NesButton(
              type: NesButtonType.normal,
              child: const Text('Plain'),
              onPressed: () {
                NesDialog.show<void>(
                  context: context,
                  builder: (_) => const Text('Hello World'),
                );
              },
            ),
            const SizedBox(width: 16),
            NesButton(
              type: NesButtonType.normal,
              child: const Text('Confirmation'),
              onPressed: () {
                NesConfirmDialog.show(context: context);
              },
            ),
          ],
        ),
      ],
    );
  }
}
