import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_pressable}
/// A widget that allows a [child] to be pressable.
/// Meaning that it can be clicked or touched.
/// {@endtemplate}
class NesPressable extends StatefulWidget {
  /// {@macro nes_pressable}
  const NesPressable({
    required this.child,
    this.onPressStart,
    this.onPressEnd,
    this.onPress,
    super.key,
  });

  /// Called when the press input has started.
  final VoidCallback? onPressStart;

  /// Called when the press input has ended.
  final VoidCallback? onPressEnd;

  /// Called when the press input has happened.
  final VoidCallback? onPress;

  /// Child.
  final Widget child;

  @override
  State<NesPressable> createState() => _NesPressableState();
}

class _NesPressableState extends State<NesPressable> {
  var _pressed = false;

  @override
  Widget build(BuildContext context) {
    final nesTheme = context.nesThemeExtension<NesTheme>();
    return Transform.translate(
      offset: Offset(0, _pressed ? nesTheme.pixelSize.toDouble() : 0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            widget.onPress?.call();
          },
          onTapDown: (_) {
            widget.onPressStart?.call();
            setState(() {
              _pressed = true;
            });
          },
          onTapUp: (_) {
            widget.onPressEnd?.call();
            setState(() {
              _pressed = false;
            });
          },
          onTapCancel: () {
            widget.onPressEnd?.call();
            if (_pressed) {
              setState(() {
                _pressed = false;
              });
            }
          },
          child: widget.child,
        ),
      ),
    );
  }
}
