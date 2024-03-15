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
        Wrap(
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
            const SizedBox(width: 16),
            NesButton(
              type: NesButtonType.normal,
              child: const Text('Input'),
              onPressed: () async {
                void showSnack(String? inputData) {
                  if (inputData != null) {
                    NesSnackbar.show(
                      context,
                      text: inputData,
                    );
                  }
                }

                final inputData = await NesInputDialog.show(
                  context: context,
                  message: 'What is the coolest NES game?',
                );
                showSnack(inputData);
              },
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'Dialogs with NesWindowDialogFrame',
          style: theme.textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        Wrap(
          children: [
            NesButton(
              type: NesButtonType.normal,
              child: const Text('Plain'),
              onPressed: () {
                NesDialog.show<void>(
                  context: context,
                  builder: (_) => const Text('Hello World'),
                  frame: const NesWindowDialogFrame(),
                );
              },
            ),
            const SizedBox(width: 16),
            NesButton(
              type: NesButtonType.normal,
              child: const Text('Confirmation'),
              onPressed: () {
                NesConfirmDialog.show(
                  context: context,
                  frame: const NesWindowDialogFrame(),
                );
              },
            ),
            const SizedBox(width: 16),
            NesButton(
              type: NesButtonType.normal,
              child: const Text('Input'),
              onPressed: () async {
                void showSnack(String? inputData) {
                  if (inputData != null) {
                    NesSnackbar.show(
                      context,
                      text: inputData,
                    );
                  }
                }

                final inputData = await NesInputDialog.show(
                  context: context,
                  message: 'What is the coolest NES game?',
                  frame: const NesWindowDialogFrame(),
                );
                showSnack(inputData);
              },
            ),
            const SizedBox(width: 16),
            NesButton(
              type: NesButtonType.normal,
              child: const Text('Plain with icon'),
              onPressed: () {
                NesDialog.show<void>(
                  context: context,
                  builder: (_) => const Text('Hello World'),
                  frame: NesWindowDialogFrame(
                    leftIcon: NesIcons.bell,
                  ),
                );
              },
            ),
            const SizedBox(width: 16),
            NesButton(
              type: NesButtonType.normal,
              child: const Text('Plain with icon and title'),
              onPressed: () {
                NesDialog.show<void>(
                  context: context,
                  builder: (_) => const Text('Hello World'),
                  frame: NesWindowDialogFrame(
                    leftIcon: NesIcons.bell,
                    title: 'Hello',
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
