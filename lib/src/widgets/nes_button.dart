import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:nes_ui/src/extensions/color.dart';

/// Defines the type of a [NesButton].
enum NesButtonType {
  /// Normal.
  normal,

  /// Primary.
  primary,

  /// Success.
  success,

  /// Warning.
  warning,

  /// Error.
  error,
}

Color _mapButtonColor(NesButtonType type, NesButtonTheme theme) {
  switch (type) {
    case NesButtonType.normal:
      return theme.normal;
    case NesButtonType.primary:
      return theme.primary;
    case NesButtonType.success:
      return theme.success;
    case NesButtonType.warning:
      return theme.warning;
    case NesButtonType.error:
      return theme.error;
  }
}

/// {@template nes_button}
/// Renders a pressable button.
/// {@endtemplate}
class NesButton extends StatefulWidget {
  /// {@macro nes_button}
  const NesButton({
    super.key,
    required this.type,
    required this.child,
    this.onPressed,
  }) : _isDisabled = onPressed == null;

  /// {@macro nes_button}
  ///
  /// Adds an [NesIcon] to the button.
  NesButton.icon({
    Key? key,
    required NesButtonType type,
    required NesIconData icon,
    VoidCallback? onPressed,
  }) : this(
          key: key,
          type: type,
          child: NesIcon(iconData: icon),
          onPressed: onPressed,
        );

  /// {@macro nes_button}
  ///
  /// Adds an [Text] to the button.
  NesButton.text({
    Key? key,
    required NesButtonType type,
    required String text,
    VoidCallback? onPressed,
  }) : this(
          key: key,
          type: type,
          child: Text(text),
          onPressed: onPressed,
        );

  /// {@macro nes_button}
  ///
  /// Adds a [Row] with a [NesIcon] and a [Text] to the button.
  NesButton.iconText({
    Key? key,
    required NesButtonType type,
    required NesIconData icon,
    required String text,
    VoidCallback? onPressed,
  }) : this(
          key: key,
          type: type,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              NesIcon(iconData: icon),
              const SizedBox(width: 8),
              Text(text),
            ],
          ),
          onPressed: onPressed,
        );

  /// Determines the colors used to render the button.
  final NesButtonType type;

  /// The "label" of the button.
  final Widget child;

  /// The callback called the button is pressed.
  final VoidCallback? onPressed;

  /// Whether the button is disabled.
  final bool _isDisabled;

  @override
  State<NesButton> createState() => _NesButtonState();
}

class _NesButtonState extends State<NesButton> {
  bool _pressed = false;
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final materialTheme = Theme.of(context);
    final textStyle = materialTheme.textTheme.labelMedium ?? const TextStyle();

    final nesTheme = context.nesThemeExtension<NesTheme>();
    final nesButtonTheme = context.nesThemeExtension<NesButtonTheme>();

    final buttonColor = _mapButtonColor(widget.type, nesButtonTheme);

    final fontColor = buttonColor.isLight()
        ? nesButtonTheme.darkLabelColor
        : nesButtonTheme.lightLabelColor;
    final nesIconTheme = buttonColor.isLight()
        ? nesButtonTheme.darkIconTheme
        : nesButtonTheme.lightIconTheme;

    final materialIconData = materialTheme.iconTheme.copyWith(
      color: nesIconTheme.primary,
    );

    final pixelSize = nesButtonTheme.pixelSize ?? nesTheme.pixelSize;

