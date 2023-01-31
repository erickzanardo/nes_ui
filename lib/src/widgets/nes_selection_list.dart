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
    this.initialIndex = 0,
    this.axis = Axis.vertical,
  }) : assert(
          initialIndex < children.length,
          'initialIndex must be less than children.length',
        );

  /// A [WidgetBuilder] used to create the marker widget.
  ///
  /// If ommited [NesIcons.instances.handPointingRight] is used.
  final Widget Function(BuildContext, Size)? markerBuilder;

  /// List of items tha can be selected.
  final List<Widget> children;

  /// The first selected child.
  final int initialIndex;

  /// Listener callback to changes.
  final void Function(int) onSelect;

  /// Defines if this is a vertical or horizontal list, Defaulst to vertical.
  final Axis axis;

  @override
  State<NesSelectionList> createState() => _NesSelectionListState();
}

class _NesSelectionListState extends State<NesSelectionList> {
  late int _index = widget.initialIndex;

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
            setState(() {
              _index = i;
            });
            widget.onSelect(i);
          },
          itemMinHeight: nesSelectionListTheme.itemMinHeight,
          selected: i == _index,
          marker: marker,
          markerSize: markerSize,
          child: widget.children[i],
        )
    ];

    return widget.axis == Axis.vertical
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          )
        : Row(
            children: children,
          );
  }
}

class _SelectionItem extends StatelessWidget {
  const _SelectionItem({
    required this.onTap,
    required this.selected,
    required this.marker,
    required this.child,
    required this.markerSize,
    required this.itemMinHeight,
  });

  final Widget marker;
  final VoidCallback onTap;
  final bool selected;
  final Size markerSize;
  final Widget child;
  final double itemMinHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: itemMinHeight,
        ),
        child: Row(
          children: [
            SizedBox(
              width: markerSize.width,
              child: selected ? marker : null,
            ),
            const SizedBox(width: 6),
            child,
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
