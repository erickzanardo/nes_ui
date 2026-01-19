import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook/widgetbook.dart';

import 'components.book.dart';

final config = Config(
  components: components,
  addons: [
    ViewportAddon([Viewports.none, IosViewports.iPhone13]),
    BuilderAddon(
      name: 'Center use cases',
      builder: (context, child) {
        return Center(child: child);
      },
    ),
    MaterialThemeAddon({
      'Light': flutterNesTheme(),
      'Dark': flutterNesTheme(brightness: Brightness.dark),
    }),
  ],
);
