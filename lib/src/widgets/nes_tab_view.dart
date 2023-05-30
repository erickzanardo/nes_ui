import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_tab_time}
/// Describes a tab used in a [NesTabView].
/// {@endtemplate}
class NesTabItem {
  /// {@macro nes_tab_item}
  const NesTabItem({
    required this.child,
    required this.label,
  });

  /// The widget to display tab contents.
  final Widget child;

  /// The label of the tab.
  final String label;
}

/// {@template nes_tab_view}
/// A tab view that uses the NesUi style.
/// {@endtemplate}
class NesTabView extends StatefulWidget {
  /// {@macro nes_tab_view}
  const NesTabView({
    super.key,
    required this.tabs,
    this.onTabChanged,
    this.onTabClosed,
  });

  /// The tabs to display.
  final List<NesTabItem> tabs;

  /// Called when the tab is changed.
  final void Function(int index)? onTabChanged;

  /// Called when the tab is closed.
  final void Function(int index)? onTabClosed;

  @override
  State<NesTabView> createState() => _NesTabViewState();
}

class _NesTabViewState extends State<NesTabView> {
  int _selectedIndex = 0;

  @override
  void didUpdateWidget(NesTabView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_selectedIndex >= widget.tabs.length) {
      _selectedIndex = widget.tabs.length - 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final nesTheme = context.nesThemeExtension<NesTheme>();
    final textStyle =
        Theme.of(context).textTheme.labelMedium ?? const TextStyle();

    final tabs = widget.tabs.map(
      (tab) {
        final index = widget.tabs.indexOf(tab);
        return Expanded(
          child: NesTab(
            tab: tab,
            selected: _selectedIndex == index,
            onPressed: () {
              setState(() {
                _selectedIndex = index;
              });
              widget.onTabChanged?.call(index);
            },
            onClosed: () {
              widget.onTabClosed?.call(index);
            },
          ),
        );
      },
    ).toList();

    return Column(
      children: [
        SizedBox(
          height: 64,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: tabs,
          ),
        ),
        Expanded(
          child: IndexedStack(
            index: _selectedIndex,
            children: [
              for (var i = 0; i < widget.tabs.length; i++)
                CustomPaint(
                  painter: _NesTabViewPainter(
                    color: textStyle.color ?? Colors.black,
                    pixelSize: nesTheme.pixelSize.toDouble(),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(nesTheme.pixelSize.toDouble()),
                    child: widget.tabs[i].child,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _NesTabViewPainter extends CustomPainter {
  _NesTabViewPainter({
    required this.color,
    required this.pixelSize,
  });

  final double pixelSize;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    // Left border
    canvas
      ..drawRect(
        Rect.fromLTWH(0, 0, pixelSize, size.height - pixelSize),
        paint,
      )
      // Right border
      ..drawRect(
        Rect.fromLTWH(
          size.width - pixelSize,
          0,
          pixelSize,
          size.height - pixelSize,
        ),
        paint,
      )
      // Bottom border
      ..drawRect(
        Rect.fromLTWH(
          pixelSize,
          size.height - pixelSize,
          size.width - pixelSize * 2,
          pixelSize,
        ),
        paint,
      );
  }

  @override
  bool shouldRepaint(_NesTabViewPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.pixelSize != pixelSize;
  }
}
