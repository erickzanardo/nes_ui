import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_container_corner_inner_square_painter}
/// A [NesContainerPainter] that renders small squares inside it's corner.
/// {@endtemplate}
class NesContainerCornerInnerSquarePainter extends NesContainerPainter {
  /// {@macro nes_container_corner_inner_square_painter}
  NesContainerCornerInnerSquarePainter({
    required super.label,
    required super.pixelSize,
    required super.textStyle,
    required super.backgroundColor,
    required super.borderColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = borderColor;
    final backgroundPaint = Paint()..color = backgroundColor;
    canvas
      // Background rect
      ..drawRect(
        Rect.fromLTWH(
          pixelSize.toDouble(),
          pixelSize.toDouble(),
          size.width - pixelSize * 2,
          size.height - pixelSize * 2,
        ),
        backgroundPaint,
      )
      // Top line
      ..drawRect(
        Rect.fromLTWH(
          pixelSize.toDouble(),
          0,
          size.width - pixelSize * 2,
          pixelSize.toDouble(),
        ),
        paint,
      )
      // Bottom line
      ..drawRect(
        Rect.fromLTWH(
          pixelSize.toDouble(),
          size.height - pixelSize,
          size.width - pixelSize * 2,
          pixelSize.toDouble(),
        ),
        paint,
      )
      // Left line
      ..drawRect(
        Rect.fromLTWH(
          0,
          pixelSize.toDouble(),
          pixelSize.toDouble(),
          size.height - pixelSize * 2,
        ),
        paint,
      )
      // Right line
      ..drawRect(
        Rect.fromLTWH(
          size.width - pixelSize,
          pixelSize.toDouble(),
          pixelSize.toDouble(),
          size.height - pixelSize * 2,
        ),
        paint,
      )
      // Top left corner bottom line
      ..drawRect(
        Rect.fromLTWH(
          pixelSize.toDouble(),
          pixelSize.toDouble() * 3,
          pixelSize.toDouble() * 2,
          pixelSize.toDouble(),
        ),
        paint,
      )
      // Top left corner right line
      ..drawRect(
        Rect.fromLTWH(
          pixelSize.toDouble() * 3,
          pixelSize.toDouble(),
          pixelSize.toDouble(),
          pixelSize.toDouble() * 2,
        ),
        paint,
      )
      // Top right corner bottom line
      ..drawRect(
        Rect.fromLTWH(
          size.width - pixelSize.toDouble() * 3,
          pixelSize.toDouble() * 3,
          pixelSize.toDouble() * 2,
          pixelSize.toDouble(),
        ),
        paint,
      )
      // Top right corner left line
      ..drawRect(
        Rect.fromLTWH(
          size.width - pixelSize.toDouble() * 4,
          pixelSize.toDouble(),
          pixelSize.toDouble(),
          pixelSize.toDouble() * 2,
        ),
        paint,
      )
      // Bottom left corner top line
      ..drawRect(
        Rect.fromLTWH(
          pixelSize.toDouble(),
          size.height - pixelSize.toDouble() * 4,
          pixelSize.toDouble() * 2,
          pixelSize.toDouble(),
        ),
        paint,
      )
      // Bottom left corner right line
      ..drawRect(
        Rect.fromLTWH(
          pixelSize.toDouble() * 3,
          size.height - pixelSize.toDouble() * 3,
          pixelSize.toDouble(),
          pixelSize.toDouble() * 2,
        ),
        paint,
      )
      // Bottom right corner top line
      ..drawRect(
        Rect.fromLTWH(
          size.width - pixelSize.toDouble() * 3,
          size.height - pixelSize.toDouble() * 4,
          pixelSize.toDouble() * 2,
          pixelSize.toDouble(),
        ),
        paint,
      )
      // Bottom right corner left line
      ..drawRect(
        Rect.fromLTWH(
          size.width - pixelSize.toDouble() * 4,
          size.height - pixelSize.toDouble() * 3,
          pixelSize.toDouble(),
          pixelSize.toDouble() * 2,
        ),
        paint,
      );

    drawDefaultLabel(canvas, backgroundPaint);
  }
}
