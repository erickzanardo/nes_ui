import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:nes_ui/src/extensions/color.dart';

/// Enum with the possible styles of [NesProgressBar].
enum NesProgressBarStyle {
  /// The progress will fill 1 pixel at a time. (Default value)
  pixel,

  /// The progress will fill smoothly.
  smooth,
}

/// {@template nes_progress_bar}
/// A widget that displays a progress amount.
/// {@endtemplate}
class NesProgressBar extends StatelessWidget {
  /// Creates a progress bar.
  ///
  /// {@macro nes_ui.NesProgressBar}
  const NesProgressBar({
    required this.value,
    this.style = NesProgressBarStyle.pixel,
    this.width,
    this.label,
    super.key,
  });

  /// The value for this progress bar.
  ///
  /// A value of 0.0 means no progress and 1.0 means that progress is complete.
  /// The value will be clamped to be in the range 0.0-1.0.
  ///
  /// This value will be read out by screen readers expressed as a percentage.
  /// i.e. `0.1` will become '10%'.
  final double value;

  /// The style of fill to use for the progress bar.
  ///
  /// Defaults to [NesProgressBarStyle.pixel]
  final NesProgressBarStyle style;

  /// The width of this progress bar.
  ///
  /// If null, the progress bar will fill the parent widget.
  final double? width;

  /// The label for this progress bar.
  ///
  /// This value indicates the purpose of the progress bar, and will be
  /// read out by screen readers to indicate the purpose of this progress bar.
  final String? label;

  @override
  Widget build(BuildContext context) {
    final progressBarTheme = context.nesThemeExtension<NesProgressBarTheme>();
    final nesTheme = context.nesThemeExtension<NesTheme>();

    return LayoutBuilder(
      builder: (context, constraints) => Semantics(
        label: label ?? '',
        value: '${(value * 100).round()}%',
        child: Align(
          child: SizedBox(
            width: width ?? constraints.maxWidth,
            height: nesTheme.pixelSize.toDouble() * 3,
            child: CustomPaint(
              painter: _ProgressBarPainter(
                background: progressBarTheme.background,
                color: progressBarTheme.color,
                style: style,
                width: width ?? constraints.maxWidth,
                pixelSize: nesTheme.pixelSize.toDouble(),
                textDirection: Directionality.of(context),
                value: value,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ProgressBarPainter extends CustomPainter {
  _ProgressBarPainter({
    required this.background,
    required this.color,
    required this.style,
    required this.width,
    required this.pixelSize,
    required this.textDirection,
    required this.value,
  });

  final Color background;
  final Color color;
  final NesProgressBarStyle style;
  final double width;
  final double pixelSize;
  final TextDirection textDirection;
  final double value;

  @override
  void paint(Canvas canvas, Size childSize) {
    final backgroundPaint = Paint()..color = background;
    final progressPaint = Paint()
      ..color = color.isLight() ? color.darken(.4) : color;
    final highlightPaint = Paint()
      ..color = color.isLight() ? color : color.brighten(.4);
    final size = Size(
      width,
      pixelSize * 3,
    );

    final progressPerPixel = 1 / ((width / pixelSize) - 2);

    final left = switch (textDirection) {
      TextDirection.rtl => size.width,
      TextDirection.ltr => 0.0,
    };
    final pixelLeft = switch (textDirection) {
      TextDirection.rtl => left - pixelSize,
      TextDirection.ltr => left + pixelSize,
    };

    // Draw progress bar.
    canvas
      ..save()
      // Draw progress bar background.
      ..drawRect(
        Offset(left, 0) & Size(size.width, size.height),
        backgroundPaint,
      )
      // Draw top and bottom borders.
      ..drawRect(
        Offset(pixelLeft, -pixelSize) &
            Size(size.width - (pixelSize * 2), pixelSize),
        backgroundPaint,
      )
      ..drawRect(
        Offset(pixelLeft, size.height) &
            Size(size.width - (pixelSize * 2), pixelSize),
        backgroundPaint,
      );
    // Draw progress bar progress.
    if (style == NesProgressBarStyle.smooth ||
        (style == NesProgressBarStyle.pixel && value >= progressPerPixel)) {
      final progressSize = (style == NesProgressBarStyle.pixel
          ? pixelSize
          : (size.width - (pixelSize * 4)) * value);
      canvas
        ..drawRect(
          Offset(pixelLeft, 0) & Size(progressSize, pixelSize * 2),
          highlightPaint,
        )
        ..drawRect(
          Offset(pixelLeft, pixelSize * 2) & Size(progressSize, pixelSize),
          progressPaint,
        );
    }
    if ((style == NesProgressBarStyle.smooth && value > progressPerPixel) ||
        (style == NesProgressBarStyle.pixel && value > progressPerPixel * 2)) {
      final progressSize = (style == NesProgressBarStyle.pixel
          ? (value / progressPerPixel).toInt() * pixelSize - pixelSize
          : (size.width - (pixelSize * 4)) * value);
      canvas
        ..drawRect(
          Offset(pixelLeft + pixelSize, 0) &
              Size(
                progressSize,
                pixelSize,
              ),
          highlightPaint,
        )
        ..drawRect(
          Offset(pixelLeft + pixelSize, pixelSize) &
              Size(
                progressSize,
                pixelSize * 2,
              ),
          progressPaint,
        );
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(_ProgressBarPainter oldDelegate) =>
      oldDelegate.background != background ||
      oldDelegate.color != color ||
      oldDelegate.style != style ||
      oldDelegate.width != width ||
      oldDelegate.pixelSize != pixelSize ||
      oldDelegate.textDirection != textDirection ||
      oldDelegate.value != value;
}
