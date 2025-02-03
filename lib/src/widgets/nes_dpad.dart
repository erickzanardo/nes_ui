import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// The four ways direction of the NES Dpad.
enum NesDpadDirection {
  /// Up
  up,

  /// Down
  down,

  /// Left
  left,

  /// Right
  right,
}

/// {@template nes_dpad}
/// A widget that renders a four ways directional pad.
/// {@endtemplate}
class NesDpad extends StatefulWidget {
  /// {@macro nes_dpad}
  const NesDpad({
    this.onButtonDown,
    this.onButtonUp,
    this.buttonBuilder = _defaultButtonBuilder,
    this.buttonSize = 40,
    super.key,
  });

  /// The callback that is called when a direction is pressed.
  final void Function(NesDpadDirection)? onButtonDown;

  /// The callback that is called when a direction is released.
  final void Function(NesDpadDirection)? onButtonUp;

  /// The builder that is called to render the key.
  final Widget Function(
    BuildContext context,
    NesDpadDirection direction, {
    required double buttonSize,
    required bool pressed,
  }) buttonBuilder;

  /// The size of the button.
  final double buttonSize;

  @override
  State<NesDpad> createState() => _NesDpadState();
}

class _NesDpadState extends State<NesDpad> {
  bool _upPressed = false;
  bool _downPressed = false;
  bool _leftPressed = false;
  bool _rightPressed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: widget.buttonSize),
            GestureDetector(
              child: widget.buttonBuilder(
                context,
                NesDpadDirection.up,
                buttonSize: widget.buttonSize,
                pressed: _upPressed,
              ),
              onTapDown: (_) {
                widget.onButtonDown?.call(NesDpadDirection.up);
                setState(() {
                  _upPressed = true;
                });
              },
              onTapUp: (_) {
                widget.onButtonUp?.call(NesDpadDirection.up);
                setState(() {
                  _upPressed = false;
                });
              },
            ),
            SizedBox(width: widget.buttonSize),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              child: widget.buttonBuilder(
                context,
                NesDpadDirection.left,
                buttonSize: widget.buttonSize,
                pressed: _leftPressed,
              ),
              onTapDown: (_) {
                widget.onButtonDown?.call(NesDpadDirection.left);
                setState(() {
                  _leftPressed = true;
                });
              },
              onTapUp: (_) {
                widget.onButtonUp?.call(NesDpadDirection.left);
                setState(() {
                  _leftPressed = false;
                });
              },
            ),
            SizedBox(width: widget.buttonSize),
            GestureDetector(
              child: widget.buttonBuilder(
                context,
                NesDpadDirection.right,
                buttonSize: widget.buttonSize,
                pressed: _rightPressed,
              ),
              onTapDown: (_) {
                widget.onButtonDown?.call(NesDpadDirection.right);
                setState(() {
                  _rightPressed = true;
                });
              },
              onTapUp: (_) {
                widget.onButtonUp?.call(NesDpadDirection.right);
                setState(() {
                  _rightPressed = false;
                });
              },
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: widget.buttonSize),
            GestureDetector(
              child: widget.buttonBuilder(
                context,
                NesDpadDirection.down,
                buttonSize: widget.buttonSize,
                pressed: _downPressed,
              ),
              onTapDown: (_) {
                widget.onButtonDown?.call(NesDpadDirection.down);
                setState(() {
                  _downPressed = true;
                });
              },
              onTapUp: (_) {
                widget.onButtonUp?.call(NesDpadDirection.down);
                setState(() {
                  _downPressed = false;
                });
              },
            ),
            SizedBox(width: widget.buttonSize),
          ],
        ),
      ],
    );
  }
}

Widget _defaultButtonBuilder(
  BuildContext context,
  NesDpadDirection direction, {
  required double buttonSize,
  required bool pressed,
}) {
  late final NesIconData iconData;

  switch (direction) {
    case NesDpadDirection.up:
      iconData = NesIcons.topArrowIndicator;
    case NesDpadDirection.down:
      iconData = NesIcons.bottomArrowIndicator;
    case NesDpadDirection.left:
      iconData = NesIcons.leftArrowIndicator;
    case NesDpadDirection.right:
      iconData = NesIcons.rightArrowIndicator;
  }

  return SizedBox.square(
    dimension: buttonSize,
    child: Transform.translate(
      offset: pressed ? const Offset(0, 4) : Offset.zero,
      child: NesIcon(
        iconData: iconData,
        size: Size.square(buttonSize),
      ),
    ),
  );
}
