// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

enum _CustomHeroClass {
  archer,
  knight,
  barbarian;

  NesIconData toIcon() {
    switch (this) {
      case _CustomHeroClass.knight:
        return NesIcons.sword;
      case _CustomHeroClass.archer:
        return NesIcons.arrow;
      case _CustomHeroClass.barbarian:
        return NesIcons.axe;
    }
  }
}

@widgetbook.UseCase(name: 'default', type: NesIterableOptions)
Widget iterableOptionsDefault(BuildContext context) {
  return Center(
    child: SizedBox(
      width: 250,
      child: StatefulBuilder(
        builder: (context, setState) {
          String value = 'Option 1';
          return NesIterableOptions<String>(
            onChange: (newValue) {
              setState(() {
                value = newValue;
              });
            },
            value: value,
            values: const ['Option 1', 'Option 2', 'Option 3'],
          );
        },
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'custom', type: NesIterableOptions)
Widget iterableOptionsCustom(BuildContext context) {
  return Center(
    child: SizedBox(
      width: 150,
      child: StatefulBuilder(
        builder: (context, setState) {
          _CustomHeroClass value = _CustomHeroClass.knight;
          return NesIterableOptions<_CustomHeroClass>(
            onChange: (newValue) {
              setState(() {
                value = newValue;
              });
            },
            leftIndicatorBuilder: (_) =>
                NesIcon(iconData: NesIcons.thinArrowLeft),
            rightIndicatorBuilder: (_) =>
                NesIcon(iconData: NesIcons.thinArrowRight),
            optionBuilder: (_, value) => NesIcon(iconData: value.toIcon()),
            value: value,
            values: _CustomHeroClass.values,
          );
        },
      ),
    ),
  );
}
