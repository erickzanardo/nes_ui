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
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.disabled,
    this.behavior,
    super.key,
  });

  /// Called when the press input has started.
  final VoidCallback? onPressStart;

  /// Called when the press input has ended.
  final VoidCallback? onPressEnd;

  /// Called when the press input has happened.
  final VoidCallback? onPress;

  /// Called when a tap down event occurs.
  final VoidCallback? onTapDown;

  /// Called when a tap up event occurs.
  final VoidCallback? onTapUp;

  /// Called when a tap is cancelled.
  final VoidCallback? onTapCancel;

  /// Disabled pressable component
  final bool? disabled;

  /// Child.
  final Widget child;

  /// The behavior of the hit test of this widget.
  final HitTestBehavior? behavior;

  @override
  State<NesPressable> createState() => _NesPressableState();
}

class _NesPressableState extends State<NesPressable> {
  var _pressed = false;

  @override
  Widget build(BuildContext context) {
    final hasListeners = widget.onPress != null ||
        widget.onPressStart != null ||
        widget.onPressEnd != null;
    final nesTheme = context.nesThemeExtension<NesTheme>();
    final offSet = Offset(
      0,
      (_pressed && hasListeners && widget.disabled != true)
          ? nesTheme.pixelSize.toDouble()
          : 0,
    );
    return Transform.translate(
      offset: offSet,
      child: MouseRegion(
        cursor: nesTheme.clickCursor,
        child: GestureDetector(
          behavior: widget.behavior,
          onTap: () {
            widget.onPress?.call();
          },
          onTapDown: (_) {
            widget.onTapDown?.call();
            widget.onPressStart?.call();
            setState(() {
              _pressed = true;
            });
          },
          onTapUp: (_) {
            widget.onTapUp?.call();
            widget.onPressEnd?.call();
            setState(() {
              _pressed = false;
            });
          },
          onTapCancel: () {
            widget.onTapCancel?.call();
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
