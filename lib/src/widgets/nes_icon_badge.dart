import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_mini_sprite/flutter_mini_sprite.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_icon_badge}
/// Widget that renders icons from the Flutter Nes design library.
///
/// Check [NesIcons] for the library of built in icons.
/// {@endtemplate}
class NesIconBadge extends StatelessWidget {
  /// {@macro nes_icon_badge}
  const NesIconBadge({
    super.key,
    required this.iconData,
    required this.badge,
    this.size,
    this.primaryColor,
    this.secondaryColor,
  });

  /// Data of this icon.
  final NesIconData iconData;

  /// An optional size for the icon.
  ///
  /// When ommited the icon will be in its "original"
  /// size concerning the current pixel size of the theme.
  final Size? size;

  /// Optional primary color for the icon.
  /// Will use value from the theme if none is provided.
  final Color? primaryColor;

  /// Optional secondary color for the icon.
  /// Will use value from the theme if none is provided.
  final Color? secondaryColor;

  /// The badge to be displayed on the icon.
  final String badge;

  @override
  Widget build(BuildContext context) {
    final nesTheme = context.nesThemeExtension<NesTheme>();
    final nesIconTheme = context.nesThemeExtension<NesIconTheme>();
    return Stack(
      children: [
        NesIcon(
          iconData: iconData,
          size: size,
          primaryColor: primaryColor,
          secondaryColor: secondaryColor,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: primaryColor ?? nesIconTheme.primary,
            ),
            child: Padding(
              padding: EdgeInsets.all(nesTheme.pixelSize.toDouble()),
              child: Text(
                badge,
                style: TextStyle(
                  color: secondaryColor ?? nesIconTheme.secondary,
                  fontSize: nesTheme.pixelSize * 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
