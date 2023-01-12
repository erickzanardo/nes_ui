import 'package:flutter/material.dart';
import 'package:flutter_nes/flutter_nes.dart';

/// {@template nes_check_box}
/// A Check Box widget.
/// {@endtemplate}
class NesCheckBox extends StatelessWidget {
  /// {@macro nes_check_box}
  const NesCheckBox({
    super.key,
    required this.value,
    this.onChange,
  });

  /// Value (Checked or not)
  final bool value;

  /// Called with the new value and received a change input.
  final void Function(bool)? onChange;

  @override
  Widget build(BuildContext context) {
    final textStyle =
        Theme.of(context).textTheme.labelMedium ?? const TextStyle();
    final nesTheme = context.nesThemeExtension<NesTheme>();

    return GestureDetector(
      onTap: () {
        onChange?.call(!value);
      },
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          border: Border.all(
            color: textStyle.color ?? Colors.black,
            width: nesTheme.pixelSize.toDouble(),
          ),
        ),
        child: value
            ? Transform.translate(
              offset: const Offset(2, -6),
                child: NesIcon(iconData: NesIcons.instance.check),
              )
            : null,
      ),
    );
  }
}
