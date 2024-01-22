import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class _NesCustomCursorAreaHandler extends StatefulWidget {
  const _NesCustomCursorAreaHandler({
    required this.child,
  });

  final Widget child;

  @override
  State<_NesCustomCursorAreaHandler> createState() =>
      _NesCustomCursorAreaHandlerState();
}

class _NesCustomCursorAreaHandlerState
    extends State<_NesCustomCursorAreaHandler> {
  double _x = 0;
  double _y = 0;

  @override
  Widget build(BuildContext context) {
    final icon = NesCustomCursorArea.currentIcon(context).value;

    return Listener(
      onPointerMove: (event) {
        setState(() {
          _x = event.localPosition.dx;
          _y = event.localPosition.dy;
        });
      },
      child: Stack(
        children: [
          Positioned.fill(child: widget.child),
          Positioned(
            left: _x,
            top: _y,
            child: NesIcon(
              iconData: icon ?? NesIcons.arrowCursor,
            ),
          ),
        ],
      ),
    );
  }
}

/// {@template nes_custom_cursor_area}
/// A widget that defines a custom cursor area.
/// {@endtemplate}
class NesCustomCursorArea extends InheritedWidget {
  /// {@macro nes_custom_cursor_area}
  NesCustomCursorArea({
    required Widget child,
    NesIconData? icon,
    super.key,
  })  : _icon = ValueNotifier<NesIconData?>(icon),
        super(child: _NesCustomCursorAreaHandler(child: child));

  final ValueNotifier<NesIconData?> _icon;

  /// Changes the current cursor icon.
  static void changeCursor(BuildContext context, NesIconData icon) {
    final state = context.findAncestorWidgetOfExactType<NesCustomCursorArea>();

    state?._icon.value = icon;
  }

  /// Returns the current cursor icon.
  ///
  /// Throws an [ArgumentError] if the [NesCustomCursorArea] is not found in
  /// the tree.
  static ValueNotifier<NesIconData?> currentIcon(BuildContext context) {
    final state = context.findAncestorWidgetOfExactType<NesCustomCursorArea>();

    if (state == null) {
      throw ArgumentError(
        'NesCustomCursorArea not found. '
        'Make sure you wrap your app with it.',
      );
    }

    return state._icon;
  }

  @override
  bool updateShouldNotify(NesCustomCursorArea oldWidget) {
    return _icon != oldWidget._icon;
  }
}
