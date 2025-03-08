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
  static const double _verticalOffset = 24;

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
        final target = box.localToGlobal(
          box.size.center(Offset.zero),
          ancestor: overlayState.context.findRenderObject(),
        );

        return Positioned.fill(
          bottom: MediaQuery.maybeViewInsetsOf(context)?.bottom ?? 0.0,
          child: CustomSingleChildLayout(
            delegate: _TooltipPositionDelegate(
              target: target,
              verticalOffset: _verticalOffset,
              preferBelow:
                  widget.arrowDirection == NesTooltipArrowDirection.top,
            ),
            child: CustomPaint(
              foregroundPainter: _TooltipPainter(
                color: tooltipTheme.background,
                pixelSize: nesTheme.pixelSize.toDouble(),
                arrowPlacement: widget.arrowPlacement,
                arrowDirection: widget.arrowDirection,
                textStyle: textStyle,
                message: widget.message,
                textColor: tooltipTheme.textColor,
              ),
            ),
          ),
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
          child: widget.child,
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
    required this.textStyle,
    required this.textColor,
    required this.message,
  });

  final Color color;
  final double pixelSize;
  final NesTooltipArrowPlacement arrowPlacement;
  final NesTooltipArrowDirection arrowDirection;
  final TextStyle textStyle;
  final Color textColor;
  final String message;

  @override
  SemanticsBuilderCallback? get semanticsBuilder => (size) {
        return [
          CustomPainterSemantics(
            rect: Rect.fromLTWH(0, 0, size.width, size.height),
            properties: SemanticsProperties(
              label: message,
              textDirection: TextDirection.ltr,
            ),
          ),
        ];
      };

  @override
  void paint(Canvas canvas, Size childSize) {
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: message,
        style: textStyle.copyWith(
          color: textColor,
        ),
      ),
    )..layout();

    final textSize = textPainter.size;

    final paint = Paint()..color = color;

    final size = Size(
      textSize.width + pixelSize * 4,
      textSize.height + pixelSize * 2,
    );

    final arrowOffset = switch (arrowPlacement) {
      NesTooltipArrowPlacement.left => pixelSize * 2,
      NesTooltipArrowPlacement.middle => size.width / 2 - pixelSize,
      NesTooltipArrowPlacement.right => size.width - pixelSize * 4,
    };

    canvas.save();

    final translateX = switch (arrowPlacement) {
      NesTooltipArrowPlacement.left => 0.0,
      NesTooltipArrowPlacement.middle => -size.width / 2 + childSize.width / 2,
      NesTooltipArrowPlacement.right => -size.width + childSize.width,
    };

    final translateY = switch (arrowDirection) {
      NesTooltipArrowDirection.top => -size.height - pixelSize * 4,
      NesTooltipArrowDirection.bottom => size.height + pixelSize * 8,
    };

    canvas
      ..translate(translateX, translateY)
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
      oldDelegate.textColor != textColor ||
      oldDelegate.message != message ||
      oldDelegate.textStyle != textStyle;
}

/// A delegate for computing the layout of a tooltip to be displayed above or
/// below a target specified in the global coordinate system.
class _TooltipPositionDelegate extends SingleChildLayoutDelegate {
  /// Creates a delegate for computing the layout of a tooltip.
  _TooltipPositionDelegate({
    required this.target,
    required this.verticalOffset,
    required this.preferBelow,
  });

  /// The offset of the target the tooltip is positioned near in the global
  /// coordinate system.
  final Offset target;

  /// The amount of vertical distance between the target and the displayed
  /// tooltip.
  final double verticalOffset;

  /// Whether the tooltip is displayed below its widget by default.
  ///
  /// If there is insufficient space to display the tooltip in the preferred
  /// direction, the tooltip will be displayed in the opposite direction.
  final bool preferBelow;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) =>
      constraints.loosen();

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return positionDependentBox(
      size: size,
      childSize: childSize,
      target: target,
      verticalOffset: verticalOffset,
      preferBelow: preferBelow,
    );
  }

  @override
  bool shouldRelayout(_TooltipPositionDelegate oldDelegate) {
    return target != oldDelegate.target ||
        verticalOffset != oldDelegate.verticalOffset ||
        preferBelow != oldDelegate.preferBelow;
  }
}
