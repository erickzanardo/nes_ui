import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:nes_ui/src/extensions/color.dart';

/// {@template nes_palette}
/// A NES styled color palette widget.
/// {@endtemplate}
class NesPalette extends StatefulWidget {
  /// {@macro nes_palette}
  const NesPalette({
    required this.value,
    required this.onChanged,
    required this.colors,
    this.onColorAdded,
    this.onColorRemoved,
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

  /// The list of colors to display in the grid.
  final List<Color> colors;

  /// Called when a new color is added from the color selector dialog.
  final ValueChanged<Color>? onColorAdded;

  /// Called when a color is removed from the palette.
  final ValueChanged<Color>? onColorRemoved;

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
  State<NesPalette> createState() => _NesPaletteState();
}

class _NesPaletteState extends State<NesPalette> {
  late final TextEditingController _hexController;
  String? _hexError;
  late Color _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.value;
    _hexController = TextEditingController(text: _colorToHex(widget.value));
  }

  @override
  void didUpdateWidget(NesPalette oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _selectedColor = widget.value;
      _hexController.text = _colorToHex(widget.value);
    }
    // Check if selected color was removed from the list
    if (!widget.colors.any((c) => c.toARGB32() == _selectedColor.toARGB32())) {
      // Select first available color if current selection is no longer in list
      if (widget.colors.isNotEmpty) {
        _selectedColor = widget.colors.first;
        _hexController.text = _colorToHex(_selectedColor);
        widget.onChanged(_selectedColor);
      }
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

  void _removeColor(Color color) {
    // Find the next color to select before removing
    final currentIndex = widget.colors.indexWhere(
      (c) => c.toARGB32() == color.toARGB32(),
    );

    // Call the callback to notify parent
    widget.onColorRemoved?.call(color);

    // Select the next color (or previous if it was the last)
    if (widget.colors.length > 1) {
      final nextIndex = currentIndex < widget.colors.length - 1
          ? currentIndex
          : widget.colors.length - 2;
      final nextColor = widget.colors[nextIndex];
      setState(() {
        _selectedColor = nextColor;
        _hexController.text = _colorToHex(nextColor);
      });
      widget.onChanged(nextColor);
    }
  }

  void _showColorSelector(BuildContext context) {
    NesDialog.show<void>(
      context: context,
      builder: (context) => _NesColorSelector(
        initialColor: _selectedColor,
        onColorSelected: (color) {
          setState(() {
            _selectedColor = color;
          });
          widget.onChanged(color);
          widget.onColorAdded?.call(color);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final nesTheme = context.nesThemeExtension<NesTheme>();
    final pixelSize = nesTheme.pixelSize.toDouble();

    final gridHeight = widget.height ?? widget.size * 4;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: widget.size * 2,
              height: widget.size * 2,
              decoration: BoxDecoration(
                color: _selectedColor,
                border: Border.all(
                  color: Theme.of(context).textTheme.bodyMedium?.color ??
                      Colors.black,
                  width: pixelSize,
                ),
              ),
            ),
            SizedBox(width: pixelSize * 2),
            NesIconButton(
              icon: NesIcons.close,
              onPress: () => _removeColor(_selectedColor),
            ),
          ],
        ),
        SizedBox(height: pixelSize * 2),
        SizedBox(
          width: widget.size * widget.columnCount.toDouble() + pixelSize * 2,
          height: gridHeight,
          child: NesSingleChildScrollView(
            child: Wrap(
              spacing: pixelSize,
              runSpacing: pixelSize,
              children: widget.colors.map((color) {
                final isSelected =
                    _selectedColor.toARGB32() == color.toARGB32();
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedColor = color;
                      _hexError = null;
                    });
                    _hexController.text = _colorToHex(color);
                    widget.onChanged(color);
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
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: widget.size * 5,
                height: 48,
                child: TextField(
                  controller: _hexController,
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration: InputDecoration(
                    hintText: '#RRGGBB',
                    errorText: _hexError,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: pixelSize * 3,
                      vertical: pixelSize * 3,
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
              SizedBox(width: pixelSize * 2),
              NesIconButton(
                icon: NesIcons.eyedropper,
                onPress: () => _showColorSelector(context),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

class _NesColorSelector extends StatefulWidget {
  const _NesColorSelector({
    required this.initialColor,
    required this.onColorSelected,
  });

  final Color initialColor;
  final ValueChanged<Color> onColorSelected;

  @override
  State<_NesColorSelector> createState() => _NesColorSelectorState();
}

class _NesColorSelectorState extends State<_NesColorSelector> {
  late double _hue;
  late double _saturation;
  late double _value;

  @override
  void initState() {
    super.initState();
    final hsv = HSVColor.fromColor(widget.initialColor);
    _hue = hsv.hue;
    _saturation = hsv.saturation;
    _value = hsv.value;
  }

  Color get _selectedColor => HSVColor.fromAHSV(
        1,
        _hue,
        _saturation,
        _value,
      ).toColor();

  void _onSaturationValueChanged(double saturation, double value) {
    setState(() {
      _saturation = saturation.clamp(0.0, 1.0);
      _value = value.clamp(0.0, 1.0);
    });
  }

  void _onHueChanged(double hue) {
    setState(() {
      _hue = hue.clamp(0, 360).toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    final pixelSize =
        context.nesThemeExtension<NesTheme>().pixelSize.toDouble();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Saturation/Value gradient area
        GestureDetector(
          onPanUpdate: (details) {
            final box = context.findRenderObject() as RenderBox?;
            if (box != null) {
              final localPosition = box.globalToLocal(details.globalPosition);
              final saturation = localPosition.dx / 256;
              final value = 1 - (localPosition.dy / 256);
              _onSaturationValueChanged(saturation, value);
            }
          },
          onTapDown: (details) {
            final box = context.findRenderObject() as RenderBox?;
            if (box != null) {
              final localPosition = box.globalToLocal(details.globalPosition);
              final saturation = localPosition.dx / 256;
              final value = 1 - (localPosition.dy / 256);
              _onSaturationValueChanged(saturation, value);
            }
          },
          child: Container(
            width: 256,
            height: 256,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  HSVColor.fromAHSV(1, _hue, 1, 1).toColor(),
                ],
                stops: const [0.0, 1.0],
              ),
            ),
            child: CustomPaint(
              size: const Size(256, 256),
              painter: _ValueGradientPainter(),
            ),
          ),
        ),
        SizedBox(height: pixelSize * 2),
        // Hue slider
        GestureDetector(
          onPanUpdate: (details) {
            final box = context.findRenderObject() as RenderBox?;
            if (box != null) {
              final localPosition = box.globalToLocal(details.globalPosition);
              final hue = (localPosition.dx / 256) * 360;
              _onHueChanged(hue);
            }
          },
          onTapDown: (details) {
            final box = context.findRenderObject() as RenderBox?;
            if (box != null) {
              final localPosition = box.globalToLocal(details.globalPosition);
              final hue = (localPosition.dx / 256) * 360;
              _onHueChanged(hue);
            }
          },
          child: Container(
            width: 256,
            height: 24,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Colors.yellow,
                  Colors.green,
                  Colors.cyan,
                  Colors.blue,
                  Color(0xFFFF00FF),
                  Colors.red,
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: pixelSize * 4),
        // Color preview and confirm button
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: _selectedColor,
                border: Border.all(
                  color: Theme.of(context).textTheme.bodyMedium?.color ??
                      Colors.black,
                  width: pixelSize,
                ),
              ),
            ),
            SizedBox(width: pixelSize * 4),
            NesButton(
              type: NesButtonType.primary,
              onPressed: () {
                widget.onColorSelected(_selectedColor);
                Navigator.of(context).pop();
              },
              child: const Text('Select'),
            ),
          ],
        ),
      ],
    );
  }
}

class _ValueGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.transparent,
          Colors.black,
        ],
      ).createShader(const Rect.fromLTWH(0, 0, 256, 256));

    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
