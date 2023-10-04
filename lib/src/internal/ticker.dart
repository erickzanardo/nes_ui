// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

typedef TickerBuilder = Widget Function(BuildContext context, int count);

class Ticker extends StatefulWidget {
  const Ticker({
    required this.builder,
    required this.tickerDuration,
    this.onTick,
    super.key,
  });

  final TickerBuilder builder;
  final VoidCallback? onTick;
  final Duration tickerDuration;

  @override
  State<Ticker> createState() => _TickerState();
}

class _TickerState extends State<Ticker> with SingleTickerProviderStateMixin {
  AnimationController? _ticker;
  DateTime? _lastUpdated;
  var _count = 0;

  @override
  void initState() {
    super.initState();

    _ticker = AnimationController(
      vsync: this,
      duration: widget.tickerDuration,
    )..addListener(() {
        final now = DateTime.now();
        if (_lastUpdated == null ||
            now.millisecondsSinceEpoch - _lastUpdated!.millisecondsSinceEpoch >=
                widget.tickerDuration.inMilliseconds) {
          _lastUpdated = now;
          widget.onTick?.call();
          setState(() {
            _count++;
          });
        }
      });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _ticker!.repeat(period: widget.tickerDuration);
    });
  }

  @override
  void dispose() {
    _ticker?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(context, _count);
}
