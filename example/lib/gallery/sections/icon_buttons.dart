import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class IconButtonsSection extends StatelessWidget {
  const IconButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Icon Buttons', style: theme.textTheme.displayMedium),
        const SizedBox(height: 16),
        Wrap(
          children: [
            _IconEntry(data: NesIcons.close),
            _IconEntry(data: NesIcons.handPointingRight),
            _IconEntry(data: NesIcons.leftArrowIndicator),
            _IconEntry(data: NesIcons.rightArrowIndicator),
            _IconEntry(data: NesIcons.delete),
            _IconEntry(data: NesIcons.add),
            _IconEntry(data: NesIcons.remove),
            _IconEntry(data: NesIcons.redo),
            _IconEntry(data: NesIcons.redo, disabled: true),
          ],
        ),
      ],
    );
  }
}

class _IconEntry extends StatelessWidget {
  const _IconEntry({required this.data, this.disabled = false});

  final NesIconData data;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: NesIconButton(icon: data, onPress: () {}, disabled: disabled),
    );
  }
}
