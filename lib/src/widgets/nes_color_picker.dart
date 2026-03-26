import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:nes_ui/src/extensions/color.dart';

/// {@template nes_color_picker}
/// A NES styled color picker widget.
/// {@endtemplate}
class NesColorPicker extends StatefulWidget {
  /// {@macro nes_color_picker}
  const NesColorPicker({
    required this.value,
    required this.onChanged,
    this.presetColors,
    this.enableCustomInput = true,
    this.columnCount = 6,
    this.size = 32,
    this.height,
    super.key,
  });

  /// The currently selected color.
  final Color value;

  /// Called when the selected color changes.
  final ValueChanged<Color> onChanged;

  /// The list of preset colors to display in the grid.
  ///
  /// When omitted, defaults to a classic NES-style palette.
  final List<Color>? presetColors;

  /// Whether to show the hex input field for custom colors.
  ///
  /// Defaults to true.
  final bool enableCustomInput;

  /// The number of columns in the color grid.
  ///
  /// Defaults to 6.
  final int columnCount;

  /// The size of each color swatch.
  ///
  /// Defaults to 32.
  final double size;

  /// The height of the color grid. When null, uses available space.
  ///
  /// Defaults to null.
  final double? height;

  @override
  State<NesColorPicker> createState() => _NesColorPickerState();
}

class _NesColorPickerState extends State<NesColorPicker> {
  static const _defaultColors = [
    Color(0xff000000),
    Color(0xff111111),
    Color(0xff333333),
    Color(0xff555555),
    Color(0xff777777),
    Color(0xff999999),
    Color(0xffbbbbbb),
    Color(0xffdddddd),
    Color(0xffffffff),
    Color(0xff9badb7),
    Color(0xffbe185d),
    Color(0xffc026d3),
    Color(0xffa855f7),
    Color(0xff7c3aed),
    Color(0xff4f46e5),
    Color(0xff2563eb),
    Color(0xff1d4ed8),
    Color(0xff0284c7),
    Color(0xff06b6d4),
    Color(0xff0891b2),
    Color(0xff0d9488),
    Color(0xff059669),
    Color(0xff10b981),
    Color(0xff22c55e),
    Color(0xff4ade80),
    Color(0xff84cc16),
    Color(0xffa3e635),
    Color(0xffca8a04),
    Color(0xffeab308),
    Color(0xfffacc15),
    Color(0xfffbbf24),
    Color(0xfff59e0b),
    Color(0xffea580c),
    Color(0xfff97316),
    Color(0xfffb923c),
    Color(0xfff87171),
    Color(0xffef4444),
    Color(0xffdc2626),
    Color(0xffb91c1c),
    Color(0xff991b1b),
    Color(0xff7f1d1d),
    Color(0xff78350f),
    Color(0xff92400e),
    Color(0xffb45309),
    Color(0xffd97706),
    Color(0xff2694c8),
    Color(0xff1c7db2),
    Color(0xff186797),
    Color(0xff92cc41),
    Color(0xff76c11d),
    Color(0xff5ba617),
    Color(0xff209cee),
    Color(0xff128f7a),
    Color(0xff68d391),
    Color(0xffc6f6d5),
    Color(0xfff687b3),
    Color(0xfffed7e2),
    Color(0xff63b3ed),
    Color(0xffbee3f8),
    Color(0xfffaf089),
    Color(0xfffefcbf),
    Color(0xfffbb6ce),
    Color(0xfffbb6ce),
  ];

  late final TextEditingController _hexController;
  String? _hexError;

  @override
  void initState() {
    super.initState();
    _hexController = TextEditingController(text: _colorToHex(widget.value));
  }

  @override
  void didUpdateWidget(NesColorPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _hexController.text = _colorToHex(widget.value);
    }
  }

  @override
  void dispose() {
    _hexController.dispose();
    super.dispose();
  }

  String _colorToHex(Color color) {
    final r = (color.r * 255.0).round().clamp(0, 255);
    final g = (color.g * 255.0).round().clamp(0, 255);
    final b = (color.b * 255.0).round().clamp(0, 255);
    return '#${r.toRadixString(16).padLeft(2, '0')}'
            '${g.toRadixString(16).padLeft(2, '0')}'
            '${b.toRadixString(16).padLeft(2, '0')}'
        .toUpperCase();
  }

  void _onHexSubmitted(String value) {
    try {
      final color = ColorExtension.fromRGBHexString(value);
      setState(() {
        _hexError = null;
      });
      widget.onChanged(color);
    } catch (_) {
      setState(() {
        _hexError = 'Invalid hex color';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final nesTheme = context.nesThemeExtension<NesTheme>();
    final colors = widget.presetColors ?? _defaultColors;
    final pixelSize = nesTheme.pixelSize.toDouble();

    final gridHeight = widget.height ?? widget.size * 4;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: widget.size * 2,
          height: widget.size * 2,
          decoration: BoxDecoration(
            color: widget.value,
            border: Border.all(
              color:
                  Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black,
              width: pixelSize,
            ),
          ),
        ),
        SizedBox(height: pixelSize * 2),
        SizedBox(
          width: widget.size * widget.columnCount.toDouble() + pixelSize * 2,
          height: gridHeight,
          child: NesSingleChildScrollView(
            child: Wrap(
              spacing: pixelSize,
              runSpacing: pixelSize,
              children: colors.map((color) {
                final isSelected = widget.value.toARGB32() == color.toARGB32();
                return GestureDetector(
                  onTap: () {
                    widget.onChanged(color);
                    _hexController.text = _colorToHex(color);
                    setState(() {
                      _hexError = null;
                    });
                  },
                  child: MouseRegion(
                    cursor: nesTheme.clickCursor,
                    child: Container(
                      width: widget.size,
                      height: widget.size,
                      decoration: BoxDecoration(
                        color: color,
                        border: Border.all(
                          color: isSelected
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).textTheme.bodyMedium?.color ??
                                  Colors.black,
                          width: isSelected ? pixelSize * 1.5 : pixelSize,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        if (widget.enableCustomInput) ...[
          SizedBox(height: pixelSize * 2),
          SizedBox(
            width: widget.size * 3,
            height: 36,
            child: TextField(
              controller: _hexController,
              style: Theme.of(context).textTheme.bodySmall,
              decoration: InputDecoration(
                hintText: '#RRGGBB',
                errorText: _hexError,
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: pixelSize * 2,
                  vertical: pixelSize * 2,
                ),
              ),
              onSubmitted: _onHexSubmitted,
              onChanged: (value) {
                if (value.length == 7 || value.length == 6) {
                  _onHexSubmitted(value);
                }
              },
            ),
          ),
        ],
      ],
    );
  }
}
