import 'package:flutter/material.dart';
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
  // Controller for managing the overlay portal.
  final _controller = OverlayPortalController();

  // Method to show the tooltip by updating the state.
  void _showTooltip() {
    setState(_controller.show);
  }

  // Method to dismiss the tooltip by updating the state.
  void _dismissTooltip() {
    setState(_controller.hide);
  }

  // Get the anchor position based on the arrow direction and placement.
  Offset _getAnchorPosition(Size size) {
    switch (widget.arrowDirection) {
      case NesTooltipArrowDirection.top:
        switch (widget.arrowPlacement) {
          case NesTooltipArrowPlacement.left:
            return size.topLeft(Offset.zero);
          case NesTooltipArrowPlacement.middle:
            return size.topCenter(Offset.zero);
          case NesTooltipArrowPlacement.right:
            return size.topRight(Offset.zero);
        }
      case NesTooltipArrowDirection.bottom:
        switch (widget.arrowPlacement) {
          case NesTooltipArrowPlacement.left:
            return size.bottomLeft(Offset.zero);
          case NesTooltipArrowPlacement.middle:
            return size.bottomCenter(Offset.zero);
          case NesTooltipArrowPlacement.right:
            return size.bottomRight(Offset.zero);
        }
    }
  }

  // Calculate the start position for the tooltip based on the arrow placement.
  double _calculateStart(double dx, double width) {
    switch (widget.arrowPlacement) {
      case NesTooltipArrowPlacement.left:
        return dx;
      case NesTooltipArrowPlacement.right:
        return dx - width;
      case NesTooltipArrowPlacement.middle:
        return dx - width / 2;
    }
  }

  // Calculate the top position for the tooltip based on the arrow direction.
  double _calculateTop(double dy, double height, int pixelSize) {
    switch (widget.arrowDirection) {
      case NesTooltipArrowDirection.bottom:
        return dy + height - (pixelSize * 4.0);
      case NesTooltipArrowDirection.top:
        return dy - height - (pixelSize * 2.0);
    }
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

        // Get the position of the anchor relative to the screen.
        final target = box.localToGlobal(
          _getAnchorPosition(box.size),
          ancestor: overlayState.context.findRenderObject(),
        );

        // Instantiate the tooltip painter.
        final painter = _TooltipPainter(
          color: tooltipTheme.background,
          pixelSize: nesTheme.pixelSize.toDouble(),
          arrowPlacement: widget.arrowPlacement,
          arrowDirection: widget.arrowDirection,
          textPainter: TextPainter(
            textDirection: TextDirection.ltr,
            text: TextSpan(
              text: widget.message,
              style: textStyle.copyWith(color: tooltipTheme.textColor),
            ),
          )..layout(),
        );

        return Positioned.directional(
          textDirection: TextDirection.ltr,
          start: _calculateStart(target.dx, painter.size.width),
          width: painter.size.width,
          top: _calculateTop(
            target.dy,
            painter.size.height,
            nesTheme.pixelSize,
          ),
          height: painter.size.height,
          child: CustomPaint(painter: painter),
        );
      },
      child: GestureDetector(
        onLongPress: _showTooltip,
        onLongPressEnd: (_) => _dismissTooltip(),
        onLongPressCancel: _dismissTooltip,
        child: MouseRegion(
          onEnter: (_) => _showTooltip(),
          onExit: (_) => _dismissTooltip(),
          child: Semantics(tooltip: widget.message, child: widget.child),
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

    // Calculate arrow position
    final arrowOffset = switch (arrowPlacement) {
      NesTooltipArrowPlacement.left => pixelSize * 2,
      NesTooltipArrowPlacement.middle => size.width / 2 - pixelSize,
      NesTooltipArrowPlacement.right => size.width - pixelSize * 4,
    };

    final arrowBodyTopPosition = switch (arrowDirection) {
      NesTooltipArrowDirection.top => size.height + pixelSize,
      NesTooltipArrowDirection.bottom => pixelSize * -2,
    };

    final arrowHeadTopPosition = switch (arrowDirection) {
      NesTooltipArrowDirection.top => size.height + pixelSize * 2,
      NesTooltipArrowDirection.bottom => pixelSize * -3,
    };

    // Draw tooltip.
    canvas
      ..save()
      // Draw tooltip background.
      ..drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint)
      // Draw top and bottom borders.
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
      )
      // Draw arrow
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

    // Draw text
    textPainter.paint(canvas, Offset(pixelSize * 2, pixelSize));
  }

  @override
  bool shouldRepaint(_TooltipPainter oldDelegate) =>
      oldDelegate.color != color ||
      oldDelegate.pixelSize != pixelSize ||
      oldDelegate.arrowPlacement != arrowPlacement ||
      oldDelegate.textPainter != textPainter;
}
