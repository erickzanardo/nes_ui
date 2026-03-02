import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_fill_transition}
/// A Transition that fills the screen.
/// {@endtemplate}
class NesFillTransition extends NesOverlayTransitionWidget {
  /// {@macro nes_fill_transition}
  const NesFillTransition({
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
        return NesFillTransition(animation: animation, child: child);
      },
    );
  }

  @override
  Widget buildOverlay(BuildContext context, double value) {
    final overlayTransitionTheme =
        context.nesThemeExtension<NesOverlayTransitionTheme>();

    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          width: size.width * value,
          height: size.height * value,
          child: NesFillColoredBox(color: overlayTransitionTheme.color),
        ),
      ],
    );
  }
}

@visibleForTesting
// ignore: public_member_api_docs
class NesFillColoredBox extends ColoredBox {
  /// Creates a NesFillColoredBox.
  const NesFillColoredBox({super.key, required super.color});
}
