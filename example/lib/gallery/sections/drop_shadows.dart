import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class DropShadowsSection extends StatelessWidget {
  const DropShadowsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('DropShadows', style: theme.textTheme.displayMedium),
        const SizedBox(height: 16),
        const NesDropshadow(
          child: NesWindow(
            width: 200,
            child: Center(child: Text('In a window')),
          ),
        ),
        const SizedBox(height: 16),
        const NesDropshadow(
          child: NesContainer(
            width: 200,
            child: Center(child: Text('In a container')),
          ),
        ),
        const SizedBox(height: 16),
        const NesDropshadow(
          x: 8,
          y: 6,
          child: NesWindow(
            width: 400,
            child: Center(child: Text('Custom shadow in a window')),
          ),
        ),
        const SizedBox(height: 16),
        const NesDropshadow(
          x: 8,
          y: 6,
          child: NesContainer(
            width: 400,
            child: Center(child: Text('Custom shadow in a container')),
          ),
        ),
      ],
    );
  }
}
