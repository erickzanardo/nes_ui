import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class SingleChildScrollViewSection extends StatelessWidget {
  const SingleChildScrollViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Single Child ScrollView',
          style: theme.textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 300,
          child: NesSingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                100,
                (index) => Text('Item $index'),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
