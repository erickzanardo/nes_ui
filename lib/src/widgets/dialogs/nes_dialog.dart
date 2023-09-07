import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_confirm_dialog}
/// A dialog that shows a child.
///
/// For ease when showing a dialog, use [NesDialog.show] method.
/// {@endtemplate}
class NesDialog extends StatelessWidget {
  /// {@macro nes_confirm_dialog}
  const NesDialog({
    required this.child,
    super.key,
  });

  /// The dialog child.
  final Widget child;

  /// A shortcut method that can be used to show this dialog.
  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
  }) {
    return showGeneralDialog<T>(
      context: context,
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return Transform.scale(
          scaleY: animation.value,
          child: child,
        );
      },
      pageBuilder: (_, __, ___) => NesDialog(
        child: builder(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Material(
        child: IntrinsicWidth(
          stepHeight: 0.56,
          child: SizedBox.expand(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                NesContainer(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: child,
                    ),
                  ),
                ),
                Positioned(
                  right: -8,
                  top: -8,
                  child: NesButton(
                    type: NesButtonType.error,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: NesIcon(
                      size: const Size(16, 16),
                      iconData: NesIcons.instance.close,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
