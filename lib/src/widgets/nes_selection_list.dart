import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_selection_list}
///
/// {@endtemplate}
class NesSelectionList extends StatefulWidget {
  /// {@macro nes_selection_list}
  const NesSelectionList({
    super.key,
    required this.children,
    required this.onSelect,
    this.markerBuilder,
    this.initialIndex,
    this.axis = Axis.vertical,
    this.canAutoFocus = true,
    this.focusNode,
    this.onCancelSelection,
    this.tickerDuration,
    this.canCancelSelection = true,
    this.disabledItems = const [],
  }) : assert(
          initialIndex == null || initialIndex < children.length,
          'initialIndex must be less than children.length',
        );

  /// A [WidgetBuilder] used to create the marker widget.
  ///
  /// If ommited [NesIconCollection.handPointingRight] is used.
  final Widget Function(BuildContext, Size)? markerBuilder;

  /// List of items tha can be selected.
  final List<Widget> children;

  /// The first selected child.
  final int? initialIndex;

  /// Listener callback to changes.
  final void Function(int) onSelect;

  /// Defines if this is a vertical or horizontal list, Defaulst to vertical.
  final Axis axis;

  /// An optional [FocusNode] that can be used to control the focus of the list.
  final FocusNode? focusNode;

  /// If true, means that the component can receive focus when the user taps in
  /// an option, if false, the the focus will only be set by the [focusNode].
  final bool canAutoFocus;

  /// Called when the selection has been cancelled.
  ///
  /// This is called only when selection is explicit cancelled by the user
  /// when a [NesInputEvent.cancel] is triggered by a keyboard or gamepad.
  final VoidCallback? onCancelSelection;

  /// When false, the selection will not be canceled when a
  /// [NesInputEvent.cancel] is triggered.
  ///
  /// This can be useful in lists that are the "root" of a page or section.
  final bool canCancelSelection;

  /// Duration of ticker, it changes the blink speed.
  final Duration? tickerDuration;

  /// List of indexes that are disabled.
  final List<int> disabledItems;

  @override
  State<NesSelectionList> createState() => _NesSelectionListState();
}

class _NesSelectionListState extends State<NesSelectionList> {
  late int? _cursorIndex = widget.initialIndex;

  late final _focusNode = widget.focusNode ?? FocusNode();
  late bool _hasFocus = _focusNode.hasFocus;

  late final _markerKey = GlobalKey();
  late NesInputController _nesInputController;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(_onFocusChange);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _onFocusChange();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _nesInputController = NesController.of(context);

    final nextEvent =
        widget.axis == Axis.vertical ? NesInputEvent.down : NesInputEvent.right;
    final previousEvent =
        widget.axis == Axis.vertical ? NesInputEvent.up : NesInputEvent.left;

    _nesInputController
      ..addListener(_focusNode, nextEvent, _next)
      ..addListener(_focusNode, previousEvent, _previous)
      ..addListener(_focusNode, NesInputEvent.confirm, _confirm)
      ..addListener(_focusNode, NesInputEvent.cancel, _cancel);
  }

  void _cancel() {
    if (widget.canCancelSelection) {
      _focusNode.unfocus();
      widget.onCancelSelection?.call();
    }
  }

  void _confirm() {
    if (_cursorIndex != null) {
      widget.onSelect(_cursorIndex!);
    }
  }

  void _next() {
    final cursor = _cursorIndex ?? 0;
    final value = cursor + 1 < widget.children.length ? cursor + 1 : 0;
    if (widget.disabledItems.contains(value)) {
      _cursorIndex = value;
      _next();
      return;
    }
    setState(() {
      _cursorIndex = value;
    });
  }

  void _previous() {
    final cursor = _cursorIndex ?? 0;
    final value = cursor - 1 >= 0 ? cursor - 1 : widget.children.length - 1;

    if (widget.disabledItems.contains(value)) {
      _cursorIndex = value;
      _previous();
      return;
    }
    setState(() {
      _cursorIndex = value;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);

    _nesInputController.disposeListeners(_focusNode);

    if (widget.focusNode == null) {
      _focusNode.dispose();
    }

    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      if (!_hasFocus && _focusNode.hasFocus) {
        _cursorIndex ??= 0;
      }
      _hasFocus = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final markerBuilder = widget.markerBuilder ??
        (_, size) => NesIcon(
              iconData: NesIcons.handPointingRight,
              size: size,
            );

    final nesSelectionListTheme =
        context.nesThemeExtension<NesSelectionListTheme>();

    final markerSize = nesSelectionListTheme.markerSize;
    final marker = markerBuilder(context, markerSize);

    final children = [
      for (var i = 0; i < widget.children.length; i++)
        _SelectionItem(
          markerKey: _markerKey,
          tickerDuration: widget.tickerDuration,
          onTap: () {
            if (_focusNode.hasFocus) {
              setState(() {
                _cursorIndex = i;
              });
              widget.onSelect(i);
            } else if (widget.canAutoFocus) {
              _focusNode.requestFocus();
              setState(() {
                _cursorIndex = i;
              });
              widget.onSelect(i);
            }
          },
          onHover: () {
            if (_focusNode.hasFocus) {
              setState(() {
                _cursorIndex = i;
              });
            }
          },
          itemMinHeight: nesSelectionListTheme.itemMinHeight,
          cursor: i == _cursorIndex,
          marker: marker,
          markerSize: markerSize,
          hasFocus: _hasFocus,
          disabled: widget.disabledItems.contains(i),
          child: widget.children[i],
        ),
    ];

    return NesControllerFocus(
      focusNode: _focusNode,
      child: widget.axis == Axis.vertical
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            )
          : Row(
              children: children,
            ),
    );
  }
}

class _SelectionItem extends StatelessWidget {
  const _SelectionItem({
    required this.markerKey,
    required this.onTap,
    required this.onHover,
    required this.cursor,
    required this.marker,
    required this.child,
    required this.markerSize,
    required this.itemMinHeight,
    required this.hasFocus,
    this.tickerDuration,
    this.disabled = false,
  });

  final Key markerKey;
  final Widget marker;
  final VoidCallback onTap;
  final VoidCallback onHover;
  final bool cursor;
  final Size markerSize;
  final Widget child;
  final double itemMinHeight;
  final bool hasFocus;
  final Duration? tickerDuration;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    final itemMarker = cursor && hasFocus && !disabled ? marker : null;

    return MouseRegion(
      onEnter: (_) {
        if (!disabled) {
          onHover();
        }
      },
      child: GestureDetector(
        onTap: disabled ? null : onTap,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: itemMinHeight,
          ),
          child: Row(
            children: [
              SizedBox(
                width: markerSize.width,
                child: itemMarker,
              ),
              const SizedBox(width: 6),
              if (disabled)
                Opacity(
                  opacity: 0.2,
                  child: child,
                )
              else
                child,
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }
}
