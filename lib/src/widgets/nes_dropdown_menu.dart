import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_dropdown_menu_entry}
/// A single entry in a NES dropdown menu.
/// {@endtemplate}
class NesDropdownMenuEntry<T> {
  /// {@macro nes_dropdown_menu_entry}
  const NesDropdownMenuEntry({
    required this.value,
    required this.label,
    this.icon,
  });

  /// The value of the entry.
  final T value;

  /// The label to display.
  final String label;

  /// The icon to display.
  final NesIconData? icon;
}

/// {@template nes_dropdown_menu}
/// A NES styled dropdown menu.
/// {@endtemplate}
// ignore: must_be_immutable
class NesDropdownMenu<T> extends StatefulWidget {
  /// {@macro nes_dropdown_menu}
  const NesDropdownMenu({
    required this.entries,
    this.initialValue,
    this.onChanged,
    this.width,
    super.key,
  });

  /// The entries to display in the dropdown menu.
  final List<NesDropdownMenuEntry<T>> entries;

  /// The initial value of the dropdown menu.
  final T? initialValue;

  /// Called when the value of the dropdown menu changes.
  final void Function(T value)? onChanged;

  /// The width of the dropdown menu.
  final double? width;

  @override
  State<NesDropdownMenu<T>> createState() => _NesDropdownMenuState<T>();
}

class _NesDropdownMenuState<T> extends State<NesDropdownMenu<T>> {
  late final _controller = OverlayPortalController();
  late T? _selectedValue = widget.initialValue;

  final _link = LayerLink();

  void _toggleMenu() {
    setState(() {
      if (_controller.isShowing) {
        _controller.hide();
      } else {
        _controller.show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final result = widget.entries.where(
      (entry) => entry.value == _selectedValue,
    );

    final selectedEntry = result.isNotEmpty ? result.first : null;

    const padding = EdgeInsets.symmetric(vertical: 8, horizontal: 8);

    final width = widget.width ?? 200;

    return CompositedTransformTarget(
      link: _link,
      child: OverlayPortal(
        controller: _controller,
        overlayChildBuilder: (context) {
          return CompositedTransformFollower(
            link: _link,
            targetAnchor: Alignment.bottomLeft,
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: NesDropshadow(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: NesContainer(
                    padding: padding,
                    width: width,
                    height: 200,
                    child: NesSingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: widget.entries.map((entry) {
                          final isSelected = entry.value == _selectedValue;
                          return SizedBox(
                            height: 18,
                            child: Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Opacity(
                                  opacity: isSelected ? 0.5 : 1,
                                  child: NesPressable(
                                    onPress: !isSelected
                                        ? () {
                                            widget.onChanged?.call(entry.value);
                                            setState(() {
                                              _selectedValue = entry.value;
                                              _toggleMenu();
                                            });
                                          }
                                        : null,
                                    child: Row(
                                      children: [
                                        if (entry.icon != null)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              right: 8,
                                            ),
                                            child: NesIcon(
                                              iconData: entry.icon!,
                                              size: const Size.square(18),
                                            ),
                                          ),
                                        Text(entry.label),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        child: NesContainer(
          width: width,
          height: 48,
          padding: padding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 8),
              if (selectedEntry?.icon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: NesIcon(
                    iconData: selectedEntry!.icon!,
                    size: const Size.square(18),
                  ),
                ),
              Expanded(
                child: selectedEntry != null
                    ? Text(selectedEntry.label)
                    : const SizedBox(),
              ),
              const SizedBox(width: 8),
              NesIconButton(
                size: const Size.square(24),
                icon: _controller.isShowing
                    ? NesIcons.topArrowIndicator
                    : NesIcons.bottomArrowIndicator,
                onPress: _toggleMenu,
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}
