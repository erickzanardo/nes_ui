import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

enum CustomHeroClass {
  archer,
  knight,
  barbarian;

  NesIconData toIcon() {
    switch (this) {
      case CustomHeroClass.knight:
        return NesIcons.instance.sword;
      case CustomHeroClass.archer:
        return NesIcons.instance.arrow;
      case CustomHeroClass.barbarian:
        return NesIcons.instance.axe;
    }
  }
}

class IterableOptionsSection extends StatefulWidget {
  const IterableOptionsSection({super.key});

  @override
  State<IterableOptionsSection> createState() => _IterableOptionsSectionState();
}

class _IterableOptionsSectionState extends State<IterableOptionsSection> {
  String? value1;
  CustomHeroClass customValue = CustomHeroClass.knight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Iterable Options',
          style: theme.textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: 250,
          child: NesIterableOptions<String?>(
            onChange: (value) {
              setState(() => value1 = value);
            },
            value: value1,
            values: const [
              null,
              'Archer',
              'Knight',
              'Barbarian',
            ],
          ),
        ),
        const SizedBox(height: 32),
        const Text('Custom'),
        const SizedBox(height: 16),
        SizedBox(
          width: 150,
          child: NesIterableOptions<CustomHeroClass>(
            onChange: (value) {
              setState(() => customValue = value);
            },
            leftIndicatorBuilder: (_) => NesIcon(
              iconData: NesIcons.instance.thinArrowLeft,
            ),
            rightIndicatorBuilder: (_) => NesIcon(
              iconData: NesIcons.instance.thinArrowRight,
            ),
            optionBuilder: (_, value) => NesIcon(iconData: value.toIcon()),
            value: customValue,
            values: CustomHeroClass.values,
          ),
        ),
      ],
    );
  }
}
