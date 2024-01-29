import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_split_panel}
/// A widget that splits the available space into multiple panes.
///
/// It can have either a vertical or horizontal orientation and
/// the initial size of the panels can be specified in the [initialSizes]
/// parameter.
///
/// If no initial sizes are specified, the panels will be equally sized and
/// if a value for that attribute is specified, its length must match the
/// length of its [children].
///
/// [initialSizes] must be a list of doubles that represents the portion
/// that a panel should use from the available space, and the sum of all
/// the values must be equal to 1.
///
/// {@endtemplate}
class NesSplitPanel extends StatefulWidget {
  /// {@macro nes_split_panel}
  const NesSplitPanel({
    super.key,
    required this.children,
    this.orientation = Axis.horizontal,
    this.resizerSize = 16,
    this.initialSizes,
  }) : assert(
          initialSizes == null || initialSizes.length == children.length,
          'The length of the initialSizes must match the length of the '
          'children.',
        );

  /// The widgets that will be split into multiple panes.
  final List<Widget> children;

  /// The orientation of the split panel.
  final Axis orientation;

  /// The initial size of the panels.
  final List<double>? initialSizes;

  /// The size of the resizer.
  final double resizerSize;

  @override
  State<NesSplitPanel> createState() => _NesSplitPanelState();
}

class _NesSplitPanelState extends State<NesSplitPanel> {
  late List<double> _sizePoints;

  @override
  void initState() {
    super.initState();
    assert(
      widget.initialSizes == null ||
          widget.initialSizes!.reduce((a, b) => a + b) == 1,
      'The sum of the initialSizes must be equal to 1.',
    );

    if (widget.initialSizes == null) {
      _sizePoints = List<double>.filled(
        widget.children.length,
        1 / widget.children.length,
      );
    } else {
      _sizePoints = [...widget.initialSizes!];
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final children = <Widget>[];
        for (var i = 0; i < widget.children.length; i++) {
          final totalSize = widget.orientation == Axis.horizontal
              ? constraints.maxWidth
              : constraints.maxHeight;

          final isLast = i + 1 == widget.children.length;

          final modifer = isLast
              ? (-widget.resizerSize * (widget.children.length - 1))
              : widget.resizerSize / 2;

          children.add(
            SizedBox(
              width: widget.orientation == Axis.horizontal
                  ? math.max(0, _sizePoints[i] * totalSize + modifer)
                  : null,
              height: widget.orientation == Axis.vertical
                  ? math.max(0, _sizePoints[i] * totalSize + modifer)
                  : null,
              child: !isLast
                  ? NesSplitPanelResizeHandler(
                      orientation: widget.orientation,
                      resizerSize: widget.resizerSize,
                      onResize: (value) {
                        setState(() {
                          final newSize = _sizePoints[i] + value / totalSize;

                          final maxClampSize =
                              (_sizePoints[i] + _sizePoints[i + 1]) - .05;
                          final newClamppedSize =
                              newSize.clamp(.05, maxClampSize);

                          final previousValue = _sizePoints[i];
                          _sizePoints[i] = newClamppedSize;

                          _sizePoints[i + 1] = math.max(
                            .05,
                            (previousValue + _sizePoints[i + 1]) -
                                newClamppedSize,
                          );
                        });
                      },
                      child: widget.children[i],
                    )
                  : widget.children[i],
            ),
          );
        }

        return widget.orientation == Axis.horizontal
            ? Row(children: children)
            : Column(children: children);
      },
    );
  }
}

/// {@template nes_split_panel_resize_handler}
/// A widget that handles the resizing of the split panel.
/// {@endtemplate}
class NesSplitPanelResizeHandler extends StatelessWidget {
  /// {@macro nes_split_panel_resize_handler}
  const NesSplitPanelResizeHandler({
    required this.orientation,
    required this.onResize,
    required this.child,
    required this.resizerSize,
    super.key,
  });

  /// The orientation of the split panel.
  final Axis orientation;

  /// The child widget.
  final Widget child;

  /// The callback that will be called when the user drags the resizer.
  final void Function(double) onResize;

  /// The size of the resizer.
  final double resizerSize;

  @override
  Widget build(BuildContext context) {
    final nesTheme = context.nesThemeExtension<NesTheme>();
    final children = [
      Expanded(child: child),
      GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (orientation == Axis.vertical) return;
          onResize(details.delta.dx);
        },
        onVerticalDragUpdate: (details) {
          if (orientation == Axis.horizontal) return;
          onResize(details.delta.dy);
        },
        child: MouseRegion(
          cursor: orientation == Axis.horizontal
              ? nesTheme.resizeLeftRightCursor
              : nesTheme.resizeUpDownCursor,
          child: Container(
            width: orientation == Axis.horizontal ? resizerSize : null,
            height: orientation == Axis.vertical ? resizerSize : null,
            color: Colors.transparent,
            child: NesIcon(
              size: const Size.square(16),
              iconData: orientation == Axis.horizontal
                  ? NesIcons.threeVerticalDots
                  : NesIcons.threeHorizontalDots,
            ),
          ),
        ),
      ),
    ];

    return orientation == Axis.horizontal
        ? Row(children: children)
        : Column(children: children);
  }
}
