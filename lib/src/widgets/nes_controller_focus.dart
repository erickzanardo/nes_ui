import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_controller_focus}
/// A Nes UI wrapper around [Focus] widgets that allows
/// input from the library to be captured and listened.
/// {@endtemplate}
class NesControllerFocus extends StatefulWidget {
  ///
  const NesControllerFocus({
    super.key,
    required this.child,
    this.focusNode,
  });

  /// Child of this controller.
  final Widget child;

  /// An optional node to control focus of this controller.
  /// If ommited the focus node will managed internally.
  final FocusNode? focusNode;

  @override
  State<NesControllerFocus> createState() => _NesControllerFocusState();
}

class _NesControllerFocusState extends State<NesControllerFocus> {
  late final _focusNode = widget.focusNode ?? FocusNode();
  late final NesInputController _nesInputController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _nesInputController = NesController.of(context);
  }

  @override
  void dispose() {
    _nesInputController.disposeListeners(_focusNode);

    if (widget.focusNode == null) {
      _focusNode.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onKey: _nesInputController.processKeyBoardInput,
      focusNode: _focusNode,
      child: widget.child,
    );
  }
}
