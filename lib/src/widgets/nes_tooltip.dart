import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:nes_ui/nes_ui.dart';

/// Enum with the possible placements for the arrow of the tooltip.
enum NesTooltipArrowPlacement {
  /// The arrow will be placed on the left side of the tooltip.
  left,

  /// The arrow will be placed on the middle of the tooltip.
  middle,

  /// The arrow will be placed on the right side of the tooltip.
  right,
}

/// Enum with the possible direction for the arrow of the tooltip.
enum NesTooltipArrowDirection {
  /// The arrow will be direct on the top side of the tooltip. (Default value)
  top,

  /// The arrow will be direct on the bottom side of the tooltip.
  bottom,
}

/// {@template nes_tooltip}
/// A tooltip that appears when the user long-presses on a widget,
/// or hovers over it with a mouse.
/// {@endtemplate}
class NesTooltip extends StatefulWidget {
  /// {@macro nes_tooltip}
  const NesTooltip({
    super.key,
    required this.child,
    required this.message,
    this.arrowPlacement = NesTooltipArrowPlacement.middle,
    this.arrowDirection = NesTooltipArrowDirection.top,
  });

  /// The Widget that will trigger the tooltip.
  final Widget child;

  /// The message to be displayed in the tooltip.
  final String message;

  /// The placement of the arrow of the tooltip.
  final NesTooltipArrowPlacement arrowPlacement;

  /// The direction for the arrow of the tooltip
  final NesTooltipArrowDirection arrowDirection;

  @override
  State<NesTooltip> createState() => _NesTooltipState();
}

