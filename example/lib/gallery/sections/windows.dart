import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class WindowsSection extends StatelessWidget {
  const WindowsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Windows',
          style: theme.textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        const NesWindow(
          child: Center(child: Text('Hello')),
        ),
        const SizedBox(height: 16),
        const NesWindow(
          title: 'Title',
          child: Center(child: Text('With title')),
        ),
        const SizedBox(height: 16),
        NesWindow(
          icon: NesIcons.sword,
          child: const Center(child: Text('With icon')),
        ),
        const SizedBox(height: 16),
        NesWindow(
          icon: NesIcons.sword,
          title: 'Sword',
          child: const Center(child: Text('With title and icon')),
        ),
      ],
    );
  }
}
