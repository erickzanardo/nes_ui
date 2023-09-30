import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_scrollbar}
/// A scrollbar used in scrollable widgets inside Nes UI.
/// {@endtemplate}
class NesScrollbar extends StatefulWidget {
  /// {@macro nes_scrollbar}
  const NesScrollbar({
    super.key,
    required this.scrollController,
    required this.direction,
  });

  /// The scroll controller attached to this scrollbar.
  final ScrollController scrollController;

  /// The direction of the scrollbar.
  final Axis direction;

  /// The size of the scrollbar.
  static const scrollbarSize = 28.0;

  @override
  State<NesScrollbar> createState() => _NesScrollbarState();
}

class _NesScrollbarState extends State<NesScrollbar> {
  Timer? _timer;
  bool _isScrollingForward = false;

  static const _initialScrollSpeed = 10.0;
  static const _maxScrollSpeed = 100.0;
  static const _scrollIncrease = 1.5;

  double _scrollSpeed = _initialScrollSpeed;

  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    setState(() {});
  }

  double _calculateHandlerSize(double widgetSize) {
    return max(
      (widgetSize / widget.scrollController.position.maxScrollExtent) * 10,
      widgetSize / 10,
    );
  }

  void _scroll() {
    if (_isScrollingForward &&
        widget.scrollController.offset <
            widget.scrollController.position.maxScrollExtent) {
      widget.scrollController.jumpTo(
        widget.scrollController.offset + _scrollSpeed,
      );
    } else if (!_isScrollingForward && widget.scrollController.offset > 0) {
      widget.scrollController.jumpTo(
        widget.scrollController.offset - _scrollSpeed,
      );
    }
  }

  void _startScrolling(bool isScrollingForward) {
    _isScrollingForward = isScrollingForward;
    _scroll();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      final value = _scrollSpeed * _scrollIncrease;
      _scrollSpeed = min(value, _maxScrollSpeed);
      _scroll();
    });
  }

  void _stopScrolling() {
    _scrollSpeed = _initialScrollSpeed;
    _timer?.cancel();
  }

  void _panScroll(
    double offset,
    BoxConstraints constraints,
    double handlerSize,
  ) {
    final constraintSize = widget.direction == Axis.vertical
        ? constraints.maxHeight
        : constraints.maxWidth;

    final maxOffset = constraintSize - handlerSize - 48;
    final newOffset = widget.scrollController.offset +
        (offset / maxOffset) * widget.scrollController.position.maxScrollExtent;
    widget.scrollController.jumpTo(newOffset);
  }

  bool _isScrollable() {
    return widget.scrollController.position.maxScrollExtent > 0;
  }

  @override
  Widget build(BuildContext context) {
    final textStyle =
        Theme.of(context).textTheme.labelMedium ?? const TextStyle();
    final containerColor = textStyle.color ?? Colors.black;

    return LayoutBuilder(
      builder: (context, constraints) {
        final constraintSize = widget.direction == Axis.vertical
            ? constraints.maxHeight
            : constraints.maxWidth;

        final handlerSize = _calculateHandlerSize(constraintSize);

        final handlerPosition = 20 +
            ((widget.scrollController.offset /
                    widget.scrollController.position.maxScrollExtent) *
                (constraintSize - handlerSize - 48));

        return Container(
          width: widget.direction == Axis.vertical
              ? NesScrollbar.scrollbarSize
              : constraintSize,
          height: widget.direction == Axis.horizontal
              ? NesScrollbar.scrollbarSize
              : constraintSize,
          decoration: BoxDecoration(
            border: Border.all(
              width: 4,
              color: containerColor,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 2,
                left: 2,
                child: NesIconButton(
                  size: const Size(16, 16),
                  icon: widget.direction == Axis.vertical
                      ? NesIcons.topArrowIndicator
                      : NesIcons.leftArrowIndicator,
                  onPressStart: () {
                    _startScrolling(false);
                  },
                  onPressEnd: _stopScrolling,
                ),
              ),
              if (_isScrollable())
                Positioned(
                  top: widget.direction == Axis.vertical ? handlerPosition : 2,
                  left:
                      widget.direction == Axis.horizontal ? handlerPosition : 2,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      final offset = widget.direction == Axis.vertical
                          ? details.delta.dy
                          : details.delta.dx;
                      _panScroll(offset, constraints, handlerSize);
                    },
                    child: ColoredBox(
                      color: containerColor,
                      child: SizedBox(
                        width: widget.direction == Axis.vertical
                            ? 16
                            : handlerSize,
                        height: widget.direction == Axis.horizontal
                            ? 16
                            : handlerSize,
                      ),
                    ),
                  ),
                ),
              Positioned(
                bottom: 2,
                left: widget.direction == Axis.vertical ? 2 : null,
                right: widget.direction == Axis.horizontal ? 2 : null,
                child: NesIconButton(
                  size: const Size(16, 16),
                  icon: widget.direction == Axis.vertical
                      ? NesIcons.bottomArrowIndicator
                      : NesIcons.rightArrowIndicator,
                  onPressStart: () {
                    _startScrolling(true);
                  },
                  onPressEnd: _stopScrolling,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
