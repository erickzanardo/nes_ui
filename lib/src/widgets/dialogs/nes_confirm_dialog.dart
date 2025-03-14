import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_confirm_dialog}
/// A dialog that shows a message requiring an confirmation
/// from the user.
///
/// For ease when showing a dialog, use [NesConfirmDialog.show] method.
/// {@endtemplate}
class NesConfirmDialog extends StatelessWidget {
  /// {@macro nes_confirm_dialog}
  const NesConfirmDialog({
    required this.confirmLabel,
    required this.cancelLabel,
    required this.message,
    super.key,
  });

  /// Value of the confirm label.
  final String confirmLabel;

  /// Value of the cancel label.
  final String cancelLabel;

  /// The confirmation message.
  final String message;

  /// A shortcut method that can be used to show this dialog.
  ///
  /// Defaults:
  /// - [confirmLabel] Yes
  /// - [cancelLabel] No
  /// - [message] Are you sure?
  static Future<bool?> show({
    required BuildContext context,
    String confirmLabel = 'Yes',
    String cancelLabel = 'No',
    String message = 'Are you sure?',
    NesDialogFrame frame = const NesBasicDialogFrame(),
    bool Function()? onShortcutClose,
    NesDialogConfirmAction Function()? onShortcutConfirm,
  }) {
    return NesDialog.show<bool>(
      context: context,
      builder: (_) => NesConfirmDialog(
        confirmLabel: confirmLabel,
        cancelLabel: cancelLabel,
        message: message,
      ),
      onShortcutClose: onShortcutClose,
      onShortcutConfirm: onShortcutConfirm,
      frame: frame,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(message),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NesButton(
              type: NesButtonType.warning,
              child: Text(cancelLabel),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            const SizedBox(width: 16),
            NesButton(
              type: NesButtonType.primary,
              child: Text(confirmLabel),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        ),
      ],
    );
  }
}
