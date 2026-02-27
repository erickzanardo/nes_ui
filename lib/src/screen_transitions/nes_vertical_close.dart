import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_vertical_close_transition}
/// A Transition that looks like vertical doors are closing in front
/// of the current screen, opening again with the new one.
/// {@endtemplate}
class NesVerticalCloseTransition extends NesOverlayTransitionWidget {
  /// {@macro nes_vertical_close_transition}
  const NesVerticalCloseTransition({
    super.key,
    required super.animation,
    required super.child,
  });

  /// Creates a route with this animation.
  static PageRouteBuilder<T> route<T>({
    required RoutePageBuilder pageBuilder,
    Duration duration = const Duration(milliseconds: 750),
  }) {
    return PageRouteBuilder<T>(
      pageBuilder: pageBuilder,
      reverseTransitionDuration: duration,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return NesVerticalCloseTransition(animation: animation, child: child);
      },
    );
  }

  @override
  Widget buildOverlay(BuildContext context, double value) {
    final overlayTransitionTheme = context
        .nesThemeExtension<NesOverlayTransitionTheme>();
    final height = MediaQuery.of(context).size.height;
    final half = height / 2;

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: half * value,
          child: NesVerticalCloseColoredBox(
            color: overlayTransitionTheme.color,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          top: height - (half * value),
          child: NesVerticalCloseColoredBox(
            color: overlayTransitionTheme.color,
          ),
        ),
      ],
    );
  }
}

@visibleForTesting
// ignore: public_member_api_docs
class NesVerticalCloseColoredBox extends ColoredBox {
  /// Creates a NesVerticalCloseColoredBox.
  const NesVerticalCloseColoredBox({super.key, required super.color});
}
