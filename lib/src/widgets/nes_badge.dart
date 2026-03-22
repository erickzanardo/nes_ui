import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_badge}
/// Widget that displays a badge indicator on top of any widget.
///
/// The badge is positioned at the bottom-right corner of the child widget.
/// {@endtemplate}
class NesBadge extends StatelessWidget {
  /// {@macro nes_badge}
  const NesBadge({
    super.key,
    required this.child,
    required this.badge,
    this.primaryColor,
    this.secondaryColor,
  });

  /// The child widget to display the badge on.
  final Widget child;

  /// The badge to be displayed on the child.
  final String badge;

  /// Optional primary color for the badge.
  /// Will use value from the theme if none is provided.
  final Color? primaryColor;

  /// Optional secondary color for the badge text.
  /// Will use value from the theme if none is provided.
  final Color? secondaryColor;

  @override
  Widget build(BuildContext context) {
    final nesTheme = context.nesThemeExtension<NesTheme>();
    final nesIconTheme = context.nesThemeExtension<NesIconTheme>();
    return Stack(
      children: [
        child,
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
