import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class SelectionListSection extends StatefulWidget {
  const SelectionListSection({super.key});

  @override
  State<SelectionListSection> createState() => _SelectionListSectionState();
}

class _SelectionListSectionState extends State<SelectionListSection> {
  int _vertical = 0;
  int _horizontal = 0;

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
          label: 'Vertical (Selected: $_vertical)',
          child: NesSelectionList(
            initialIndex: _vertical,
            children: const [
              Text('Characters'),
              Text('Items'),
              Text('Skills'),
              Text('Status'),
            ],
            onSelect: (v) {
              setState(() => _vertical = v);
            },
          ),
        ),
        const SizedBox(height: 16),
        NesContainer(
          label: 'Horizontal (Selected $_horizontal)',
          child: NesSelectionList(
            initialIndex: _horizontal,
            axis: Axis.horizontal,
            children: const [
              Text('Yes'),
              Text('No'),
            ],
            onSelect: (v) {
              setState(() => _horizontal = v);
            },
          ),
        ),
      ],
    );
  }
}
