// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default', type: NesBadge)
Widget normal(BuildContext context) => const Center(
  child: NesBadge(child: Icon(Icons.star), badge: '5'),
);

@widgetbook.UseCase(name: 'with NesIcon', type: NesBadge)
Widget withNesIcon(BuildContext context) => const Center(
  child: NesBadge(
    child: NesIcon(iconData: NesIcons.heart),
    badge: '99+',
  ),
);
