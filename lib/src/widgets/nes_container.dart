import 'package:flutter/material.dart';
import 'package:flutter_nes/flutter_nes.dart';

/// {@template nes_container}
/// A bordered container, with an optional label.
/// {@endtemplate}
class NesContainer extends StatelessWidget {
  /// {@macro nes_container}
  const NesContainer({
    super.key,
    this.label,
    this.child,
    this.width,
    this.height,
  });

  /// An optional label for the container.
  final String? label;

  /// Child of the container.
  final Widget? child;

  /// Container width.
  final double? width;

  /// Container height.
  final double? height;

  @override
  Widget build(BuildContext context) {
    final textStyle =
        Theme.of(context).textTheme.labelMedium ?? const TextStyle();

    final nesTheme = context.nesThemeExtension<NesTheme>();

    return CustomPaint(
      painter: _ContainerPainter(
        label: label,
        pixelSize: nesTheme.pixelSize,
        textStyle: textStyle,
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: child,
        ),
      ),
    );
  }
}

class _ContainerPainter extends CustomPainter {
  const _ContainerPainter({
    this.label,
    required this.pixelSize,
    required this.textStyle,
  });

  final String? label;
  final int pixelSize;
  final TextStyle textStyle;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = textStyle.color ?? Colors.black;
    canvas
      ..saveLayer(Rect.largest, Paint())
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

    if (label != null) {
      final painter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(
          text: label,
          style: textStyle,
        ),
      )..layout();

      canvas.drawRect(
        Rect.fromLTWH(
          pixelSize * 6,
          0,
          painter.width + pixelSize * 2,
          painter.height,
        ),
        Paint()..blendMode = BlendMode.clear,
      );

      painter.paint(
        canvas,
        Offset(pixelSize * 8, 0),
      );
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(_ContainerPainter oldDelegate) {
    return oldDelegate.label != label ||
        oldDelegate.pixelSize != pixelSize ||
        oldDelegate.textStyle != textStyle;
  }
}
