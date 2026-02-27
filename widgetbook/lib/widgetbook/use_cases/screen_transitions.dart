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

@widgetbook.UseCase(
  name: 'page view',
  type: NesVerticalCloseTransition,
  path: 'screen_transitions',
)
Widget verticalClosePageView(BuildContext context) {
  return _PageViewExample();
}

class _PageViewExample extends StatefulWidget {
  @override
  State<_PageViewExample> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<_PageViewExample>
    with SingleTickerProviderStateMixin {
  late final PageController _pageController;
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    _animationController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context),
      home: Scaffold(
        body: ColoredBox(
          color: const Color(0xffDCDCDC),
          child: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: [
              NesVerticalCloseTransition(
                animation: _animation,
                child: const ColoredBox(
                  color: Color(0xffDCDCDC),
                  child: Center(
                    child: Text('Page 1', style: TextStyle(fontSize: 24)),
                  ),
                ),
              ),
              NesHorizontalCloseTransition(
                animation: _animation,
                child: const ColoredBox(
                  color: Color(0xffE8E8E8),
                  child: Center(
                    child: Text('Page 2', style: TextStyle(fontSize: 24)),
                  ),
                ),
              ),
              NesHorizontalGridTransition(
                animation: _animation,
                child: const ColoredBox(
                  color: Color(0xffD3D3D3),
                  child: Center(
                    child: Text('Page 3', style: TextStyle(fontSize: 24)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
