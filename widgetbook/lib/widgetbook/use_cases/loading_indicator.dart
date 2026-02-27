// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'NesHourglassLoadingIndicator',
  type: NesHourglassLoadingIndicator,
  path: 'widgets/loading indicators',
)
Widget hourglass(BuildContext context) =>
    const Center(child: NesHourglassLoadingIndicator());

@widgetbook.UseCase(
  name: 'NesTerminalLoadingIndicator',
  type: NesTerminalLoadingIndicator,
  path: 'widgets/loading indicators',
)
Widget terminal(BuildContext context) =>
    const Center(child: NesTerminalLoadingIndicator());

@widgetbook.UseCase(
  name: 'NesJumpingIconsLoadingIndicator',
  path: 'widgets/loading indicators',
  type: NesJumpingIconsLoadingIndicator,
)
Widget jumpingIcons(BuildContext context) => Center(
  child: NesJumpingIconsLoadingIndicator(
    icons: [NesIcons.sword, NesIcons.shield, NesIcons.axe],
  ),
);

@widgetbook.UseCase(
  name: 'NesMutatingIconsLoadingIndicator',
  path: 'widgets/loading indicators',
  type: NesMutatingIconsLoadingIndicator,
)
Widget mutatingIcons(BuildContext context) => Center(
  child: NesMutatingIconsLoadingIndicator(
    icons: [NesIcons.sword, NesIcons.shield, NesIcons.axe],
  ),
);

@widgetbook.UseCase(
  name: 'NesPixelRowLoadingIndicator',
  path: 'widgets/loading indicators',
  type: NesPixelRowLoadingIndicator,
)
Widget pixelRow(BuildContext context) =>
    const Center(child: NesPixelRowLoadingIndicator());
