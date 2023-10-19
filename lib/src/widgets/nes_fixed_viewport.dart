import 'package:flutter/material.dart';

/// {@template nes_fixed_viewport}
/// A widget that imposes a fixed resolution on its child.
///
/// Defaults to a 256x240 resolution, which is the resolution of the NES.
/// {@endtemplate}
class NesFixedViewport extends StatelessWidget {
  /// {@macro nes_fixed_viewport}
  const NesFixedViewport({
    required this.child,
    this.resolution = const Size(256, 240),
    super.key,
  });

  /// The resolution to impose on [child].
  final Size resolution;

  /// The widget below this widget in the tree.
  final Widget child;

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

        return Center(
          child: Transform.scale(
            scale: scale,
            child: child,
          ),
        );
      },
    );
  }
}
