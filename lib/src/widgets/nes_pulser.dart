import 'package:flutter/material.dart';
import 'package:phased/phased.dart';

/// {@template nes_pulser}
/// A widget that pulses its child.
/// {@endtemplate}
class NesPulser extends Phased<bool> {
  /// {@macro nes_pulser}
  NesPulser({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeIn,
    this.pulseScale = 1.1,
    Duration interval = const Duration(milliseconds: 250),
  }) : super(
         state: PhasedState<bool>(values: [true, false], ticker: interval),
       );

  /// The value to scale the child by when pulsing.
  final double pulseScale;

  /// The duration of the pulse animation.
  final Duration duration;

  /// The curve of the pulse animation.
  final Curve curve;

  /// The child widget to pulse.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: state.phaseValue(
        values: {true: pulseScale, false: 1.0},
        defaultValue: 1,
      ),
      duration: duration,
      curve: curve,
      child: child,
    );
  }
}
