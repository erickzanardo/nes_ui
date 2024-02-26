import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// Definition for a function that builds a [NesBottomSheetPainter].
typedef NesBottomSheetPainterBuilder = NesBottomSheetPainter Function({
  required int pixelSize,
  required Color backgroundColor,
  required Color borderColor,
});

/// {@template nes_bottom_sheet_painter}
/// Base class for [NesBottomSheetPainter] painters.
/// {@endtemplate}
abstract class NesBottomSheetPainter extends CustomPainter {
  /// {@macro nes_bottom_sheet_painter}
  const NesBottomSheetPainter({
    required this.pixelSize,
    required this.backgroundColor,
    required this.borderColor,
  });

  /// Pixel size.
  final int pixelSize;

  /// Background color of this container.
  final Color backgroundColor;

  /// Border color of this container.
  final Color borderColor;

  @override
  bool shouldRepaint(NesBottomSheetPainter oldDelegate) {
    return oldDelegate.pixelSize != pixelSize ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.borderColor != borderColor;
  }
}

/// A [NesBottomSheetPainter] that paints a NES-style bottom sheet with rounded
/// borders.
class NesBottomSheetRoundedBorderPainter extends NesBottomSheetPainter {
  /// Creates a [NesBottomSheetRoundedBorderPainter].
  const NesBottomSheetRoundedBorderPainter({
    required super.pixelSize,
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
          size.height,
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
      // Left bar
      ..drawRect(
        Rect.fromLTWH(
          0,
          pixelSize * 2,
          pixelSize.toDouble(),
          size.height - pixelSize * 2,
        ),
        paint,
      )
      // Right bar
      ..drawRect(
        Rect.fromLTWH(
          size.width - pixelSize,
          pixelSize * 2,
          pixelSize.toDouble(),
          size.height - pixelSize * 2,
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
      );
  }
}

class _BottomSheetSlider extends StatefulWidget {
  const _BottomSheetSlider({
    required this.child,
  });

  final Widget child;

  @override
  _BottomSheetSliderState createState() => _BottomSheetSliderState();
}

class _BottomSheetSliderState extends State<_BottomSheetSlider> {
  bool _show = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _show = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 200),
      offset: Offset(0, _show ? 0 : 1),
      child: widget.child,
    );
  }
}

/// {@template nes_bottom_sheet_theme}
/// A [NesBottomSheetPainter] that paints a NES-style bottom sheet.
///
/// Its apparence can be customizable by providing a [NesBottomSheetTheme].
/// {@endtemplate}
class NesBottomSheet extends StatelessWidget {
  /// {@macro nes_bottom_sheet_theme}
  const NesBottomSheet({
    required this.child,
    super.key,
  });

  /// The child of the bottom sheet.
  final Widget child;

  /// A shortcut method that can be used to show this bottom sheet.
  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    double maxHeight = .5,
  }) {
    final nesTheme = context.nesThemeExtension<NesTheme>();

    final scaling = NesFixedViewportScaling.maybeOf(context);

    return showGeneralDialog<T>(
      context: context,
      barrierColor: Colors.transparent,
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return MouseRegion(
          cursor: nesTheme.basicCursor,
          child: SizedBox.expand(
            child: DecoratedBox(
              decoration: const BoxDecoration(
                image: NesCheckeredDecoration(),
              ),
              child: child,
            ),
          ),
        );
      },
      pageBuilder: (_, __, ___) {
        final mediaQuery = MediaQuery.of(context);
        final dialog = Material(
          color: Colors.transparent,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: mediaQuery.size.height * maxHeight,
              child: _BottomSheetSlider(
                child: NesBottomSheet(
                  child: builder(context),
                ),
              ),
            ),
          ),
        );

        if (scaling != null) {
          return Transform.scale(
            scale: scaling,
            child: dialog,
          );
        }

        return dialog;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final nesTheme = context.nesThemeExtension<NesTheme>();
    final bottomSheetTheme = context.nesThemeExtension<NesBottomSheetTheme>();
    return CustomPaint(
      painter: bottomSheetTheme.painter(
        pixelSize: bottomSheetTheme.pixelSize ?? nesTheme.pixelSize,
        backgroundColor: bottomSheetTheme.backgroundColor,
        borderColor: bottomSheetTheme.borderColor,
      ),
      child: Padding(
        padding: bottomSheetTheme.padding,
        child: child,
      ),
    );
  }
}
