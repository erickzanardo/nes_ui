import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_tab}
/// A tab that uses the NesUi style.
/// {@endtemplate}
class NesTab extends StatelessWidget {
  /// {@macro nes_tab}
  const NesTab({
    super.key,
    required this.tab,
    this.selected = false,
    this.onPressed,
    this.onClosed,
  });

  /// The tab to display.
  final NesTabItem tab;

  /// Whether the tab is selected.
  final bool selected;

  /// Called when the tab is pressed.
  final void Function()? onPressed;

  /// Called when tab is closed.
  final void Function()? onClosed;

  @override
  Widget build(BuildContext context) {
    final nesTheme = context.nesThemeExtension<NesTheme>();
    final nesContainerTheme = context.nesThemeExtension<NesContainerTheme>();

    final child = CustomPaint(
      painter: _NesTabCustomPainter(
        color: nesContainerTheme.borderColor,
        pixelSize: nesTheme.pixelSize.toDouble(),
        selected: selected,
      ),
      child: SizedBox(
        height: selected ? 64 : 48,
        child: Padding(
          padding: EdgeInsets.all(nesTheme.pixelSize * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(tab.label),
              ),
              if (onClosed != null)
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: NesIconButton(
                    size: const Size.square(24),
                    icon: NesIcons.close,
                    onPress: onClosed,
                  ),
                ),
            ],
          ),
        ),
      ),
    );

    if (selected) {
      return child;
    } else {
      return NesPressable(
        onPress: onPressed,
        child: child,
      );
    }
  }
}

class _NesTabCustomPainter extends CustomPainter {
  _NesTabCustomPainter({
    required this.color,
    required this.pixelSize,
    required this.selected,
  });

  final Color color;
  final double pixelSize;
  final bool selected;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    // Top border.
    canvas
      ..drawRect(
        Rect.fromLTWH(pixelSize, 0, size.width - pixelSize * 2, pixelSize),
        paint,
      )
      // Left border.
      ..drawRect(
        Rect.fromLTWH(0, pixelSize, pixelSize, size.height - pixelSize),
        paint,
      )
      // Right border.
      ..drawRect(
        Rect.fromLTWH(
          size.width - pixelSize,
          pixelSize,
          pixelSize,
          size.height - pixelSize,
        ),
        paint,
      );

    if (!selected) {
      // Bottom border.
      canvas.drawRect(
        Rect.fromLTWH(
          0,
          size.height - pixelSize,
          size.width,
          pixelSize,
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_NesTabCustomPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.pixelSize != pixelSize ||
        oldDelegate.selected != selected;
  }
}
