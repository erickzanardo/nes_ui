// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

const _defaultColors = [
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

@widgetbook.UseCase(name: 'default', type: NesPalette)
Widget defaultPalette(BuildContext context) {
  return const _PaletteUseCase(
    initialColor: Color(0xff209cee),
    colors: _defaultColors,
  );
}

@widgetbook.UseCase(name: 'with custom colors', type: NesPalette)
Widget customColors(BuildContext context) {
  return const _PaletteUseCase(
    initialColor: Colors.red,
    colors: [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.orange,
      Colors.purple,
      Colors.pink,
      Colors.teal,
    ],
    columnCount: 4,
  );
}

@widgetbook.UseCase(name: 'without custom input', type: NesPalette)
Widget withoutCustomInput(BuildContext context) {
  return const _PaletteUseCase(
    initialColor: Color(0xff92cc41),
    colors: _defaultColors,
    enableCustomInput: false,
  );
}

@widgetbook.UseCase(name: 'with color selector dialog', type: NesPalette)
Widget withColorSelectorDialog(BuildContext context) {
  return const _PaletteUseCase(
    initialColor: Color(0xff209cee),
    colors: _defaultColors,
    showColorSelector: true,
  );
}

class _PaletteUseCase extends StatefulWidget {
  const _PaletteUseCase({
    required this.initialColor,
    required this.colors,
    this.columnCount = 6,
    this.enableCustomInput = true,
    this.showColorSelector = false,
  });

  final Color initialColor;
  final List<Color> colors;
  final int columnCount;
  final bool enableCustomInput;
  final bool showColorSelector;

  @override
  State<_PaletteUseCase> createState() => _PaletteUseCaseState();
}

class _PaletteUseCaseState extends State<_PaletteUseCase> {
  late List<Color> _colors;
  late Color _selectedColor;

  @override
  void initState() {
    super.initState();
    _colors = List.from(widget.colors);
    _selectedColor = widget.initialColor;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NesPalette(
        value: _selectedColor,
        colors: _colors,
        onChanged: (color) {
          setState(() {
            _selectedColor = color;
          });
        },
        onColorAdded: widget.showColorSelector
            ? (color) {
                setState(() {
                  _colors.add(color);
                  _selectedColor = color;
                });
              }
            : null,
        onColorRemoved: (color) {
          setState(() {
            _colors.removeWhere((c) => c.toARGB32() == color.toARGB32());
          });
        },
        columnCount: widget.columnCount,
        enableCustomInput: widget.enableCustomInput,
      ),
    );
  }
}
