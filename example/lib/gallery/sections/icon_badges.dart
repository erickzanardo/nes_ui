import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class IconBadgesSection extends StatelessWidget {
  const IconBadgesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Icon Badges', style: theme.textTheme.displayMedium),
        const SizedBox(height: 16),
        Wrap(
          children: [_IconEntry(data: NesIcons.download, label: '1')],
        ),
      ],
    );
  }
}

class _IconEntry extends StatelessWidget {
  const _IconEntry({required this.data, required this.label});

  final NesIconData data;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: NesIconBadge(iconData: data, badge: label),
    );
  }
}
