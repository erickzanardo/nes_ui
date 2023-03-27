import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_icon_button}
/// A button widget that wraps a [NesIcon] into a pressable button.
/// {@endtemplate}
class NesIconButton extends StatelessWidget {
  /// {@macro nes_icon_button}
  const NesIconButton({
    super.key,
    required this.icon,
    this.onPress,
    this.onPressStart,
    this.onPressEnd,
    this.size,
  });

  /// Icon of the button.
  final NesIconData icon;

  /// Called when the button is pressed.
  final VoidCallback? onPress;

  /// Called when the button is pressed.
  final VoidCallback? onPressStart;

  /// Called when pressed has ended.
  final VoidCallback? onPressEnd;

  /// An optional size for the icon button.
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return NesPressable(
      onPress: onPress,
      onPressStart: onPressStart,
      onPressEnd: onPressEnd,
      child: NesIcon(iconData: icon, size: size),
    );
  }
}
