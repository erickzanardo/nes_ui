import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class ProgressBarsSection extends StatefulWidget {
  const ProgressBarsSection({super.key});

  @override
  State<ProgressBarsSection> createState() => _ProgressBarsSectionState();
}

class _ProgressBarsSectionState extends State<ProgressBarsSection> {
  double progress = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Progress Bars',
          style: theme.textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: NesContainer(
                width: 256,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Style'),
                    NesProgressBar(value: progress),
                    const SizedBox(height: 8),
                    Text(
                      'Pixel',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 10,
                          ),
                    ),
                    const SizedBox(height: 16),
                    NesProgressBar(
                      value: progress,
                      style: NesProgressBarStyle.smooth,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Smooth',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 10,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: NesContainer(
                width: 512,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NesProgressBar(
                      value: progress,
                      width: 256,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Custom Width',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 10,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        NesButton(
          type: NesButtonType.normal,
          onPressed: progress < 1
              ? null
              : () {
                  Timer.periodic(
                    const Duration(milliseconds: 100),
                    (Timer timer) {
                      setState(() => progress += 0.01);
                      if (progress >= 1) {
                        timer.cancel();
                      }
                    },
                  );
                },
          child: const Text('Start'),
        ),
      ],
    );
  }
}
