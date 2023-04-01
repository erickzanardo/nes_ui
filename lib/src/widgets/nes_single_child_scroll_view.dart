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
  });

  /// The child widget.
  final Widget child;

  /// The direction of the scroll view.
  final Axis direction;

  @override
  State<NesSingleChildScrollView> createState() =>
      _NesSingleChildScrollViewState();
}

class _NesSingleChildScrollViewState extends State<NesSingleChildScrollView> {
  late final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final children = [
      SingleChildScrollView(
        scrollDirection: widget.direction,
        controller: _scrollController,
        child: SizeChangedLayoutNotifier(child: widget.child),
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
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: widget.direction == Axis.vertical
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              ),
      ),
    );
  }
}
