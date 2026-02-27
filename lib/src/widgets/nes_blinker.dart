import 'package:flutter/material.dart';
import 'package:phased/phased.dart';

/// {@template nes_blinker}
/// A widget that blinks its child.
/// {@endtemplate}
class NesBlinker extends Phased<bool> {
  /// {@macro nes_blinker}
  NesBlinker({
    super.key,
    required this.child,
    this.tickerDuration = const Duration(seconds: 1),
  }) : super(
         state: PhasedState<bool>(
           values: [true, false],
           ticker: tickerDuration,
         ),
       );

  /// Duration of ticker, it changes the blink speed.
  final Duration? tickerDuration;

  /// The child widget to blink.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (state.value) {
      return child;
    } else {
      return const SizedBox();
    }
  }
}
