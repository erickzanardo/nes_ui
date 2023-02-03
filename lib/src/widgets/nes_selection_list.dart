import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:phased/phased.dart';

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
  }) : assert(
          initialIndex == null || initialIndex < children.length,
          'initialIndex must be less than children.length',
        );

  /// A [WidgetBuilder] used to create the marker widget.
  ///
  /// If ommited [NesIcons.instances.handPointingRight] is used.
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

  @override
  State<NesSelectionList> createState() => _NesSelectionListState();
}

class _NesSelectionListState extends State<NesSelectionList> {
  late int? _cursorIndex = widget.initialIndex;
  late int? _selected = widget.initialIndex;

  late final _focusNode = widget.focusNode ?? FocusNode();
  late bool _hasFocus = _focusNode.hasFocus;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);

    if (widget.focusNode == null) {
      _focusNode.dispose();
    }

    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _hasFocus = _focusNode.hasFocus;
      _cursorIndex ??= 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final markerBuilder = widget.markerBuilder ??
        (_, size) => NesIcon(
              iconData: NesIcons.instance.handPointingRight,
              size: size,
            );

    final nesSelectionListTheme =
        context.nesThemeExtension<NesSelectionListTheme>();

    final markerSize = nesSelectionListTheme.markerSize;
    final marker = markerBuilder(context, markerSize);

    final children = [
      for (var i = 0; i < widget.children.length; i++)
        _SelectionItem(
          onTap: () {
            if (_focusNode.hasFocus) {
              setState(() {
                _cursorIndex = i;
                _selected = i;
              });
              widget.onSelect(i);
            } else if (widget.canAutoFocus) {
              _focusNode.requestFocus();
              setState(() {
                _selected = i;
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
          selected: i == _selected,
          marker: marker,
          markerSize: markerSize,
          hasFocus: _hasFocus,
          child: widget.children[i],
        )
    ];

    return Focus(
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

class _Blinker extends Phased<bool> {
  _Blinker({
    required this.child,
  }) : super(
          state: PhasedState<bool>(
            values: [true, false],
            ticker: const Duration(seconds: 1),
          ),
        );

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (state.value) {
      return child;
    } else {
      return const SizedBox();
    }
  }
}

class _SelectionItem extends StatelessWidget {
  const _SelectionItem({
    required this.onTap,
    required this.onHover,
    required this.selected,
    required this.cursor,
    required this.marker,
    required this.child,
    required this.markerSize,
    required this.itemMinHeight,
    required this.hasFocus,
  });

  final Widget marker;
  final VoidCallback onTap;
  final VoidCallback onHover;
  final bool cursor;
  final bool selected;
  final Size markerSize;
  final Widget child;
  final double itemMinHeight;
  final bool hasFocus;

  @override
  Widget build(BuildContext context) {
    final itemMarker = cursor && hasFocus
        ? _Blinker(child: marker)
        : (selected ? marker : null);

    return MouseRegion(
      onEnter: (_) {
        onHover();
      },
      child: GestureDetector(
        onTap: onTap,
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
              child,
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }
}
