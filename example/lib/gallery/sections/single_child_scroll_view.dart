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
        Wrap(
          children: [
            NesContainer(
              height: 300,
              width: 300,
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
            const SizedBox(width: 32),
            NesContainer(
              height: 200,
              width: 300,
              child: NesSingleChildScrollView(
                direction: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    100,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text('Item $index'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
