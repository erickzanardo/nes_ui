import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_container_multi_step_corner_painter}
/// A [NesContainerPainter] that renders corners with configurable
/// pixel-stepped rounding, inspired by classic NES/Famicom RPG UI
/// (e.g. Dragon Quest message windows).
///
/// Use [cornerSteps] to control how many pixel steps are used
/// for the corner rounding. A value of 1 is equivalent to the
/// default [NesContainerRoundedBorderPainter].
/// {@endtemplate}
class NesContainerMultiStepCornerPainter extends NesContainerPainter {
  /// {@macro nes_container_multi_step_corner_painter}
  NesContainerMultiStepCornerPainter({
    required super.label,
    required super.pixelSize,
    required super.textStyle,
    required super.backgroundColor,
    required super.borderColor,
    this.cornerSteps = 1,
  }) : assert(cornerSteps >= 1, 'cornerSteps must be at least 1');

  /// The number of pixel steps used for corner rounding.
  ///
  /// Higher values produce smoother, more rounded corners:
  /// - 1: Single pixel step (same as [NesContainerRoundedBorderPainter])
  /// - 2: Two pixel steps
  /// - 3: Three pixel steps (Dragon Quest style)
  final int cornerSteps;

  /// Creates a [NesContainerPainterBuilder] with the given [cornerSteps].
  ///
  /// This factory method captures the [cornerSteps] value and returns
  /// a builder compatible with [NesContainer.painterBuilder].
  ///
  /// ```dart
  /// NesContainer(
  ///   painterBuilder: NesContainerMultiStepCornerPainter.builder(
  ///     cornerSteps: 3,
  ///   ),
  ///   child: Text('Hello!'),
  /// )
  /// ```
  static NesContainerPainterBuilder builder({int cornerSteps = 1}) {
    return ({
      required String? label,
      required int pixelSize,
      required TextStyle textStyle,
      required Color backgroundColor,
      required Color borderColor,
    }) =>
        NesContainerMultiStepCornerPainter(
          label: label,
          pixelSize: pixelSize,
          textStyle: textStyle,
          backgroundColor: backgroundColor,
          borderColor: borderColor,
          cornerSteps: cornerSteps,
        );
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = borderColor;
    final backgroundPaint = Paint()..color = backgroundColor;

    final ps = pixelSize.toDouble();
    final w = size.width;
    final h = size.height;
    final offset = (cornerSteps + 1) * ps;

    canvas
      // Background — fill inside the border area.
      ..drawRect(
        Rect.fromLTWH(ps, ps, w - ps * 2, h - ps * 2),
        backgroundPaint,
      )
      // Top bar
      ..drawRect(
        Rect.fromLTWH(offset, 0, w - offset * 2, ps),
        paint,
      )
      // Bottom bar
      ..drawRect(
        Rect.fromLTWH(offset, h - ps, w - offset * 2, ps),
        paint,
      )
      // Left bar
      ..drawRect(
        Rect.fromLTWH(0, offset, ps, h - offset * 2),
        paint,
      )
      // Right bar
      ..drawRect(
        Rect.fromLTWH(w - ps, offset, ps, h - offset * 2),
        paint,
      );

    // Draw stepped corners.
    for (var i = 0; i < cornerSteps; i++) {
      final outerOffset = (cornerSteps - i) * ps;
      final innerOffset = (i + 1) * ps;

      canvas
        // Top-left corner step
        ..drawRect(
          Rect.fromLTWH(outerOffset, innerOffset, ps, ps),
          paint,
        )
        // Top-right corner step
        ..drawRect(
          Rect.fromLTWH(w - outerOffset - ps, innerOffset, ps, ps),
          paint,
        )
        // Bottom-left corner step
        ..drawRect(
          Rect.fromLTWH(outerOffset, h - innerOffset - ps, ps, ps),
          paint,
        )
        // Bottom-right corner step
        ..drawRect(
          Rect.fromLTWH(w - outerOffset - ps, h - innerOffset - ps, ps, ps),
          paint,
        );
    }

    drawDefaultLabel(canvas, backgroundPaint);
  }

  @override
  bool shouldRepaint(covariant NesContainerMultiStepCornerPainter oldDelegate) {
    return super.shouldRepaint(oldDelegate) ||
        oldDelegate.cornerSteps != cornerSteps;
  }
}
