import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_container_square_corner_painter}
/// A [NesContainerPainter] that renders squares in their corners,
/// connected by double lines.
/// {@endtemplate}
class NesContainerSquareCornerPainter extends NesContainerPainter {
  /// {@macro nes_container_square_corner_painter}
  NesContainerSquareCornerPainter({
    required super.label,
    required super.pixelSize,
    required super.textStyle,
    required super.backgroundColor,
    required super.borderColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = borderColor;
    final cornerPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = pixelSize.toDouble();
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
      // Top Left corner
      ..drawRect(Rect.fromLTWH(0, 0, pixelSize * 4, pixelSize * 4), cornerPaint)
      // Top Left corner center
      ..drawRect(
        Rect.fromLTWH(
          pixelSize.toDouble(),
          pixelSize.toDouble(),
          pixelSize * 2,
          pixelSize * 2,
        ),
        paint,
      )
      // Top Right corner
      ..drawRect(
        Rect.fromLTWH(
          size.width - pixelSize * 4,
          0,
          pixelSize * 4,
          pixelSize * 4,
        ),
        cornerPaint,
      )
      // Top Right corner center
      ..drawRect(
        Rect.fromLTWH(
          size.width - pixelSize * 3,
          pixelSize.toDouble(),
          pixelSize * 2,
          pixelSize * 2,
        ),
        paint,
      )
      // Bottom Left corner
      ..drawRect(
        Rect.fromLTWH(
          0,
          size.height - pixelSize * 4,
          pixelSize * 4,
          pixelSize * 4,
        ),
        cornerPaint,
      )
      // Bottom Left corner center
      ..drawRect(
        Rect.fromLTWH(
          pixelSize.toDouble(),
          size.height - pixelSize * 3,
          pixelSize * 2,
          pixelSize * 2,
        ),
        paint,
      )
      // Bottom Right corner
      ..drawRect(
        Rect.fromLTWH(
          size.width - pixelSize * 4,
          size.height - pixelSize * 4,
          pixelSize * 4,
          pixelSize * 4,
        ),
        cornerPaint,
      )
      // Bottom Right corner center
      ..drawRect(
        Rect.fromLTWH(
          size.width - pixelSize * 3,
          size.height - pixelSize * 3,
          pixelSize * 2,
          pixelSize * 2,
        ),
        paint,
      )
      // Top first line
      ..drawRect(
        Rect.fromLTWH(
          pixelSize * 4,
          0,
          size.width - pixelSize * 8,
          pixelSize.toDouble(),
        ),
        paint,
      )
      // Top second line
      ..drawRect(
        Rect.fromLTWH(
          pixelSize * 4,
          pixelSize * 2,
          size.width - pixelSize * 8,
          pixelSize.toDouble(),
        ),
        paint,
      )
      // Bottom first line
      ..drawRect(
        Rect.fromLTWH(
          pixelSize * 4,
          size.height - pixelSize.toDouble(),
          size.width - pixelSize * 8,
          pixelSize.toDouble(),
        ),
        paint,
      )
      // Bottom second line
      ..drawRect(
        Rect.fromLTWH(
          pixelSize * 4,
          size.height - pixelSize * 3,
          size.width - pixelSize * 8,
          pixelSize.toDouble(),
        ),
        paint,
      )
      // Left first line
      ..drawRect(
        Rect.fromLTWH(
          0,
          pixelSize * 4,
          pixelSize.toDouble(),
          size.height - pixelSize * 8,
        ),
        paint,
      )
      // Left second line
      ..drawRect(
        Rect.fromLTWH(
          pixelSize * 2,
          pixelSize * 4,
          pixelSize.toDouble(),
          size.height - pixelSize * 8,
        ),
        paint,
      )
      // Right first line
      ..drawRect(
        Rect.fromLTWH(
          size.width - pixelSize.toDouble(),
          pixelSize * 4,
          pixelSize.toDouble(),
          size.height - pixelSize * 8,
        ),
        paint,
      )
      // Right second line
      ..drawRect(
        Rect.fromLTWH(
          size.width - pixelSize * 3,
          pixelSize * 4,
          pixelSize.toDouble(),
          size.height - pixelSize * 8,
        ),
        paint,
      );

    drawDefaultLabel(canvas, backgroundPaint);
  }
}
