import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:nes_ui/src/internal/internal.dart';
import 'package:phased/phased.dart';

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

/// {@template nes_terminal_loading_indicator}
/// A loading indicator that uses character to display a loading indicator.
/// {@endtemplate}
class NesTerminalLoadingIndicator extends StatelessWidget {
  /// {@macro nes_terminal_loading_indicator}
  const NesTerminalLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return _TerminalLoadingIndicator();
  }
}

class _TerminalLoadingIndicator extends Phased<String> {
  _TerminalLoadingIndicator()
    : super(
        state: PhasedState<String>(
          values: ['|', '/', '-', r'\'],
          ticker: const Duration(milliseconds: 200),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Text(state.value);
  }
}

/// {@template nes_jumping_icons_loading_indicator}
/// A loading indicator that displays icons jumping around.
/// {@endtemplate}
class NesJumpingIconsLoadingIndicator extends StatelessWidget {
  /// {@macro nes_jumping_icons_loading_indicator}
  const NesJumpingIconsLoadingIndicator({
    required this.icons,
    this.offset = const Offset(0, -.6),
    super.key,
  });

  /// The icons to display.
  final List<NesIconData> icons;

  /// The offset representing the icon jump.
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return _JumpingIcons(icons, offset);
  }
}

class _JumpingIcons extends Phased<int> {
  _JumpingIcons(this.icons, this.offset)
    : super(
        state: PhasedState<int>(
          values: List.generate(icons.length + 2, (index) => index),
          ticker: const Duration(milliseconds: 200),
        ),
      );

  final List<NesIconData> icons;
  final Offset offset;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < icons.length; i++)
          Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: AnimatedSlide(
                offset: state.value == i ? offset : Offset.zero,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                child: NesIcon(iconData: icons[i]),
              ),
            ),
          ),
      ],
    );
  }
}

/// {@template nes_jumping_icons_loading_indicator}
/// A loading indicator where icons change into other icons.
/// {@endtemplate}
class NesMutatingIconsLoadingIndicator extends StatelessWidget {
  /// {@macro nes_jumping_icons_loading_indicator}
  const NesMutatingIconsLoadingIndicator({required this.icons, super.key});

  /// The icons to display.
  final List<NesIconData> icons;

  @override
  Widget build(BuildContext context) {
    return _MutatingIcon(icons);
  }
}

class _MutatingIcon extends Phased<double> {
  _MutatingIcon(this.icons)
    : super(
        state: PhasedState<double>(
          values: List.generate(
            icons.length,
            (index) => index.toDouble(),
          ).expand((element) => [element, element + .2, element + .4]).toList(),
          ticker: const Duration(milliseconds: 500),
        ),
      );

  final List<NesIconData> icons;

  @override
  Widget build(BuildContext context) {
    final i = state.value ~/ 1;
    return AnimatedOpacity(
      opacity: state.value == i ? 1 : 0,
      duration: const Duration(milliseconds: 200),
      child: NesIcon(iconData: icons[i]),
    );
  }
}

/// {@template nes_pixel_row_loading_indicator}
/// A loading indicator that displays a sequence of pixels.
/// {@endtemplate}
class NesPixelRowLoadingIndicator extends StatelessWidget {
  /// {@macro nes_pixel_row_loading_indicator}
  const NesPixelRowLoadingIndicator({
    this.count = 6,
    this.color,
    this.size,
    super.key,
  });

  /// The number of pixels to display.
  final int count;

  /// The color of the pixels.
  ///
  /// When omitted, defaults to the text body color.
  final Color? color;

  /// The size of each pixel, when omitted, defaults to the double
  /// [NesTheme.pixelSize].
  final int? size;

  @override
  Widget build(BuildContext context) {
    final color =
        this.color ??
        Theme.of(context).textTheme.bodyMedium?.color ??
        Colors.black;
    final size =
        this.size ?? context.nesThemeExtension<NesTheme>().pixelSize * 2;

    return _PixelRow(count: count, color: color, size: size);
  }
}

class _PixelRow extends Phased<int> {
  _PixelRow({required this.count, required this.color, required this.size})
    : super(
        state: PhasedState<int>(
          values: List.generate(count, (index) => index),
          ticker: const Duration(milliseconds: 200),
        ),
      );

  final int count;
  final Color color;
  final int size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (size.toDouble() * 2) * count,
      height: size.toDouble() * 2,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < state.value; i++)
            Padding(
              padding: EdgeInsets.all(size / 4),
              child: SizedBox(
                width: size.toDouble(),
                height: size.toDouble(),
                child: DecoratedBox(decoration: BoxDecoration(color: color)),
              ),
            ),
        ],
      ),
    );
  }
}
