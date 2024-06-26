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
    this.borderColor,
    this.padding,
    this.painterBuilder,
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

  /// Border color of this container,
  /// when null, defaults to [NesContainerTheme.borderColor].
  final Color? borderColor;

  /// An optional padding to apply to the container.
  ///
  /// When omitted, defaults to [NesContainerTheme.padding].
  final EdgeInsets? padding;

  /// The builder that create the painter to use for this container.
  ///
  /// When omitted, defaults to [NesContainerTheme.painter].
  final NesContainerPainterBuilder? painterBuilder;

  @override
  Widget build(BuildContext context) {
    final nesContainerTheme = context.nesThemeExtension<NesContainerTheme>();

    final textStyle = nesContainerTheme.labelTextStyle;

    final containerColor = backgroundColor ?? nesContainerTheme.backgroundColor;

    final padding = this.padding ?? nesContainerTheme.padding;

    final nesTheme = context.nesThemeExtension<NesTheme>();

    final pixelSize = nesContainerTheme.pixelSize ?? nesTheme.pixelSize;

    final painter = painterBuilder ?? nesContainerTheme.painter;

    return CustomPaint(
      painter: painter(
        label: label,
        pixelSize: pixelSize,
        textStyle: textStyle,
        backgroundColor: containerColor,
        borderColor: borderColor ?? nesContainerTheme.borderColor,
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

/// Definition for a function that builds a [NesContainerPainter].
typedef NesContainerPainterBuilder = NesContainerPainter Function({
  required String? label,
  required int pixelSize,
  required TextStyle textStyle,
  required Color backgroundColor,
  required Color borderColor,
});

/// {@template nes_container_painter}
/// Base class for [NesContainer] painters.
/// {@endtemplate}
abstract class NesContainerPainter extends CustomPainter {
  /// {@macro nes_container_painter}
  const NesContainerPainter({
    required this.label,
    required this.pixelSize,
    required this.textStyle,
    required this.backgroundColor,
    required this.borderColor,
  });

  /// An optional label for the container.
  final String? label;

  /// Pixel size.
  final int pixelSize;

  /// Text style for the label.
  final TextStyle textStyle;

  /// Background color of this container.
  final Color backgroundColor;

  /// Border color of this container.
  final Color borderColor;

  /// Draws the default label in the canvas.
  void drawDefaultLabel(Canvas canvas, Paint backgroundPaint) {
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
  bool shouldRepaint(NesContainerPainter oldDelegate) {
    return oldDelegate.label != label ||
        oldDelegate.pixelSize != pixelSize ||
        oldDelegate.textStyle != textStyle ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.borderColor != borderColor;
  }
}
