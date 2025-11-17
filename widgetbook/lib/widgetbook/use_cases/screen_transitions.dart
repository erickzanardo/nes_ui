// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: NesVerticalCloseTransition,
  path: 'screen_transitions',
)
Widget verticalClose(BuildContext context) {
  return MaterialApp(
    theme: Theme.of(context),
    home: Scaffold(
      body: Center(
        child: Builder(
          builder: (context) {
            return NesButton.text(
              type: NesButtonType.primary,
              text: 'Navigate',
              onPressed: () {
                Navigator.of(context).push(
                  NesVerticalCloseTransition.route<void>(
                    pageBuilder: (context, _, __) => Scaffold(
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 16,
                          children: [
                            const Text('This is the new screen!'),
                            NesButton.text(
                              type: NesButtonType.warning,
                              text: 'Go Back',
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'default',
  type: NesHorizontalCloseTransition,
  path: 'screen_transitions',
)
Widget horizontalClose(BuildContext context) {
  return MaterialApp(
    theme: Theme.of(context),
    home: Scaffold(
      body: Center(
        child: Builder(
          builder: (context) {
            return NesButton.text(
              type: NesButtonType.primary,
              text: 'Navigate',
              onPressed: () {
                Navigator.of(context).push(
                  NesHorizontalCloseTransition.route<void>(
                    pageBuilder: (context, _, __) => Scaffold(
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 16,
                          children: [
                            const Text('This is the new screen!'),
                            NesButton.text(
                              type: NesButtonType.warning,
                              text: 'Go Back',
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'default',
  type: NesFillTransition,
  path: 'screen_transitions',
)
Widget fill(BuildContext context) {
  return MaterialApp(
    theme: Theme.of(context),
    home: Scaffold(
      body: Center(
        child: Builder(
          builder: (context) {
            return NesButton.text(
              type: NesButtonType.primary,
              text: 'Navigate',
              onPressed: () {
                Navigator.of(context).push(
                  NesFillTransition.route<void>(
                    pageBuilder: (context, _, __) => Scaffold(
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 16,
                          children: [
                            const Text('This is the new screen!'),
                            NesButton.text(
                              type: NesButtonType.warning,
                              text: 'Go Back',
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'default',
  type: NesVerticalGridTransition,
  path: 'screen_transitions',
)
Widget verticalGrid(BuildContext context) {
  return MaterialApp(
    theme: Theme.of(context),
    home: Scaffold(
      body: Center(
        child: Builder(
          builder: (context) {
            return NesButton.text(
              type: NesButtonType.primary,
              text: 'Navigate',
              onPressed: () {
                Navigator.of(context).push(
                  NesVerticalGridTransition.route<void>(
                    pageBuilder: (context, _, __) => Scaffold(
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 16,
                          children: [
                            const Text('This is the new screen!'),
                            NesButton.text(
                              type: NesButtonType.warning,
                              text: 'Go Back',
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'default',
  type: NesHorizontalGridTransition,
  path: 'screen_transitions',
)
Widget horizontalGrid(BuildContext context) {
  return MaterialApp(
    theme: Theme.of(context),
    home: Scaffold(
      body: Center(
        child: Builder(
          builder: (context) {
            return NesButton.text(
              type: NesButtonType.primary,
              text: 'Navigate',
              onPressed: () {
                Navigator.of(context).push(
                  NesHorizontalGridTransition.route<void>(
                    pageBuilder: (context, _, __) => Scaffold(
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 16,
                          children: [
                            const Text('This is the new screen!'),
                            NesButton.text(
                              type: NesButtonType.warning,
                              text: 'Go Back',
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    ),
  );
}
