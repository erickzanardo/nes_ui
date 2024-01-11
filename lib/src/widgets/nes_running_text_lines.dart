import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_running_text_lines}
/// A widget that displays running text, one line after the other.
/// {@endtemplate}
class NesRunningTextLines extends StatefulWidget {
  /// {@macro nes_running_text_lines}
  const NesRunningTextLines({
    required this.texts,
    this.speed = .08,
    this.textStyle,
    this.onEnd,
    this.running = true,
    this.linesAlignment = MainAxisAlignment.start,
    super.key,
  });

  /// The texts to display.
  final List<String> texts;

  /// The speed of the text, in seconds.
  final double speed;

  /// The style of the text. When omitted, it uses the theme's bodyMedium style.
  final TextStyle? textStyle;

  /// Called when the text has reached the end.
  final VoidCallback? onEnd;

  /// Whether the text is running.
  final bool running;

  /// The alignment of the lines.
  final MainAxisAlignment linesAlignment;

  @override
  State<NesRunningTextLines> createState() => _NesRunningTextLinesState();
}

class _NesRunningTextLinesState extends State<NesRunningTextLines> {
  late Map<int, String> _lines;

  @override
  void initState() {
    super.initState();

    _initLines();

    if (widget.running) {
      _start();
    }
  }

  bool _isArrayEqual(List<String> a, List<String> b) {
    if (a.length != b.length) {
      return false;
    }

    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) {
        return false;
      }
    }

    return true;
  }

  @override
  void didUpdateWidget(NesRunningTextLines oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.running != oldWidget.running) {
      if (widget.running) {
        _start();
      }
    }

    if (!_isArrayEqual(widget.texts, oldWidget.texts)) {
      _initLines();
      if (widget.running) {
        _start();
      }
    }
  }

  void _start() {
    setState(() {
      _lines[0] = widget.texts[0];
    });
  }

  void _initLines() {
    _lines = {
      for (var i = 0; i < widget.texts.length; i++) i: '',
    };
  }

  void _next(int index) {
    if (index < widget.texts.length - 1) {
      setState(() {
        _lines[index + 1] = widget.texts[index + 1];
      });
    } else {
      widget.onEnd?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final texts = _lines.values;
    return Column(
      mainAxisAlignment: widget.linesAlignment,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < texts.length; i++)
          if (_lines[i]?.isNotEmpty ?? false)
            NesRunningText(
              text: _lines[i] ?? '',
              speed: widget.speed,
              textStyle: widget.textStyle,
              onEnd: () {
                _next(i);
              },
              running: widget.running,
            )
          else
            const Text(''),
      ],
    );
  }
}
