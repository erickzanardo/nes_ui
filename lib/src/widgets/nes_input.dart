import 'package:flutter/material.dart';

/// {@template nes_input_border}
/// Class used to render [TextField] inputs using
/// Flutter nes style.
/// {@endtemplate}
class NesInputBorder extends InputBorder {
  /// {@macro nes_input_border}
  const NesInputBorder({required super.borderSide});

  @override
  InputBorder copyWith({BorderSide? borderSide}) {
    return NesInputBorder(
      borderSide:
          borderSide?.copyWith(width: borderSide.width) ?? this.borderSide,
    );
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(borderSide.width);

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRect(rect.deflate(borderSide.width));
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()..addRect(rect);
  }

  @override
  bool get isOutline => true;

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is NesInputBorder) {
      return NesInputBorder(
        borderSide: BorderSide.lerp(
          a.borderSide.copyWith(width: borderSide.width),
          borderSide,
          t,
        ),
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is NesInputBorder) {
      return NesInputBorder(
        borderSide: BorderSide.lerp(
          borderSide,
          b.borderSide.copyWith(width: borderSide.width),
          t,
        ),
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    double? gapStart,
    double gapExtent = 0.0,
    double gapPercentage = 0.0,
    TextDirection? textDirection,
  }) {
    canvas.saveLayer(Rect.largest, Paint());

    final paint = Paint()..color = borderSide.color;

    final pixelSize = borderSide.width;

    // top border
    canvas
      ..drawRect(
        Rect.fromLTWH(pixelSize, 0, rect.width - pixelSize * 2, pixelSize),
        paint,
      )
      // bottom border
      ..drawRect(
        Rect.fromLTWH(
          pixelSize,
          rect.height - pixelSize,
          rect.width - pixelSize * 2,
          pixelSize,
        ),
        paint,
      )
      // left border
      ..drawRect(
        Rect.fromLTWH(0, pixelSize, pixelSize, rect.height - pixelSize * 2),
        paint,
      )
      // right border
      ..drawRect(
        Rect.fromLTWH(
          rect.width - pixelSize,
          pixelSize,
          pixelSize,
          rect.height - pixelSize * 2,
        ),
        paint,
      );

    if (gapStart != null && gapPercentage >= 0) {
      canvas.drawRect(
        Rect.fromLTWH(gapStart, -1, gapExtent * gapPercentage, pixelSize * 2),
        Paint()..blendMode = BlendMode.clear,
      );
    }

    canvas.restore();
  }

  @override
  ShapeBorder scale(double t) {
    return NesInputBorder(borderSide: borderSide.scale(t));
  }
}
