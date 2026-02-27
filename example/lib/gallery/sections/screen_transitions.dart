import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class ScreenTransitionsSection extends StatelessWidget {
  const ScreenTransitionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Screen Transitions', style: theme.textTheme.displayMedium),
        const SizedBox(height: 16),
        Wrap(
          children: [
            NesButton(
              type: NesButtonType.normal,
              child: const Text('Vertical Close'),
              onPressed: () {
                Navigator.of(context).push(
                  NesVerticalCloseTransition.route<void>(
                    pageBuilder: (_, __, ___) {
                      return _MockPage();
                    },
                  ),
                );
              },
            ),
            const SizedBox(width: 16),
            NesButton(
              type: NesButtonType.normal,
              child: const Text('Horizontal Close'),
              onPressed: () {
                Navigator.of(context).push(
                  NesHorizontalCloseTransition.route<void>(
                    pageBuilder: (_, __, ___) {
                      return _MockPage();
                    },
                  ),
                );
              },
            ),
            const SizedBox(width: 16),
            NesButton(
              type: NesButtonType.normal,
              child: const Text('Screen Fill'),
              onPressed: () {
                Navigator.of(context).push(
                  NesFillTransition.route<void>(
                    pageBuilder: (_, __, ___) {
                      return _MockPage();
                    },
                  ),
                );
              },
            ),
            const SizedBox(width: 16),
            NesButton(
              type: NesButtonType.normal,
              child: const Text('Horizontal Grid'),
              onPressed: () {
                Navigator.of(context).push(
                  NesHorizontalGridTransition.route<void>(
                    pageBuilder: (_, __, ___) {
                      return _MockPage();
                    },
                  ),
                );
              },
            ),
            const SizedBox(width: 16),
            NesButton(
              type: NesButtonType.normal,
              child: const Text('Vertical Grid'),
              onPressed: () {
                Navigator.of(context).push(
                  NesVerticalGridTransition.route<void>(
                    pageBuilder: (_, __, ___) {
                      return _MockPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _MockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
            const SizedBox(height: 8),
            NesButton(
              type: NesButtonType.normal,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