class _NesTooltipState extends State<NesTooltip>
    with SingleTickerProviderStateMixin<NesTooltip> {
  final OverlayPortalController _controller = OverlayPortalController();

  // Show the tooltip.
  void _showTooltip() {
    setState(_controller.show);
  }

  // Dismiss the tooltip.
  void _dismissTooltip() {
    setState(_controller.hide);
  }

  @override
  Widget build(BuildContext context) {
    final textStyle =
        Theme.of(context).textTheme.labelMedium ?? const TextStyle();
    final tooltipTheme = context.nesThemeExtension<NesTooltipTheme>();
    final nesTheme = context.nesThemeExtension<NesTheme>();

    return OverlayPortal(
      controller: _controller,
      overlayChildBuilder: (BuildContext context) {
        final overlayState = Overlay.of(context, debugRequiredFor: widget);
        final box = this.context.findRenderObject()! as RenderBox;

        //
        var anchorPosition = box.size.center(Offset.zero);
        switch (widget.arrowDirection) {
          case NesTooltipArrowDirection.top:
            switch (widget.arrowPlacement) {
              case NesTooltipArrowPlacement.left:
                anchorPosition = box.size.topLeft(Offset.zero);
                break;
              case NesTooltipArrowPlacement.middle:
                anchorPosition = box.size.topCenter(Offset.zero);
                break;
              case NesTooltipArrowPlacement.right:
                anchorPosition = box.size.topRight(Offset.zero);
                break;
            }
            break;
          case NesTooltipArrowDirection.bottom:
            switch (widget.arrowPlacement) {
              case NesTooltipArrowPlacement.left:
                anchorPosition = box.size.bottomLeft(Offset.zero);
                break;
              case NesTooltipArrowPlacement.middle:
                anchorPosition = box.size.bottomCenter(Offset.zero);
                break;
              case NesTooltipArrowPlacement.right:
                anchorPosition = box.size.bottomRight(Offset.zero);
                break;
            }
            break;
        }

        final target = box.localToGlobal(
          anchorPosition,
          ancestor: overlayState.context.findRenderObject(),
        );

        final painter = _TooltipPainter(
          color: tooltipTheme.background,
          pixelSize: nesTheme.pixelSize.toDouble(),
          arrowPlacement: widget.arrowPlacement,
          arrowDirection: widget.arrowDirection,
          textPainter: TextPainter(
            textDirection: TextDirection.ltr,
            text: TextSpan(
              text: widget.message,
              style: textStyle.copyWith(
                color: tooltipTheme.textColor,
              ),
            ),
          )..layout(),
        );

        return Positioned.directional(
          textDirection: TextDirection.ltr,
          start: widget.arrowPlacement == NesTooltipArrowPlacement.left
              ? target.dx
              : widget.arrowPlacement == NesTooltipArrowPlacement.right
                  ? target.dx - painter.size.width
                  : target.dx - painter.size.width / 2,
          width: painter.size.width,
          top: widget.arrowDirection == NesTooltipArrowDirection.bottom
              ? target.dy + painter.size.height - (nesTheme.pixelSize * 4.0)
              : target.dy - painter.size.height - (nesTheme.pixelSize * 2.0),
          height: painter.size.height,
          child: CustomPaint(painter: painter),
        );
      },
      child: GestureDetector(
        // ignore: unnecessary_lambdas
        onLongPress: () {
          _showTooltip();
        },
        onLongPressEnd: (_) {
          _dismissTooltip();
        },
        // ignore: unnecessary_lambdas
        onLongPressCancel: () {
          _dismissTooltip();
        },
        child: MouseRegion(
          onEnter: (_) {
            _showTooltip();
          },
          onExit: (_) {
            _dismissTooltip();
          },
          child: Semantics(
            tooltip: widget.message,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

class _TooltipPainter extends CustomPainter {
  _TooltipPainter({
    required this.color,
    required this.pixelSize,
    required this.arrowPlacement,
    required this.arrowDirection,
    required this.textPainter,
  });

  final Color color;
  final double pixelSize;
  final NesTooltipArrowPlacement arrowPlacement;
  final NesTooltipArrowDirection arrowDirection;
  final TextPainter textPainter;

  Size get size => Size(
        textPainter.size.width + pixelSize * 4,
        textPainter.size.height + pixelSize * 2,
      );

  @override
  void paint(Canvas canvas, Size childSize) {
    final paint = Paint()..color = color;

    final arrowOffset = switch (arrowPlacement) {
      NesTooltipArrowPlacement.left => pixelSize * 2,
      NesTooltipArrowPlacement.middle => size.width / 2 - pixelSize,
      NesTooltipArrowPlacement.right => size.width - pixelSize * 4,
    };

    canvas
      ..save()
      ..drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height),
        paint,
      )
      ..drawRect(
        Rect.fromLTWH(
          pixelSize,
          -pixelSize,
          size.width - pixelSize * 2,
          pixelSize,
        ),
        paint,
      )
      ..drawRect(
        Rect.fromLTWH(
          pixelSize,
          size.height,
          size.width - pixelSize * 2,
          pixelSize,
        ),
        paint,
      );

    textPainter.paint(canvas, Offset(pixelSize * 2, pixelSize));

    final arrowBodyTopPosition = switch (arrowDirection) {
      NesTooltipArrowDirection.top => size.height + pixelSize,
      NesTooltipArrowDirection.bottom => pixelSize * -2,
    };

    final arrowHeadTopPosition = switch (arrowDirection) {
      NesTooltipArrowDirection.top => size.height + pixelSize * 2,
      NesTooltipArrowDirection.bottom => pixelSize * -3,
    };
    // Arrow
    canvas
      ..drawRect(
        Rect.fromLTWH(
          arrowOffset,
          arrowBodyTopPosition,
          pixelSize * 2,
          pixelSize,
        ),
        paint,
      )
      ..drawRect(
        Rect.fromLTWH(
          arrowOffset + pixelSize / 2,
          arrowHeadTopPosition,
          pixelSize,
          pixelSize,
        ),
        paint,
      )
      ..restore();
  }

  @override
  bool shouldRepaint(_TooltipPainter oldDelegate) =>
      oldDelegate.color != color ||
      oldDelegate.pixelSize != pixelSize ||
      oldDelegate.arrowPlacement != arrowPlacement ||
      oldDelegate.textPainter != textPainter;
}
