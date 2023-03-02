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
    required this.onPress,
    this.size,
  });

  /// Icon of the button.
  final NesIconData icon;

  /// Caleed when the button is pressed.
  final VoidCallback onPress;

  /// An optional size for the icon button.
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return NesPressable(
      onPress: onPress,
      child: NesIcon(iconData: icon, size: size),
    );
  }
}
