import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_running_text}
/// A widget that displays a text that runs from right to left.
/// {@endtemplate}
class NesRunningText extends StatefulWidget {
  /// {@macro nes_running_text}
  const NesRunningText({
    required this.text,
    this.speed,
    this.textStyle,
    this.onEnd,
    this.running = true,
    super.key,
  });

  /// The text to display.
  final String text;

  /// The speed of the text, in seconds.
  ///
  /// By default, uses the value on the [NesRunningTextTheme].speed.
  final double? speed;

  /// The style of the text. When omitted, it uses the theme's bodyMedium style.
  final TextStyle? textStyle;

  /// Called when the text has reached the end.
  final VoidCallback? onEnd;

  /// Whether the text is running.
  final bool running;

  @override
  State<NesRunningText> createState() => _NesRunningTextState();
}

class _NesRunningTextState extends State<NesRunningText>
    with SingleTickerProviderStateMixin {
  late final _characters = widget.text.split('');
  var _currentChar = 0;

  AnimationController? _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _controller?.dispose();

    final speed =
        widget.speed ?? context.nesThemeExtension<NesRunningTextTheme>().speed;
    _controller =
        AnimationController(
          duration: Duration(milliseconds: (1000 * speed).round()),
          vsync: this,
        )..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _nextWord();
          }
        });

    if (widget.running) {
      _controller?.forward();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant NesRunningText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.running != oldWidget.running) {
      if (widget.running) {
        _controller?.forward();
      } else {
        _controller?.stop();
      }
    }

    if (widget.text != oldWidget.text) {
      _characters
        ..clear()
        ..addAll(widget.text.split(''));
      _currentChar = 0;

      if (widget.running) {
        _controller?.forward(from: 0);
      }
    }
  }

  void _nextWord() {
    if (_currentChar == _characters.length - 1) {
      widget.onEnd?.call();
    } else {
      _controller?.forward(from: 0);
    }

    final currentChar = _currentChar + 1;

    setState(() {
      _currentChar = currentChar;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = widget.textStyle ?? theme.textTheme.bodyMedium;

    return Text(_characters.sublist(0, _currentChar).join(), style: style);
  }
}
