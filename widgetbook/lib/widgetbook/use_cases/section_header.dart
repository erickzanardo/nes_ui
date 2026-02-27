// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default', type: NesSectionHeader)
Widget defaultCase(BuildContext context) => const Center(
      child: NesContainer(child: NesSectionHeader(title: 'Section Header')),
    );

@widgetbook.UseCase(name: 'start', type: NesSectionHeader)
Widget start(BuildContext context) => const Center(
      child: NesContainer(
        child: NesSectionHeader(
          title: 'Section Header',
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
