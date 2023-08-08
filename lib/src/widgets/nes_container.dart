import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

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
    this.backgroundColor,
    this.padding,
  });

  /// An optional label for the container.
  final String? label;

  /// Child of the container.
  final Widget? child;

  /// Container width.
  final double? width;

  /// Container height.
  final double? height;

  /// Background color of this container,
  /// when null, defaults to [ThemeData.cardColor].
  final Color? backgroundColor;

  /// An optional padding to apply to the container.
  ///
  /// When omitted, defaults to [NesContainerTheme.padding].
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final nesContainerTheme = context.nesThemeExtension<NesContainerTheme>();

    final textStyle = nesContainerTheme.labelTextStyle;

    final containerColor = backgroundColor ?? nesContainerTheme.backgroundColor;

    final padding = this.padding ?? nesContainerTheme.padding;

    final nesTheme = context.nesThemeExtension<NesTheme>();

    return CustomPaint(
      painter: _ContainerPainter(
        label: label,
        pixelSize: nesTheme.pixelSize,
        textStyle: textStyle,
        backgroundColor: containerColor,
        borderColor: nesContainerTheme.borderColor,
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: padding,
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
    required this.backgroundColor,
    required this.borderColor,
  });

  final String? label;
  final int pixelSize;
  final TextStyle textStyle;
  final Color backgroundColor;
  final Color borderColor;

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
          -1,
          painter.width + pixelSize * 2,
          painter.height,
        ),
        backgroundPaint,
      );

      painter.paint(
        canvas,
        Offset(pixelSize * 8, 0),
      );
    }
  }

  @override
  bool shouldRepaint(_ContainerPainter oldDelegate) {
    return oldDelegate.label != label ||
        oldDelegate.pixelSize != pixelSize ||
        oldDelegate.textStyle != textStyle;
  }
}
