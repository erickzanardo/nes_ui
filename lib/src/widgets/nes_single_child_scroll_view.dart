import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_single_child_scroll_view}
/// A scroll view that can host a single [child] widget inside itself.
/// {@endtemplate}
class NesSingleChildScrollView extends StatefulWidget {
  /// {@macro nes_single_child_scroll_view}
  const NesSingleChildScrollView({
    super.key,
    required this.child,
    this.direction = Axis.vertical,
    this.scrollController,
  });

  /// The child widget.
  final Widget child;

  /// The direction of the scroll view.
  final Axis direction;

  /// The scroll controller attached to this scroll view.
  ///
  /// When omitted, a new [ScrollController] will be created.
  /// When one is provided, it will be used instead the it will
  /// not be automatically disposed when this widget is disposed.
  final ScrollController? scrollController;

  @override
  State<NesSingleChildScrollView> createState() =>
      _NesSingleChildScrollViewState();
}

class _NesSingleChildScrollViewState extends State<NesSingleChildScrollView> {
  late final ScrollController _scrollController =
      widget.scrollController ?? ScrollController();

  @override
  void dispose() {
    if (widget.scrollController == null) {
      _scrollController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const gap = NesScrollbar.scrollbarSize + 8;
        final children = [
          SizedBox(
            width: widget.direction == Axis.vertical
                ? constraints.maxWidth - gap
                : constraints.maxWidth,
            height: widget.direction == Axis.horizontal
                ? constraints.maxHeight - gap
                : constraints.maxHeight,
            child: SingleChildScrollView(
              scrollDirection: widget.direction,
              controller: _scrollController,
              child: SizeChangedLayoutNotifier(
                child: UnconstrainedBox(
                  alignment: Alignment.topLeft,
                  clipBehavior: Clip.hardEdge,
                  child: widget.child,
                ),
              ),
            ),
          ),
          if (widget.direction == Axis.vertical)
            const SizedBox(width: 8)
          else if (widget.direction == Axis.horizontal)
            const SizedBox(height: 8),
          NesScrollbar(
            scrollController: _scrollController,
            direction: widget.direction,
          ),
        ];

        return NotificationListener<SizeChangedLayoutNotification>(
          onNotification: (notification) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {});
            });
            return true;
          },
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: widget.direction == Axis.vertical
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children,
                  ),
          ),
        );
      },
    );
  }
}
