import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class SplitPanelSection extends StatelessWidget {
  const SplitPanelSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nes Split Panel',
          style: theme.textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        const SizedBox(
          height: 300,
          width: 600,
          child: NesSplitPanel(
            children: [
              NesContainer(
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: Text('Panel 1'),
                ),
              ),
              NesContainer(
                width: double.infinity,
                height: double.infinity,
                child: Center(
                  child: Text('Panel 2'),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Text('With nested panels'),
        const SizedBox(height: 16),
        const SizedBox(
          height: 300,
          width: 600,
          child: NesSplitPanel(
            orientation: Axis.vertical,
            children: [
              NesSplitPanel(
                children: [
                  NesContainer(
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: Text('Panel 1'),
                    ),
                  ),
                  NesContainer(
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: Text('Panel 2'),
                    ),
                  ),
                  NesContainer(
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: Text('Panel 3'),
                    ),
                  ),
                ],
              ),
              NesSplitPanel(
                children: [
                  NesContainer(
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: Text('Panel 4'),
                    ),
                  ),
                  NesContainer(
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: Text('Panel 5'),
                    ),
                  ),
                  NesContainer(
                    width: double.infinity,
                    height: double.infinity,
                    child: Center(
                      child: Text('Panel 6'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
