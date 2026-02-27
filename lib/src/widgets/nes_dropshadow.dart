import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_dropshadow}
/// Renders a dropshadow around the child in the NES style.
/// {@endtemplate}
class NesDropshadow extends StatelessWidget {
  /// {@macro nes_dropshadow}
  const NesDropshadow({required this.child, this.x = 2, this.y = 2, super.key})
    : assert(
        x >= 0 && y >= 0,
        'Negative dropshadow offsets are not supported.',
      );

  /// The a mount of pixel's (in NES Ui units) to offset the shadow.
  final int x;

  /// The a mount of pixel's (in NES Ui units) to offset the shadow.
  final int y;

  /// The child of the shadow.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final nesTheme = context.nesThemeExtension<NesTheme>();
    final textStyle =
        Theme.of(context).textTheme.labelMedium ?? const TextStyle();

    return CustomPaint(
      painter: _NesDropshadowPainter(
        x: x,
        y: y,
        pixelSize: nesTheme.pixelSize,
        color: textStyle.color ?? Colors.black,
      ),
      child: child,
    );
  }
}

class _NesDropshadowPainter extends CustomPainter {
  _NesDropshadowPainter({
    required this.x,
    required this.y,
    required this.pixelSize,
    required this.color,
  });

  final int x;
  final int y;
  final int pixelSize;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    // Draw bottom checker pattern
    for (var pointY = 0; pointY < y; pointY++) {
      for (var pointX = 0; pointX < size.width / pixelSize; pointX++) {
        if ((pointY.isEven && pointX.isOdd) ||
            (pointY.isOdd && pointX.isEven)) {
          canvas.drawRect(
            Rect.fromLTWH(
              (x * pixelSize) + pointX * pixelSize.toDouble(),
              size.height + (pointY * pixelSize),
              pixelSize.toDouble(),
              pixelSize.toDouble(),
            ),
            paint,
          );
        }
      }
    }

    // Draw side checker pattern
    for (var pointY = 0; pointY < (size.height / pixelSize) - y; pointY++) {
      for (var pointX = 0; pointX < x; pointX++) {
        if ((pointY.isEven && pointX.isEven) ||
            (pointY.isOdd && pointX.isOdd)) {
          canvas.drawRect(
            Rect.fromLTWH(
              size.width + (pointX * pixelSize),
              (y * pixelSize) + pointY * pixelSize.toDouble(),
              pixelSize.toDouble(),
              pixelSize.toDouble(),
            ),
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(_NesDropshadowPainter oldDelegate) {
    return oldDelegate.x != x ||
        oldDelegate.y != y ||
        oldDelegate.color != color ||
        oldDelegate.pixelSize != pixelSize;
  }
}
