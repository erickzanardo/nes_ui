import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:nes_ui/src/internal/internal.dart';

/// {@template nes_hourglass_loading_indicator}
/// A loading indicator that displays an hourglass that rotates.
/// {@endtemplate}
class NesHourglassLoadingIndicator extends StatefulWidget {
  /// {@macro nes_hourglass_loading_indicator}
  const NesHourglassLoadingIndicator({super.key});

  @override
  State<NesHourglassLoadingIndicator> createState() =>
      _NesHourglassLoadingIndicatorState();
}

class _NesHourglassLoadingIndicatorState
    extends State<NesHourglassLoadingIndicator> {
  var _currentIcon = NesIcons.hourglassTopFull;

  var _count = 0;
  var _turns = 0.0;
  var _goingUp = false;

  @override
  Widget build(BuildContext context) {
    return Ticker(
      onTick: () {
        _count++;
        if (_count == 3) {
          _turns -= 0.5;
          _count = 0;
          _goingUp = !_goingUp;

          return;
        }

        if (_currentIcon == NesIcons.hourglassMiddle) {
          _currentIcon = _goingUp
              ? NesIcons.hourglassTopFull
              : NesIcons.hourglassBottomFull;
        } else if (_currentIcon == NesIcons.hourglassTopFull) {
          _currentIcon = NesIcons.hourglassMiddle;
        } else if (_goingUp) {
          _currentIcon = NesIcons.hourglassMiddle;
        }
      },
      builder: (context, count) {
        return AnimatedRotation(
          turns: _turns,
          duration: const Duration(milliseconds: 250),
          child: NesIcon(iconData: _currentIcon),
        );
      },
      tickerDuration: const Duration(milliseconds: 300),
    );
  }
}
