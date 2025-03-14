// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_app/widgetbook/widgetbook.directories.g.dart';
import 'package:widgetbook_app/widgetbook/widgets/widgets.dart';

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      //darkTheme: flutterNesTheme(brightness: Brightness.dark),
      //lightTheme: flutterNesTheme(),
      addons: [
        BuilderAddon(
          name: 'Decorator',
          builder: (context, child) {
            return UseCaseDecorator(child: child);
          },
        ),
        ThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: flutterNesTheme(),
            ),
            WidgetbookTheme(
              name: 'Dark',
              data: flutterNesTheme(brightness: Brightness.dark),
            ),
          ],
          themeBuilder: (context, theme, child) {
            return Theme(
              data: theme,
              child: DefaultTextStyle(
                style: theme.textTheme.bodyMedium ?? const TextStyle(),
                child: child,
              ),
            );
          },
        ),
      ],
    );
  }
}
