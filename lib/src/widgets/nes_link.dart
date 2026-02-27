import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_link}
/// A pressable label with a hyperlink style.
/// {@endtemplate}
class NesLink extends StatelessWidget {
  /// @macro nes_link
  const NesLink({required this.label, this.onPressed, super.key});

  /// The text to display in the link.
  final String label;

  /// The callback that is called when the link is pressed.
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null;
    final nesLinkTheme = context.nesThemeExtension<NesLinkTheme>();
    final textTheme = Theme.of(context).textTheme;
    final nesTheme = context.nesThemeExtension<NesTheme>();
    return NesPressable(
      onPress: onPressed,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isDisabled
                  ? nesLinkTheme.disabledColor
                  : nesLinkTheme.linkColor,
              width: nesTheme.pixelSize.toDouble(),
            ),
          ),
        ),
        child: Text(
          label,
          style: textTheme.bodyMedium?.copyWith(
            color: isDisabled
                ? nesLinkTheme.disabledColor
                : nesLinkTheme.linkColor,
          ),
        ),
      ),
    );
  }
}
