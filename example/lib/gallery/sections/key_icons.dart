import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:phased/phased.dart';

class KeyIconsSection extends StatelessWidget {
  const KeyIconsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Key Icons',
          style: theme.textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        Wrap(
          children: [
            const NesKeyIcon(
              buttonKey: 'a',
            ),
            const SizedBox(width: 16),
            const NesKeyIcon(
              buttonKey: 'a',
              pressed: true,
            ),
            const SizedBox(width: 16),
            _Toogler(),
          ],
        ),
      ],
    );
  }
}

class _Toogler extends Phased<bool> {
  _Toogler()
      : super(
          state: PhasedState<bool>(
            values: [true, false],
            ticker: const Duration(milliseconds: 500),
          ),
        );

  @override
  Widget build(BuildContext context) {
    return NesKeyIcon(
      buttonKey: 'a',
      pressed: state.value,
    );
  }
}
