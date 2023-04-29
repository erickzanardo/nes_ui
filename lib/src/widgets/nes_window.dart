import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_window}
/// A widget that renders a window with a NES style.
/// {@endtemplate}
class NesWindow extends StatelessWidget {
  /// {@macro nes_window}
  const NesWindow({
    super.key,
    this.width,
    this.height,
    this.title,
    this.icon,
    this.child,
  });

  /// The width of the window.
  final double? width;

  /// The height of the window.
  final double? height;

  /// The title of the window.
  final String? title;

  /// The window icon.
  final NesIconData? icon;

  /// The window child.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final textStyle =
        Theme.of(context).textTheme.labelMedium ?? const TextStyle();

    final containerColor = Theme.of(context).cardColor;
    final nesTheme = context.nesThemeExtension<NesTheme>();

    final titleBarHeight = (textStyle.fontSize ?? 8) + nesTheme.pixelSize * 4;
    final titleBarPadding = (nesTheme.pixelSize * 2).toDouble();

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(nesTheme.pixelSize.toDouble()),
      decoration: BoxDecoration(
        color: containerColor,
        border: Border.all(
          width: nesTheme.pixelSize.toDouble(),
          color: textStyle.color ?? Colors.black,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: titleBarHeight,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: textStyle.color ?? Colors.black,
              ),
              child: Row(
                children: [
                  SizedBox(width: titleBarPadding),
                  if (icon != null)
                    NesIcon(
                      iconData: icon!,
                      size: Size.square(textStyle.fontSize ?? 8),
                      primaryColor: containerColor,
                      secondaryColor: textStyle.color,
                    ),
                  if (title != null)
                    Expanded(
                      child: Center(
                        child: Text(
                          title!,
                          style: textStyle.copyWith(
                            color: containerColor,
                          ),
                        ),
                      ),
                    ),
                  SizedBox(width: titleBarPadding),
                ],
              ),
            ),
          ),
          SizedBox(
            height: nesTheme.pixelSize.toDouble(),
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}
