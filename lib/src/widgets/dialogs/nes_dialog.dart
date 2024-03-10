import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nes_ui/nes_ui.dart';

class _CloseDialogIntent extends Intent {
  const _CloseDialogIntent();
}

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
    final nesTheme = context.nesThemeExtension<NesTheme>();

    final scaling = NesFixedViewportScaling.maybeOf(context);

    return showGeneralDialog<T>(
      context: context,
      barrierColor: Colors.transparent,
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return MouseRegion(
          cursor: nesTheme.basicCursor,
          child: SizedBox.expand(
            child: DecoratedBox(
              decoration: const BoxDecoration(
                image: NesCheckeredDecoration(),
              ),
              child: Transform.scale(
                scaleY: animation.value,
                child: child,
              ),
            ),
          ),
        );
      },
      pageBuilder: (_, __, ___) {
        final dialog = NesDialog(
          child: builder(context),
        );

        if (scaling != null) {
          return Transform.scale(
            scale: scaling,
            child: dialog,
          );
        }

        return dialog;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.escape): const _CloseDialogIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          _CloseDialogIntent: CallbackAction<_CloseDialogIntent>(
            onInvoke: (intent) {
              Navigator.of(context).pop();
              return null;
            },
          ),
        },
        child: Focus(
          autofocus: true,
          child: Align(
            child: Material(
              color: Colors.transparent,
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
                            iconData: NesIcons.close,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
