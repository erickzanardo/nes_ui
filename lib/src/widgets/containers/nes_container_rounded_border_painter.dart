import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_container_rounded_border_painter}
/// A [NesContainerPainter] that renders a rounded border.
/// {@endtemplate}
class NesContainerRoundedBorderPainter extends NesContainerPainter {
  /// {@macro nes_container_rounded_border_painter}
  NesContainerRoundedBorderPainter({
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
      // Top bar
      ..drawRect(
        Rect.fromLTWH(
          pixelSize * 2,
          0,
          size.width - (pixelSize * 4),
          pixelSize.toDouble(),
        ),
        paint,
      )
      // Bottom bar
      ..drawRect(
        Rect.fromLTWH(
          pixelSize * 2,
          size.height - pixelSize,
          size.width - (pixelSize * 4),
          pixelSize.toDouble(),
        ),
        paint,
      )
      // Left bar
      ..drawRect(
        Rect.fromLTWH(
          0,
          pixelSize * 2,
          pixelSize.toDouble(),
          size.height - (pixelSize * 4),
        ),
        paint,
      )
      // Right bar
      ..drawRect(
        Rect.fromLTWH(
          size.width - pixelSize,
          pixelSize * 2,
          pixelSize.toDouble(),
          size.height - (pixelSize * 4),
        ),
        paint,
      )
      // Top left pixel
      ..drawRect(
        Rect.fromLTWH(
          pixelSize.toDouble(),
          pixelSize.toDouble(),
          pixelSize.toDouble(),
          pixelSize.toDouble(),
        ),
        paint,
      )
      // Top right pixel
      ..drawRect(
        Rect.fromLTWH(
          size.width - pixelSize * 2,
          pixelSize.toDouble(),
          pixelSize.toDouble(),
          pixelSize.toDouble(),
        ),
        paint,
      )
      // Bottom left pixel
      ..drawRect(
        Rect.fromLTWH(
          pixelSize.toDouble(),
          size.height - pixelSize * 2,
          pixelSize.toDouble(),
          pixelSize.toDouble(),
        ),
        paint,
      )
      // Bottom Right pixel
      ..drawRect(
        Rect.fromLTWH(
          size.width - pixelSize * 2,
          size.height - pixelSize * 2,
          pixelSize.toDouble(),
          pixelSize.toDouble(),
        ),
        paint,
      );

    drawDefaultLabel(canvas, backgroundPaint);
  }
}
