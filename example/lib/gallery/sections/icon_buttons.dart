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
        Text(
          'Icon Buttons',
          style: theme.textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        Wrap(
          children: [
            _IconEntry(
              data: NesIcons.instance.close,
            ),
            _IconEntry(
              data: NesIcons.instance.handPointingRight,
            ),
            _IconEntry(
              data: NesIcons.instance.leftArrowIndicator,
            ),
            _IconEntry(
              data: NesIcons.instance.rightArrowIndicator,
            ),
            _IconEntry(
              data: NesIcons.instance.delete,
            ),
            _IconEntry(
              data: NesIcons.instance.add,
            ),
            _IconEntry(
              data: NesIcons.instance.remove,
            ),
            _IconEntry(
              data: NesIcons.instance.redo,
            ),
          ],
        ),
      ],
    );
  }
}

class _IconEntry extends StatelessWidget {
  const _IconEntry({
    required this.data,
  });

  final NesIconData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: NesIconButton(icon: data, onPress: () {}),
    );
  }
}
