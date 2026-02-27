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
    this.shortcutsNotifier,
    super.key,
  });

  /// Value of the input label.
  final String inputLabel;

  /// Value of the cancel label.
  final String cancelLabel;

  /// The inputation message.
  final String message;

  /// A notifier that can be used to pass down shortcuts events.
  final ValueNotifier<bool?>? shortcutsNotifier;

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
    NesDialogFrame frame = const NesBasicDialogFrame(),
    bool Function()? onShortcutClose,
    NesDialogConfirmAction Function()? onShortcutConfirm,
  }) async {
    final notifier = ValueNotifier<bool?>(null);
    final value = await NesDialog.show<String?>(
      context: context,
      builder: (_) => NesInputDialog(
        inputLabel: inputLabel,
        cancelLabel: cancelLabel,
        message: message,
        shortcutsNotifier: notifier,
      ),
      frame: frame,
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
    );

    notifier.dispose();

    return value;
  }

  @override
  State<NesInputDialog> createState() => _NesInputDialogState();
}

class _NesInputDialogState extends State<NesInputDialog> {
  late final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.shortcutsNotifier?.addListener(_onShortcutValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    widget.shortcutsNotifier?.removeListener(_onShortcutValue);
    super.dispose();
  }

  void _onShortcutValue() {
    final value = widget.shortcutsNotifier?.value;
    if (value == null || value == false) {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pop(_controller.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.message),
        const SizedBox(height: 16),
        TextField(controller: _controller, autofocus: true),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NesButton(
              type: NesButtonType.warning,
              child: Text(widget.cancelLabel),
              onPressed: () {
                Navigator.of(context).pop();
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
