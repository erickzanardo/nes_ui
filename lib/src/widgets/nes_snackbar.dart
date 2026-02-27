import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// The type of [NesSnackbar] to display.
enum NesSnackbarType {
  /// A [SnackBar] with a normal style.
  normal,

  /// A [SnackBar] with a success style.
  success,

  /// A [SnackBar] with a warning style.
  warning,

  /// A [SnackBar] with a error style.
  error,
}

/// {@template nes_snackbar}
/// A [SnackBar] with a NES style.
/// {@endtemplate}
class NesSnackbar extends StatelessWidget {
  /// {@macro nes_snackbar}
  const NesSnackbar({
    required this.text,
    this.type = NesSnackbarType.normal,
    super.key,
  });

  /// The type of [NesSnackbar] to display.
  final NesSnackbarType type;

  /// The text to display in the [NesSnackbar].
  final String text;

  /// Shows a [NesSnackbar] with the given [text].
  static void show(
    BuildContext context, {
    required String text,
    NesSnackbarType type = NesSnackbarType.normal,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: SizedBox(
          width: double.infinity,
          child: NesSnackbar(text: text, type: type),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final snackbarTheme = context.nesThemeExtension<NesSnackbarTheme>();

    late Color color;
    TextStyle? textStyle;

    switch (type) {
      case NesSnackbarType.normal:
        color = snackbarTheme.normal;
        textStyle = snackbarTheme.normalTextStyle;
        break;
      case NesSnackbarType.success:
        color = snackbarTheme.success;
        textStyle = snackbarTheme.successTextStyle;
        break;
      case NesSnackbarType.warning:
        color = snackbarTheme.warning;
        textStyle = snackbarTheme.warningTextStyle;
        break;
      case NesSnackbarType.error:
        color = snackbarTheme.error;
        textStyle = snackbarTheme.errorTextStyle;
        break;
    }

    return NesContainer(
      backgroundColor: color,
      child: Text(
        text,
        style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
