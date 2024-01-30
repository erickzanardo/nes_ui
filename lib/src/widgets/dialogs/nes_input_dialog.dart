import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_input_dialog}
/// A dialog that shows a message requiring a value to
/// input from the user.
///
/// For ease when showing a dialog, use [NesInputDialog.show] method.
/// {@endtemplate}
class NesInputDialog extends StatefulWidget {
  /// {@macro nes_input_dialog}
  const NesInputDialog({
    required this.inputLabel,
    required this.cancelLabel,
    required this.message,
    super.key,
  });

  /// Value of the input label.
  final String inputLabel;

  /// Value of the cancel label.
  final String cancelLabel;

  /// The inputation message.
  final String message;

  /// A shortcut method that can be used to show this dialog.
  ///
  /// Defaults:
  /// - [inputLabel] Ok
  /// - [cancelLabel] Cancel
  static Future<String?> show({
    required BuildContext context,
    required String message,
    String inputLabel = 'Ok',
    String cancelLabel = 'Cancel',
  }) {
    return NesDialog.show<String?>(
      context: context,
      builder: (_) => NesInputDialog(
        inputLabel: inputLabel,
        cancelLabel: cancelLabel,
        message: message,
      ),
    );
  }

  @override
  State<NesInputDialog> createState() => _NesInputDialogState();
}

class _NesInputDialogState extends State<NesInputDialog> {
  late final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.message),
        const SizedBox(height: 16),
        TextField(
          controller: _controller,
          autofocus: true,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NesButton(
              type: NesButtonType.warning,
              child: Text(widget.cancelLabel),
              onPressed: () {
                Navigator.of(context).pop(null);
              },
            ),
            const SizedBox(width: 16),
            NesButton(
              type: NesButtonType.primary,
              child: Text(widget.inputLabel),
              onPressed: () {
                Navigator.of(context).pop(_controller.text);
              },
            ),
          ],
        ),
      ],
    );
  }
}
