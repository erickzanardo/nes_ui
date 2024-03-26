import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_scaffold_message}
/// A message to be displayed by a [NesScaffoldMessenger].
/// {@endtemplate}
abstract class NesScaffoldMessage { }

/// {@template nes_scaffold_snackbar}
/// A Snackbar message to be displayed by a [NesScaffoldMessenger].
/// {@endtemplate}
class NesScaffoldSnackbar extends NesScaffoldMessage {
  /// {@macro nes_scaffold_snackbar}
  NesScaffoldSnackbar(this.snackbar);

  /// The snackbar to display.
  final NesSnackbar snackbar;
}

/// {@template nes_scaffold_messenger}
/// Manages widgets displayed by a [NesScaffold].
/// {@endtemplate}
class NesScaffoldMessenger extends InheritedWidget {
  /// {@macro nes_scaffold_messenger}
  const NesScaffoldMessenger._({
    required super.child,
    required this.message,
  });

  /// The current message.
  final NesScaffoldMessage? message;

  /// Returns the current scale imposed by a [NesScaffoldMessenger], if any.
  static NesScaffoldMessage? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<NesScaffoldMessenger>()
        ?.message;
  }

  @override
  bool updateShouldNotify(NesScaffoldMessenger oldWidget) =>
      message != oldWidget.message;
}

/// {@template nes_scaffold}
/// A Nes UI system scaffold widget.
///
/// Right now it doesn't replace the [Scaffold] widget, so we
/// advise to use it in combination with Material's [Scaffold].
///
/// That might change as we develop the library.
///
/// To interact with the [NesScaffold] state, use a [NesScaffoldMessenger].
///
/// {@endtemplate}
class NesScaffold extends StatelessWidget {
  /// {@macro nes_scaffold}
  const NesScaffold({
    required this.body,
    super.key,
  });

  /// The primary content of the scaffold.
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return NesScaffoldMessenger(scale: scale, child: child)
  }
}
