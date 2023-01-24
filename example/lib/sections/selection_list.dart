import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class SelectionListSection extends StatelessWidget {
  const SelectionListSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selection lists',
          style: theme.textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        // Improve layout
        NesContainer(
          label: 'Vertical',
          child: NesSelectionList(
            children: const [
              Text('Characters'),
              Text('Items'),
              Text('Skills'),
              Text('Status'),
            ],
            onSelect: (_) {},
          ),
        ),
        const SizedBox(height: 16),
        NesContainer(
          label: 'Horizontal',
          child: NesSelectionList(
            axis: Axis.horizontal,
            children: const [
              Text('Yes'),
              Text('No'),
            ],
            onSelect: (_) {},
          ),
        ),
      ],
    );
  }
}
