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
        NesButton(
          type: NesButtonType.normal,
          child: const Text('Confirmation'),
          onPressed: () {
            NesConfirmDialog.show(context: context);
          },
        ),
      ],
    );
  }
}
