import 'package:flutter/material.dart';

/// {@template nes_fixed_viewport_scaling}
/// An InheritedWidget that provides the current scale imposed by a
/// [NesFixedViewport] down the widget tree.
/// {@endtemplate}
class NesFixedViewportScaling extends InheritedWidget {
  /// {@macro nes_fixed_viewport_scaling}
  const NesFixedViewportScaling({
    required this.scale,
    required super.child,
    super.key,
  });

  /// The viewport scale factor.
  final double scale;

  /// Returns the current scale imposed by a [NesFixedViewport], if any.
  static double? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<NesFixedViewportScaling>()
        ?.scale;
  }

  @override
  bool updateShouldNotify(NesFixedViewportScaling oldWidget) =>
      scale != oldWidget.scale;
}

/// {@template nes_fixed_viewport}
/// A widget that imposes a fixed resolution on its child.
///
/// Defaults to a 256x240 resolution, which is the resolution of the NES.
/// {@endtemplate}
class NesFixedViewport extends StatelessWidget {
  /// {@macro nes_fixed_viewport}
  const NesFixedViewport({
    required this.builder,
    this.resolution = const Size(256, 240),
    this.alignment = Alignment.center,
    super.key,
  });

  /// The resolution to impose on [builder] returned child.
  final Size resolution;

  /// The widget below this widget in the tree.
  final WidgetBuilder builder;

  /// The Alignment of the widgets returned by the [builder] within the
  /// viewport.
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final aspectRatio = width / height;
        final resolutionAspectRatio = resolution.width / resolution.height;
        final scale = aspectRatio > resolutionAspectRatio
            ? height / resolution.height
            : width / resolution.width;

        return SizedBox(
          width: width,
          height: height,
          child: Align(
            alignment: alignment,
            child: SizedBox(
              width: resolution.width * scale,
              height: resolution.height * scale,
              child: Transform.scale(
                scale: scale,
                child: Align(
                  child: SizedBox(
                    width: resolution.width,
                    height: resolution.height,
                    child: NesFixedViewportScaling(
                      scale: scale,
                      child: Builder(builder: builder),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
