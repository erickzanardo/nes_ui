import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_confirm_dialog}
/// A dialog that shows a message requiring an confirmation
/// from the user.
///
/// For ease when showing a dialog, use [NesConfirmDialog.show] method.
/// {@endtemplate}
class NesConfirmDialog extends StatefulWidget {
  /// {@macro nes_confirm_dialog}
  const NesConfirmDialog({
    required this.confirmLabel,
    required this.cancelLabel,
    required this.message,
    this.shortcutsNotifier,
    super.key,
  });

  /// Value of the confirm label.
  final String confirmLabel;

  /// Value of the cancel label.
  final String cancelLabel;

  /// The confirmation message.
  final String message;

  /// A notifier that can be used to pass down shortcuts events.
  final ValueNotifier<bool?>? shortcutsNotifier;

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
  }) async {
    final notifier = ValueNotifier<bool?>(null);

    final value = await NesDialog.show<bool>(
      context: context,
      builder: (_) => NesConfirmDialog(
        confirmLabel: confirmLabel,
        cancelLabel: cancelLabel,
        message: message,
        shortcutsNotifier: notifier,
      ),
      onShortcutClose: onShortcutClose ??
          () {
            notifier.value = false;
            return true;
          },
      onShortcutConfirm: onShortcutConfirm ??
          () {
            notifier.value = true;
            return NesDialogConfirmAction.doNothing;
          },
      frame: frame,
    );

    notifier.dispose();

    return value;
  }

  @override
  State<NesConfirmDialog> createState() => _NesConfirmDialogState();
}

class _NesConfirmDialogState extends State<NesConfirmDialog> {
  @override
  void initState() {
    super.initState();

    widget.shortcutsNotifier?.addListener(_onShortcutValue);
  }

  @override
  void dispose() {
    widget.shortcutsNotifier?.removeListener(_onShortcutValue);
    super.dispose();
  }

  void _onShortcutValue() {
    final value = widget.shortcutsNotifier?.value;
    if (value != null) {
      Navigator.of(context).pop(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.message),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NesButton(
              type: NesButtonType.warning,
              child: Text(widget.cancelLabel),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            const SizedBox(width: 16),
            NesButton(
              type: NesButtonType.primary,
              child: Text(widget.confirmLabel),
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
