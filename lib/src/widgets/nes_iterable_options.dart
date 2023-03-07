import 'package:flutter/widgets.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_iterable_options}
/// A widget that allows users to cycle through options.
///
/// By default it the indicator of the selected option is [value].toString()
/// inside a [Text] widget. That can be customized by informing a
/// [optionBuilder].
///
/// The default selection controllers are [NesIcons.leftArrowIndicator] and
/// [NesIcons.rightArrowIndicator], that can be also be customized by passing
/// a [leftIndicatorBuilder] and [rightIndicatorBuilder].
/// {@endtemplate}
class NesIterableOptions<T> extends StatelessWidget {
  /// {@template nes_iterable_options}
  const NesIterableOptions({
    super.key,
    required this.values,
    required this.onChange,
    required this.value,
    this.optionBuilder,
    this.leftIndicatorBuilder,
    this.rightIndicatorBuilder,
  });

  /// Values of this iterable options.
  final List<T> values;

  /// Called when the value has changed.
  final void Function(T) onChange;

  /// Current value.
  final T value;

  /// When informed will be responsible to build the current
  /// option indicator.
  final Widget Function(BuildContext, T)? optionBuilder;

  /// When informed will build the left indicator.
  final WidgetBuilder? leftIndicatorBuilder;

  /// When informed will build the right indicator.
  final WidgetBuilder? rightIndicatorBuilder;

  void _select(int modifier) {
    final selectedIndex = values.indexOf(value);
    final newIndex = selectedIndex + modifier;
    if (newIndex < 0) {
      final value = values.last;
      onChange(value);
    } else if (newIndex >= values.length) {
      onChange(values.first);
    } else {
      onChange(values[newIndex]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NesPressable(
          child: leftIndicatorBuilder?.call(context) ??
              NesIcon(iconData: NesIcons.instance.leftArrowIndicator),
          onPress: () {
            _select(-1);
          },
        ),
        optionBuilder?.call(context, value) ?? Text(value.toString()),
        NesPressable(
          child: rightIndicatorBuilder?.call(context) ??
              NesIcon(iconData: NesIcons.instance.rightArrowIndicator),
          onPress: () {
            _select(1);
          },
        ),
      ],
    );
  }
}
