import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@nes_vertical_grid_transition}
/// A Transition where lines will appear from the left and right
/// until the screen is filled.
/// {@endtemplate}
class NesVerticalGridTransition extends NesOverlayTransitionWidget {
  /// {@macro nes_vertical_grid_transition}
  const NesVerticalGridTransition({
    super.key,
    required super.animation,
    required super.child,
  });

  /// Creates a route with this animation.
  static PageRouteBuilder<T> route<T>({
    required RoutePageBuilder pageBuilder,
  }) {
    return PageRouteBuilder<T>(
      pageBuilder: pageBuilder,
      reverseTransitionDuration: const Duration(milliseconds: 1750),
      transitionDuration: const Duration(milliseconds: 1750),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return NesVerticalGridTransition(
          animation: animation,
          child: child,
        );
      },
    );
  }

  @override
  Widget buildOverlay(BuildContext context, double value) {
    final overlayTransitionTheme =
        context.nesThemeExtension<NesOverlayTransitionTheme>();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    final size = Size(
      width / 10,
      height / 10,
    );

    return Stack(
      children: [
        for (int x = 0; x < 10; x++)
          for (int y = 0; y < 10; y++)
            Positioned(
              left: y * size.width,
              top: x * size.height,
              child: Opacity(
                opacity: (y * 10) + x < value * 100 ? 1 : 0,
                child: ColoredBox(
                  color: overlayTransitionTheme.color,
                  child: SizedBox(
                    width: size.width + 2,
                    height: size.height + 2,
                  ),
                ),
              ),
            ),
      ],
    );
  }
}