    return MouseRegion(
      cursor: nesTheme.clickCursor,
      onEnter: (_) {
        setState(() => _hovered = true);
      },
      onExit: (_) {
        setState(() => _hovered = false);
      },
      child: GestureDetector(
        onTap: widget.onPressed,
        onTapDown: (_) {
          setState(() => _pressed = true);
        },
        onTapUp: (_) {
          setState(() => _pressed = false);
        },
        onTapCancel: () {
          setState(() => _pressed = false);
        },
        child: CustomPaint(
          painter: _ButtonPainer(
            color: buttonColor,
            borderColor:
                nesButtonTheme.borderColor ?? textStyle.color ?? Colors.black,
            pixelSize: pixelSize,
            pressed: widget._isDisabled ? widget._isDisabled : _pressed,
            hovered: widget._isDisabled ? widget._isDisabled : _hovered,
          ),
          child: Padding(
            padding: EdgeInsets.all(pixelSize * 4),
            child: DefaultTextStyle(
              style: textStyle.copyWith(
                color: fontColor,
              ),
              child: Theme(
                data: materialTheme.copyWith(
                  iconTheme: materialIconData,
                  extensions: [
                    ...materialTheme.extensions.values,
                    nesIconTheme,
                  ],
                ),
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ButtonPainer extends CustomPainter {
  const _ButtonPainer({
    required this.color,
    required this.borderColor,
    required this.pixelSize,
    required this.pressed,
    required this.hovered,
  });

  final Color color;
  final Color borderColor;
  final int pixelSize;
  final bool pressed;
  final bool hovered;

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()..color = color;
    final shadowPaint = Paint()..color = color.darken(.4);
    final hoverPaint = Paint()..color = color.darken(.4).withOpacity(.4);
    final borderPaint = Paint()..color = borderColor;

    // Top border
    canvas
      ..drawRect(
        Rect.fromLTWH(
          pixelSize.toDouble(),
          0,
          size.width - pixelSize * 2,
          pixelSize.toDouble(),
        ),
        borderPaint,
      )
      // Bottom border
      ..drawRect(
        Rect.fromLTWH(
          pixelSize.toDouble(),
          size.height - pixelSize,
          size.width - pixelSize * 2,
          pixelSize.toDouble(),
        ),
        borderPaint,
      )
      // Left border
      ..drawRect(
        Rect.fromLTWH(
          0,
          pixelSize.toDouble(),
          pixelSize.toDouble(),
          size.height - pixelSize * 2,
        ),
        borderPaint,
      )
      // Right border
      ..drawRect(
        Rect.fromLTWH(
          size.width - pixelSize,
          pixelSize.toDouble(),
          pixelSize.toDouble(),
          size.height - pixelSize * 2,
        ),
        borderPaint,
      )
      // Background
      ..drawRect(
        Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        ).deflate(
          pixelSize.toDouble(),
        ),
        backgroundPaint,
      );

    if (pressed) {
      canvas
        ..drawRect(
          Rect.fromLTWH(
            pixelSize.toDouble(),
            pixelSize.toDouble(),
            size.width - pixelSize * 2,
            pixelSize.toDouble(),
          ),
          shadowPaint,
        )
        ..drawRect(
          Rect.fromLTWH(
            pixelSize.toDouble(),
            pixelSize.toDouble(),
            pixelSize.toDouble(),
            size.height - pixelSize * 2,
          ),
          shadowPaint,
        );
    } else {
      canvas
        ..drawRect(
          Rect.fromLTWH(
            pixelSize.toDouble(),
            size.height - pixelSize * 2,
            size.width - pixelSize * 2,
            pixelSize.toDouble(),
          ),
          shadowPaint,
        )
        ..drawRect(
          Rect.fromLTWH(
            size.width - pixelSize * 2,
            pixelSize.toDouble(),
            pixelSize.toDouble(),
            size.height - pixelSize * 2,
          ),
          shadowPaint,
        );
    }

    if (hovered) {
      canvas.drawRect(
        Rect.fromLTWH(
          0,
          0,
          size.width,
          size.height,
        ).deflate(
          pixelSize.toDouble(),
        ),
        hoverPaint,
      );
    }
  }

  @override
  bool shouldRepaint(_ButtonPainer old) {
    return old.color != color ||
        old.borderColor != borderColor ||
        old.pixelSize != pixelSize ||
        old.pressed != pressed ||
        old.hovered != hovered;
  }
}
