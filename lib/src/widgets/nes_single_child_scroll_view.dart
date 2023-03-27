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
  });

  /// The child widget.
  final Widget child;

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
    // TODO(erickzanardo): we can receive a scroll controller.
    return Row(
      children: [
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: widget.child,
          ),
        ),
        const SizedBox(width: 8),
        NesScrollbar(scrollController: _scrollController),
      ],
    );
  }
}
