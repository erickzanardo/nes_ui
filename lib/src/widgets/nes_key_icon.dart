import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_key_icon}
/// A pressable icon, representing a single key.
///
/// This widget by itself doesn't handle touch/key events
/// use it in combination with other widgets to make it
/// interactive.
/// {@endtemplate}
class NesKeyIcon extends StatelessWidget {
  /// {@macro nes_key_icon}
  const NesKeyIcon({
    super.key,
    required this.buttonKey,
    this.pressed = false,
    this.size,
  }) : assert(buttonKey.length == 1, 'buttonKey must be a single character');

  /// The key that this icon represents.
  final String buttonKey;

  /// If this button is in a pressed state or not.
  final bool pressed;

  /// Size.
  final Size? size;

  @override
  Widget build(BuildContext context) {
    final nesTheme = context.nesThemeExtension<NesTheme>();
    final nesIconTheme = context.nesThemeExtension<NesIconTheme>();

    final pixelSize = nesTheme.pixelSize.toDouble();

    final iconData =
        pressed ? NesIcons.pressedButton : NesIcons.unpressedButton;

    final buttonSize = size ??
        Size(
          iconData.sprite.pixels[0].length * pixelSize,
          iconData.sprite.pixels.length * pixelSize,
        );

    return Stack(
      children: [
        Positioned(
          child: NesIcon(size: buttonSize, iconData: iconData),
        ),
        Positioned(
          left: buttonSize.width / 2 - 5,
          top: buttonSize.height / 2 - (pressed ? 4 : 8),
          child: Text(
            buttonKey.toUpperCase(),
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: nesIconTheme.secondary),
          ),
        ),
      ],
    );
  }
}
