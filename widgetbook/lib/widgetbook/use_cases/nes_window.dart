// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default', type: NesWindow)
Widget defaultCase(BuildContext context) => const Center(
      child: NesWindow(
        width: 300,
        height: 200,
        title: 'Window Title',
        child: Center(child: Text('Window Content')),
      ),
    );

@widgetbook.UseCase(name: 'with icon', type: NesWindow)
Widget withIcon(BuildContext context) => Center(
      child: NesWindow(
        width: 300,
        height: 200,
        title: 'Window Title',
        icon: NesIcons.window,
        child: const Center(child: Text('Window Content')),
      ),
    );

@widgetbook.UseCase(name: 'with actions', type: NesWindow)
Widget withActions(BuildContext context) => Center(
      child: NesWindow(
        width: 300,
        height: 200,
        title: 'Window Title',
        actions: [(NesIcons.add, () {}), (NesIcons.remove, () {})],
        child: const Center(child: Text('Window Content')),
      ),
    );

@widgetbook.UseCase(name: 'with close button', type: NesWindow)
Widget withCloseButton(BuildContext context) => Center(
      child: NesWindow(
        width: 300,
        height: 200,
        title: 'Window Title',
        onClose: () {},
        child: const Center(child: Text('Window Content')),
      ),
    );

@widgetbook.UseCase(name: 'with resize', type: NesWindow)
Widget withResize(BuildContext context) => Center(
      child: NesWindow(
        width: 300,
        height: 200,
        title: 'Window Title',
        onResize: (offset) {},
        child: const Center(child: Text('Drag corners to resize')),
      ),
    );

@widgetbook.UseCase(name: 'with move', type: NesWindow)
Widget withMove(BuildContext context) => Center(
      child: NesWindow(
        width: 300,
        height: 200,
        title: 'Window Title',
        onMove: (offset) {},
        child: const Center(child: Text('Drag title bar to move')),
      ),
    );

@widgetbook.UseCase(name: 'full featured', type: NesWindow)
Widget fullFeatured(BuildContext context) => Center(
      child: NesWindow(
        width: 300,
        height: 200,
        title: 'Window Title',
        icon: NesIcons.window,
        actions: [(NesIcons.add, () {}), (NesIcons.remove, () {})],
        onClose: () {},
        onResize: (offset) {},
        onMove: (offset) {},
        child: const Center(child: Text('Full featured window')),
      ),
    );
