import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_theme}
/// Class with general theme information for Flutter Nes.
/// {@endtemplate}
@immutable
class NesTheme extends ThemeExtension<NesTheme> {
  /// {@macro nes_theme}
  const NesTheme({
    required this.pixelSize,
    this.clickCursor = SystemMouseCursors.click,
    this.resizeLeftRightCursor = SystemMouseCursors.resizeLeftRight,
    this.resizeUpDownCursor = SystemMouseCursors.resizeUpDown,
    this.moveCursor = SystemMouseCursors.move,
    this.resizeUpLeftDownRightCursor = SystemMouseCursors.resizeUpLeftDownRight,
    this.resizeUpRightDownLeftCursor = SystemMouseCursors.resizeUpRightDownLeft,
    this.resizeUpCursor = SystemMouseCursors.resizeUp,
    this.resizeDownCursor = SystemMouseCursors.resizeDown,
    this.resizeLeftCursor = SystemMouseCursors.resizeLeft,
    this.resizeRightCursor = SystemMouseCursors.resizeRight,
    this.basicCursor = SystemMouseCursors.basic,
    this.screenTransitionCursor,
  });

  /// The size of a pixel unit used in Flutter nes, like the width
  /// of a border of a button.
  final int pixelSize;

  /// When provided, the cursor used when hovering over a widget.
  ///
  /// Defaults to [SystemMouseCursors.basic].
  final MouseCursor basicCursor;

  /// When provided, the cursor used when hovering over a button
  /// or anything that is clickable.
  ///
  /// Defaults to [SystemMouseCursors.click].
  final MouseCursor clickCursor;

  /// When provided, the cursor used when hovering over a resize corner
  ///
  /// Defaults to [SystemMouseCursors.resizeLeftRight].
  final MouseCursor resizeLeftRightCursor;

  /// When provided, the cursor used when hovering over a resize corner
  ///
  /// Defaults to [SystemMouseCursors.resizeUpDown].
  final MouseCursor resizeUpDownCursor;

  /// When provided, the cursor used when hovering over a resize corner
  ///
  /// Defaults to [SystemMouseCursors.resizeUpLeftDownRight].
  final MouseCursor resizeUpLeftDownRightCursor;

  /// When provided, the cursor used when hovering over a resize corner
  ///
  /// Defaults to [SystemMouseCursors.resizeUpRightDownLeft].
  final MouseCursor resizeUpRightDownLeftCursor;

  /// When provided, the cursor used when hovering over the up side.
  ///
  /// Defaults to [SystemMouseCursors.resizeUp].
  final MouseCursor resizeUpCursor;

  /// When provided, the cursor used when hovering over the bottom side.
  ///
  /// Defaults to [SystemMouseCursors.resizeDown].
  final MouseCursor resizeDownCursor;

  /// When provided, the cursor used when hovering over the left side.
  ///
  /// Defaults to [SystemMouseCursors.resizeLeft].
  final MouseCursor resizeLeftCursor;

  /// When provided, the cursor used when hovering over the right side.
  ///
  /// Defaults to [SystemMouseCursors.resizeRight].
  final MouseCursor resizeRightCursor;

  /// When provided, the cursor used when hovering over a moveable widget.
  ///
  /// Defaults to [SystemMouseCursors.move].
  final MouseCursor moveCursor;

  /// The cursor used when hovering over a screen transition.
  ///
  /// When omitted, fallbacks to [NesTheme.basicCursor].
  final MouseCursor? screenTransitionCursor;

  @override
  NesTheme copyWith({
    int? pixelSize,
    MouseCursor? clickCursor,
    MouseCursor? resizeLeftRightCursor,
    MouseCursor? resizeUpDownCursor,
    MouseCursor? moveCursor,
    MouseCursor? resizeUpLeftDownRightCursor,
    MouseCursor? resizeUpRightDownLeftCursor,
    MouseCursor? resizeUpCursor,
    MouseCursor? resizeDownCursor,
    MouseCursor? resizeLeftCursor,
    MouseCursor? resizeRightCursor,
    MouseCursor? basicCursor,
    MouseCursor? screenTransitionCursor,
  }) {
    return NesTheme(
      pixelSize: pixelSize ?? this.pixelSize,
      clickCursor: clickCursor ?? this.clickCursor,
      resizeLeftRightCursor:
          resizeLeftRightCursor ?? this.resizeLeftRightCursor,
      resizeUpDownCursor: resizeUpDownCursor ?? this.resizeUpDownCursor,
      moveCursor: moveCursor ?? this.moveCursor,
      resizeUpLeftDownRightCursor:
          resizeUpLeftDownRightCursor ?? this.resizeUpLeftDownRightCursor,
      resizeUpRightDownLeftCursor:
          resizeUpRightDownLeftCursor ?? this.resizeUpRightDownLeftCursor,
      resizeUpCursor: resizeUpCursor ?? this.resizeUpCursor,
      resizeDownCursor: resizeDownCursor ?? this.resizeDownCursor,
      resizeLeftCursor: resizeLeftCursor ?? this.resizeLeftCursor,
      resizeRightCursor: resizeRightCursor ?? this.resizeRightCursor,
      basicCursor: basicCursor ?? this.basicCursor,
      screenTransitionCursor:
          screenTransitionCursor ?? this.screenTransitionCursor,
    );
  }

  @override
  ThemeExtension<NesTheme> lerp(ThemeExtension<NesTheme>? other, double t) {
    final otherExt = other as NesTheme?;
    return NesTheme(
      pixelSize: IntTween(
        begin: pixelSize,
        end: otherExt?.pixelSize ?? pixelSize,
      ).lerp(t),
      clickCursor: otherExt?.clickCursor ?? clickCursor,
      resizeLeftRightCursor:
          otherExt?.resizeLeftRightCursor ?? resizeLeftRightCursor,
      resizeUpDownCursor: otherExt?.resizeUpDownCursor ?? resizeUpDownCursor,
      moveCursor: otherExt?.moveCursor ?? moveCursor,
      resizeUpLeftDownRightCursor:
          otherExt?.resizeUpLeftDownRightCursor ?? resizeUpLeftDownRightCursor,
      resizeUpRightDownLeftCursor:
          otherExt?.resizeUpRightDownLeftCursor ?? resizeUpRightDownLeftCursor,
      resizeUpCursor: otherExt?.resizeUpCursor ?? resizeUpCursor,
      resizeDownCursor: otherExt?.resizeDownCursor ?? resizeDownCursor,
      resizeLeftCursor: otherExt?.resizeLeftCursor ?? resizeLeftCursor,
      resizeRightCursor: otherExt?.resizeRightCursor ?? resizeRightCursor,
      basicCursor: otherExt?.basicCursor ?? basicCursor,
      screenTransitionCursor:
          otherExt?.screenTransitionCursor ?? screenTransitionCursor,
    );
  }
}

/// {@template nes_button_theme}
/// Class with information regarding [NesButton] inside Flutter Nes.
/// {@endtemplate}
class NesButtonTheme extends ThemeExtension<NesButtonTheme> {
  /// {@macro nes_button_theme}
  const NesButtonTheme({
    required this.normal,
    required this.primary,
    required this.success,
    required this.warning,
    required this.error,
    required this.lightLabelColor,
    required this.darkLabelColor,
    required this.lightIconTheme,
    required this.darkIconTheme,
    this.borderColor,
    this.pixelSize,
    this.painter = NesDefaultButtonPainter.new,
  });

  /// The color for the normal type of button.
  final Color normal;

  /// The color for the primary type of button.
  final Color primary;

  /// The color for the success type of button.
  final Color success;

  /// The color for the warning type of button.
  final Color warning;

  /// The color for the error type of button.
  final Color error;

  /// The color for the labels used on a dark colored button.
  final Color lightLabelColor;

  /// The color for the labels used on a light colored button.
  final Color darkLabelColor;

  /// The icon theme used on a dark colored button.
  final NesIconTheme lightIconTheme;

  /// The icon theme used on a light colored button.
  final NesIconTheme darkIconTheme;

  /// The color of the button border. When null, fallbacks
  /// to the [TextTheme.labelMedium] color.
  final Color? borderColor;

  /// The pixel size used in the buttons, resorts to [NesTheme.pixelSize] when
  /// null.
  final int? pixelSize;

  /// The builder function that creates the painter used to draw the button.
  final NesButtonPainterBuilder? painter;

  @override
  NesButtonTheme copyWith({
    Color? normal,
    Color? primary,
    Color? success,
    Color? warning,
    Color? error,
    Color? lightLabelColor,
    Color? darkLabelColor,
    NesIconTheme? lightIconTheme,
    NesIconTheme? darkIconTheme,
    Color? borderColor,
    int? pixelSize,
    NesButtonPainterBuilder? painter,
  }) {
    return NesButtonTheme(
      normal: normal ?? this.normal,
      primary: primary ?? this.primary,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      lightLabelColor: lightLabelColor ?? this.lightLabelColor,
      darkLabelColor: darkLabelColor ?? this.darkLabelColor,
      lightIconTheme: lightIconTheme ?? this.lightIconTheme,
      darkIconTheme: darkIconTheme ?? this.darkIconTheme,
      borderColor: borderColor ?? this.borderColor,
      pixelSize: pixelSize ?? this.pixelSize,
      painter: painter ?? this.painter,
    );
  }

  @override
  ThemeExtension<NesButtonTheme> lerp(
    ThemeExtension<NesButtonTheme>? other,
    double t,
  ) {
    final otherExt = other as NesButtonTheme?;

    return NesButtonTheme(
      normal: ColorTween(
            begin: normal,
            end: otherExt?.normal,
          ).lerp(t) ??
          normal,
      primary: ColorTween(
            begin: primary,
            end: otherExt?.primary,
          ).lerp(t) ??
          primary,
      success: ColorTween(
            begin: success,
            end: otherExt?.success,
          ).lerp(t) ??
          success,
      warning: ColorTween(
            begin: warning,
            end: otherExt?.warning,
          ).lerp(t) ??
          warning,
      error: ColorTween(
            begin: error,
            end: otherExt?.error,
          ).lerp(t) ??
          error,
      lightLabelColor: ColorTween(
            begin: lightLabelColor,
            end: otherExt?.lightLabelColor,
          ).lerp(t) ??
          lightLabelColor,
      darkLabelColor: ColorTween(
            begin: darkLabelColor,
            end: otherExt?.darkLabelColor,
          ).lerp(t) ??
          darkLabelColor,
      lightIconTheme: lightIconTheme.lerp(otherExt?.lightIconTheme, t),
      darkIconTheme: darkIconTheme.lerp(otherExt?.darkIconTheme, t),
      borderColor: ColorTween(
            begin: borderColor,
            end: otherExt?.borderColor,
          ).lerp(t) ??
          borderColor,
      pixelSize: IntTween(
        begin: pixelSize ?? 1,
        end: otherExt?.pixelSize ?? 1,
      ).lerp(t),
      painter: otherExt?.painter ?? painter,
    );
  }
}

/// {@template nes_icon_theme}
/// Class with information regarding [NesIcon] inside Flutter Nes.
/// {@endtemplate}
class NesIconTheme extends ThemeExtension<NesIconTheme> {
  /// {@macro nes_icon_theme}
  const NesIconTheme({
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.shadow,
    this.size = 32,
  });

  /// The size of the icon.
  final double size;

  /// Primary color of the icon palette.
  final Color primary;

  /// Secondary color of the icon palette.
  final Color secondary;

  /// Accent color of the icon palette (Only used in [NesIcons16]).
  final Color accent;

  /// Shadow color of the icon palette (Only used in [NesIcons16]).
  final Color shadow;

  @override
  NesIconTheme copyWith({
    double? size,
    Color? primary,
    Color? secondary,
    Color? accent,
    Color? shadow,
  }) {
    return NesIconTheme(
      size: size ?? this.size,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      accent: accent ?? this.accent,
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  NesIconTheme lerp(ThemeExtension<NesIconTheme>? other, double t) {
    final otherExt = other as NesIconTheme?;
    return NesIconTheme(
      size: Tween<double>(
        begin: size,
        end: otherExt?.size ?? size,
      ).transform(t),
      primary: ColorTween(
            begin: primary,
            end: otherExt?.primary,
          ).lerp(t) ??
          primary,
      secondary: ColorTween(
            begin: secondary,
            end: otherExt?.secondary,
          ).lerp(t) ??
          secondary,
      accent: ColorTween(
            begin: accent,
            end: otherExt?.accent,
          ).lerp(t) ??
          accent,
      shadow: ColorTween(
            begin: shadow,
            end: otherExt?.shadow,
          ).lerp(t) ??
          shadow,
    );
  }
}

/// {@template nes_overlay_transition_theme}
/// Class with information regarding overlay transitions.
/// {@endtemplate}
class NesOverlayTransitionTheme
    extends ThemeExtension<NesOverlayTransitionTheme> {
  /// {@macro nes_overlay_transition_theme}
  const NesOverlayTransitionTheme({
    required this.color,
  });

  /// Color of the overlay.
  final Color color;

  @override
  NesOverlayTransitionTheme copyWith({
    Color? color,
  }) {
    return NesOverlayTransitionTheme(
      color: color ?? this.color,
    );
  }

  @override
  NesOverlayTransitionTheme lerp(
    ThemeExtension<NesOverlayTransitionTheme>? other,
    double t,
  ) {
    final otherExt = other as NesOverlayTransitionTheme?;
    return NesOverlayTransitionTheme(
      color: ColorTween(
            begin: color,
            end: otherExt?.color,
          ).lerp(t) ??
          color,
    );
  }
}

/// {@template nes_progress_bar_theme}
/// Class with information regarding [NesProgressBar] inside NesUI.
/// {@endtemplate}
class NesProgressBarTheme extends ThemeExtension<NesProgressBarTheme> {
  /// {@macro nes_progress_bar_theme}
  const NesProgressBarTheme({
    required this.background,
    required this.color,
  });

  /// The color for the progress bar background.
  /// Defaults to [TextTheme.bodyMedium]
  final Color background;

  /// The color for the progress bar progress.
  /// Defaults to [ColorScheme.primary]
  final Color color;

  @override
  NesProgressBarTheme copyWith({
    Color? background,
    Color? color,
  }) {
    return NesProgressBarTheme(
      background: background ?? this.background,
      color: color ?? this.color,
    );
  }

  @override
  ThemeExtension<NesProgressBarTheme> lerp(
    ThemeExtension<NesProgressBarTheme>? other,
    double t,
  ) {
    final otherExt = other as NesProgressBarTheme?;

    return NesProgressBarTheme(
      background: ColorTween(
            begin: background,
            end: otherExt?.background,
          ).lerp(t) ??
          background,
      color: ColorTween(
            begin: color,
            end: otherExt?.color,
          ).lerp(t) ??
          color,
    );
  }
}

/// {@template nes_selection_list_them}
/// Class with information regarding Selection Lists.
/// {@endtemplate}
class NesSelectionListTheme extends ThemeExtension<NesSelectionListTheme> {
  /// {@macro nes_selection_list_theme}
  const NesSelectionListTheme({
    required this.markerSize,
    required this.itemMinHeight,
  });

  /// The size of marker widget.
  final Size markerSize;

  /// The min height of the line of each item.
  final double itemMinHeight;

  @override
  ThemeExtension<NesSelectionListTheme> lerp(
    ThemeExtension<NesSelectionListTheme>? other,
    double t,
  ) {
    final otherExt = other as NesSelectionListTheme?;
    return NesSelectionListTheme(
      markerSize: SizeTween(
            begin: markerSize,
            end: otherExt?.markerSize,
          ).lerp(t) ??
          markerSize,
      itemMinHeight: Tween<double>(
        begin: itemMinHeight,
        end: otherExt?.itemMinHeight ?? itemMinHeight,
      ).transform(t),
    );
  }

  @override
  ThemeExtension<NesSelectionListTheme> copyWith({
    Size? markerSize,
    double? itemMinHeight,
  }) {
    return NesSelectionListTheme(
      markerSize: markerSize ?? this.markerSize,
      itemMinHeight: itemMinHeight ?? this.itemMinHeight,
    );
  }
}

/// {@template nes_snack_bar_theme}
/// Class with information regarding [NesSnackbar] inside Flutter Nes.
/// {@endtemplate}
class NesSnackbarTheme extends ThemeExtension<NesSnackbarTheme> {
  /// {@macro nes_snack_bar_theme}
  const NesSnackbarTheme({
    required this.normal,
    required this.success,
    required this.warning,
    required this.error,
  });

  /// The color for the normal type of the snackbar.
  final Color normal;

  /// The color for the success type of the snackbar.
  final Color success;

  /// The color for the warning type of the snackbar.
  final Color warning;

  /// The color for the error type of the snackbar.
  final Color error;

  @override
  NesSnackbarTheme copyWith({
    Color? normal,
    Color? success,
    Color? warning,
    Color? error,
  }) {
    return NesSnackbarTheme(
      normal: normal ?? this.normal,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
    );
  }

  @override
  ThemeExtension<NesSnackbarTheme> lerp(
    ThemeExtension<NesSnackbarTheme>? other,
    double t,
  ) {
    final otherExt = other as NesSnackbarTheme?;

    return NesSnackbarTheme(
      normal: ColorTween(
            begin: normal,
            end: otherExt?.normal,
          ).lerp(t) ??
          normal,
      success: ColorTween(
            begin: success,
            end: otherExt?.success,
          ).lerp(t) ??
          success,
      warning: ColorTween(
            begin: warning,
            end: otherExt?.warning,
          ).lerp(t) ??
          warning,
      error: ColorTween(
            begin: error,
            end: otherExt?.error,
          ).lerp(t) ??
          error,
    );
  }
}

/// {@template nes_tooltip_theme}
/// Class with information regarding [NesTooltip] inside NesUI.
/// {@endtemplate}
class NesTooltipTheme extends ThemeExtension<NesTooltipTheme> {
  /// {@macro nes_tooltip_theme}
  const NesTooltipTheme({
    required this.background,
    required this.textColor,
  });

  /// The color for the tooltip background.
  /// Defaults to [TextTheme.bodyMedium].
  final Color background;

  /// The color for the text message.
  /// Defaults to [ColorScheme.surface].
  final Color textColor;

  @override
  NesTooltipTheme copyWith({
    Color? background,
    Color? textColor,
  }) {
    return NesTooltipTheme(
      background: background ?? this.background,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  ThemeExtension<NesTooltipTheme> lerp(
    ThemeExtension<NesTooltipTheme>? other,
    double t,
  ) {
    final otherExt = other as NesTooltipTheme?;

    return NesTooltipTheme(
      background: ColorTween(
            begin: background,
            end: otherExt?.background,
          ).lerp(t) ??
          background,
      textColor: ColorTween(
            begin: textColor,
            end: otherExt?.textColor,
          ).lerp(t) ??
          textColor,
    );
  }
}

/// {@template nes_container_theme}
/// Class with information regarding [NesContainer] inside NesUI.
///
/// A [NesContainerTheme] is an optional custom theme for NesUI containers,
/// by default, [flutterNesTheme] will create a [NesContainerTheme] where:
///
///  - [backgroundColor] is [ThemeData.cardColor]
///  - [borderColor] is [ThemeData.textTheme.labelMedium.color]
///  - [labelTextStyle] is [ThemeData.textTheme].labelMedium
///
/// {@endtemplate}
class NesContainerTheme extends ThemeExtension<NesContainerTheme> {
  /// {@macro nes_container_theme}
  const NesContainerTheme({
    required this.backgroundColor,
    required this.borderColor,
    required this.labelTextStyle,
    this.padding = const EdgeInsets.all(32),
    this.pixelSize,
    this.painter = NesContainerRoundedBorderPainter.new,
  });

  /// The background color of the container.
  final Color backgroundColor;

  /// The border color of the container.
  final Color borderColor;

  /// The text style of the label.
  final TextStyle labelTextStyle;

  /// The padding of the containers, defaults to 32 in all directions.
  final EdgeInsets padding;

  /// The pixel size of the container. When omitted, defaults to
  /// [NesTheme.pixelSize].
  final int? pixelSize;

  /// The builder function that creates the painter used to draw the container.
  ///
  /// Defaults to [NesContainerRoundedBorderPainter.new].
  final NesContainerPainterBuilder painter;

  @override
  ThemeExtension<NesContainerTheme> copyWith({
    Color? backgroundColor,
    Color? borderColor,
    TextStyle? labelTextStyle,
    EdgeInsets? padding,
    int? pixelSize,
    NesContainerPainterBuilder? painter,
  }) {
    return NesContainerTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
      padding: padding ?? this.padding,
      pixelSize: pixelSize ?? this.pixelSize,
      painter: painter ?? this.painter,
    );
  }

  @override
  ThemeExtension<NesContainerTheme> lerp(
    covariant ThemeExtension<NesContainerTheme>? other,
    double t,
  ) {
    final otherExt = other as NesContainerTheme?;

    return NesContainerTheme(
      backgroundColor: ColorTween(
            begin: backgroundColor,
            end: otherExt?.backgroundColor,
          ).lerp(t) ??
          backgroundColor,
      borderColor: ColorTween(
            begin: borderColor,
            end: otherExt?.borderColor,
          ).lerp(t) ??
          borderColor,
      labelTextStyle: TextStyleTween(
        begin: labelTextStyle,
        end: otherExt?.labelTextStyle,
      ).lerp(t),
      padding: EdgeInsetsTween(
        begin: padding,
        end: otherExt?.padding,
      ).lerp(t),
      pixelSize: IntTween(
        begin: pixelSize ?? 1,
        end: otherExt?.pixelSize ?? 1,
      ).lerp(t),
    );
  }
}

/// {@template nes_bottom_sheet_theme}
/// Class with information regarding [NesBottomSheet] inside NesUI.
///
/// A [NesBottomSheetTheme] is an optional custom theme for NesUI bottom sheets,
/// by default, [flutterNesTheme] will create a [NesBottomSheetTheme] where
/// [backgroundColor] will default to [ThemeData.cardColor]
///
/// {@endtemplate}
class NesBottomSheetTheme extends ThemeExtension<NesBottomSheetTheme> {
  /// {@macro nes_container_theme}
  const NesBottomSheetTheme({
    required this.backgroundColor,
    required this.borderColor,
    this.padding = const EdgeInsets.all(32),
    this.pixelSize,
    this.painter = NesBottomSheetRoundedBorderPainter.new,
  });

  /// The background color of the container.
  final Color backgroundColor;

  /// The border color of the container.
  final Color borderColor;

  /// The padding of the containers, defaults to 32 in all directions.
  final EdgeInsets padding;

  /// The pixel size of the container. When omitted, defaults to
  /// [NesTheme.pixelSize].
  final int? pixelSize;

  /// The builder function that creates the painter used to draw the container.
  ///
  /// Defaults to [NesContainerRoundedBorderPainter.new].
  final NesBottomSheetPainterBuilder painter;

  @override
  ThemeExtension<NesBottomSheetTheme> copyWith({
    Color? backgroundColor,
    Color? borderColor,
    EdgeInsets? padding,
    int? pixelSize,
    NesBottomSheetPainterBuilder? painter,
  }) {
    return NesBottomSheetTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      padding: padding ?? this.padding,
      pixelSize: pixelSize ?? this.pixelSize,
      painter: painter ?? this.painter,
    );
  }

  @override
  ThemeExtension<NesBottomSheetTheme> lerp(
    covariant ThemeExtension<NesBottomSheetTheme>? other,
    double t,
  ) {
    final otherExt = other as NesBottomSheetTheme?;

    return NesBottomSheetTheme(
      backgroundColor: ColorTween(
            begin: backgroundColor,
            end: otherExt?.backgroundColor,
          ).lerp(t) ??
          backgroundColor,
      borderColor: ColorTween(
            begin: borderColor,
            end: otherExt?.borderColor,
          ).lerp(t) ??
          borderColor,
      padding: EdgeInsetsTween(
        begin: padding,
        end: otherExt?.padding,
      ).lerp(t),
      pixelSize: IntTween(
        begin: pixelSize ?? 1,
        end: otherExt?.pixelSize ?? 1,
      ).lerp(t),
    );
  }
}

/// {@template nes_input_decoration_theme}
/// Class with information regarding input decoration inside NesUI.
/// {@endtemplate}
class NesInputDecorationTheme {
  /// {@macro nes_input_decoration_theme}
  const NesInputDecorationTheme({
    this.labelStyle,
    this.borderColor,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.focusedErrorBorderColor,
  });

  /// The style of the label.
  final TextStyle? labelStyle;

  /// The color of the border, when omitted, fallbacks to the
  /// [TextTheme.bodyMedium] color.
  final Color? borderColor;

  /// The color of the border when enabled, when omitted, fallbacks to the
  /// [TextTheme.bodyMedium] color.
  final Color? enabledBorderColor;

  /// The color of the border when focused, when omitted, fallbacks to the
  /// [ColorScheme.primary] color.
  final Color? focusedBorderColor;

  /// The color of the border when an error is present, when omitted, fallbacks
  /// to the [ColorScheme.error] color.
  final Color? errorBorderColor;

  /// The color of the border when focused and an error is present, when omitted
  /// ,fallbacks to the [ColorScheme.error] color.
  final Color? focusedErrorBorderColor;
}

/// {@template nes_link_theme}
/// Class with information regarding [NesLink] inside NesUI.
/// {@endtemplate}
class NesLinkTheme extends ThemeExtension<NesLinkTheme> {
  /// {@macro nes_link_theme}
  const NesLinkTheme({
    required this.linkColor,
    required this.disabledColor,
  });

  /// The text color of the link.
  ///
  /// fallbacks to the [NesButtonTheme.primary] color.
  final Color linkColor;

  /// The text color of the link when disabled.
  ///
  /// fallbacks to the [TextTheme.bodyMedium] color, with alpha at .4.
  final Color disabledColor;

  @override
  ThemeExtension<NesLinkTheme> copyWith({
    Color? linkColor,
    Color? disabledColor,
  }) {
    return NesLinkTheme(
      linkColor: linkColor ?? this.linkColor,
      disabledColor: disabledColor ?? this.disabledColor,
    );
  }

  @override
  ThemeExtension<NesLinkTheme> lerp(
    covariant ThemeExtension<NesLinkTheme>? other,
    double t,
  ) {
    final otherExt = other as NesLinkTheme?;

    return NesLinkTheme(
      linkColor: ColorTween(
            begin: linkColor,
            end: otherExt?.linkColor,
          ).lerp(t) ??
          linkColor,
      disabledColor: ColorTween(
            begin: disabledColor,
            end: otherExt?.disabledColor,
          ).lerp(t) ??
          disabledColor,
    );
  }
}

/// {@template nes_running_text_theme}
/// Class with information regarding [NesRunningText] inside NesUI.
/// {@endtemplate}
class NesRunningTextTheme extends ThemeExtension<NesRunningTextTheme> {
  /// {@macro nes_running_text_theme}
  const NesRunningTextTheme({
    required this.speed,
  });

  /// The speed of the text, in seconds.
  final double speed;

  @override
  NesRunningTextTheme copyWith({
    double? speed,
  }) {
    return NesRunningTextTheme(
      speed: speed ?? this.speed,
    );
  }

  @override
  ThemeExtension<NesRunningTextTheme> lerp(
    ThemeExtension<NesRunningTextTheme>? other,
    double t,
  ) {
    final otherExt = other as NesRunningTextTheme?;

    return NesRunningTextTheme(
      speed: Tween<double>(
        begin: speed,
        end: otherExt?.speed ?? speed,
      ).transform(t),
    );
  }
}

/// Helper methods on [BuildContext] for the Flutter Nes.
extension NesBuildContext on BuildContext {
  /// Returns the extension of type [T] from the context.
  ///
  /// Throws Exception if none is found.
  T nesThemeExtension<T>() {
    final theme = Theme.of(this);

    final ext = theme.extension<T>();

    if (ext == null) {
      throw Exception(
        'Cannot find extension $T on theme. Make sure to create a Flutter Nes '
        'theme using flutterNesTheme method. ',
      );
    }

    return ext;
  }
}

/// Creates a Flutter Nes [ThemeData].
ThemeData flutterNesTheme({
  Color primaryColor = const Color(0xffb4b6f6),
  Brightness brightness = Brightness.light,
  NesTheme nesTheme = const NesTheme(pixelSize: 4),
  NesButtonTheme nesButtonTheme = const NesButtonTheme(
    normal: Color(0xffffffff),
    primary: Color(0xff209cee),
    success: Color(0xff92cc41),
    warning: Color(0xfff7d51d),
    error: Color(0xffe76e55),
    lightLabelColor: Color(0xffffffff),
    darkLabelColor: Color(0xff000000),
    lightIconTheme: NesIconTheme(
      primary: Color(0xffffffff),
      secondary: Color(0xff000000),
      accent: Color(0xff9badb7),
      shadow: Color(0xff696a6a),
    ),
    darkIconTheme: NesIconTheme(
      primary: Color(0xff000000),
      secondary: Color(0xffffffff),
      accent: Color(0xff696a6a),
      shadow: Color(0xff9badb7),
    ),
  ),
  NesIconTheme? nesIconTheme,
  NesSelectionListTheme nesSelectionListTheme = const NesSelectionListTheme(
    markerSize: Size(24, 24),
    itemMinHeight: 32,
  ),
  NesProgressBarTheme? nesProgressBarTheme,
  NesOverlayTransitionTheme? nesOverlayTransitionTheme,
  NesSnackbarTheme nesSnackbarTheme = const NesSnackbarTheme(
    normal: Color(0xffffffff),
    success: Color(0xff92cc41),
    warning: Color(0xfff7d51d),
    error: Color(0xffe76e55),
  ),
  NesTooltipTheme? nesTooltipTheme,
  NesContainerTheme? nesContainerTheme,
  NesBottomSheetTheme? nesBottomSheetTheme,
  NesInputDecorationTheme? nesInputDecorationTheme,
  NesLinkTheme? nesLinkTheme,
  NesRunningTextTheme nesRunningTextTheme = const NesRunningTextTheme(
    speed: .08,
  ),
  Iterable<ThemeExtension<dynamic>> customExtensions = const [],
}) {
  final iconTheme = nesIconTheme ??
      (brightness == Brightness.light
          ? const NesIconTheme(
              primary: Color(0xff000000),
              secondary: Color(0xffffffff),
              accent: Color(0xff9badb7),
              shadow: Color(0xff696a6a),
            )
          : const NesIconTheme(
              primary: Color(0xff808080),
              secondary: Color(0xffe5e5e5),
              accent: Color(0xff696a6a),
              shadow: Color(0xff9badb7),
            ));

  final overlayTransitionTheme = nesOverlayTransitionTheme ??
      (brightness == Brightness.light
          ? const NesOverlayTransitionTheme(color: Color(0xff0d0d0d))
          : const NesOverlayTransitionTheme(color: Color(0xff8c8c8c)));

  final themeData = ThemeData(
    brightness: brightness,
    colorSchemeSeed: primaryColor,
  );

  final textTheme = GoogleFonts.pressStart2pTextTheme(
    themeData.textTheme,
  );

  final progressBarTheme = nesProgressBarTheme ??
      NesProgressBarTheme(
        background: textTheme.bodyMedium?.color ?? Colors.black,
        color: themeData.colorScheme.primary,
      );

  final toolTipTheme = nesTooltipTheme ??
      NesTooltipTheme(
        background: textTheme.bodyMedium?.color ?? Colors.black,
        textColor: themeData.colorScheme.surface,
      );

  final containerTheme = nesContainerTheme ??
      NesContainerTheme(
        backgroundColor: themeData.cardColor,
        borderColor: textTheme.labelMedium?.color ?? Colors.black,
        labelTextStyle: textTheme.labelMedium ?? const TextStyle(),
      );

  final bottomSheetTheme = nesBottomSheetTheme ??
      NesBottomSheetTheme(
        backgroundColor: themeData.cardColor,
        borderColor: textTheme.labelMedium?.color ?? Colors.black,
      );

  final linkTheme = nesLinkTheme ??
      NesLinkTheme(
        linkColor: nesButtonTheme.primary,
        disabledColor: textTheme.bodyMedium?.color?.withValues(alpha: .4) ??
            Colors.black.withAlpha(150),
      );

  return themeData.copyWith(
    textTheme: textTheme,
    extensions: [
      nesTheme,
      nesButtonTheme,
      iconTheme,
      nesSelectionListTheme,
      progressBarTheme,
      overlayTransitionTheme,
      nesSnackbarTheme,
      toolTipTheme,
      containerTheme,
      bottomSheetTheme,
      linkTheme,
      nesRunningTextTheme,
      ...customExtensions,
    ],
    dividerTheme: DividerThemeData(
      thickness: nesTheme.pixelSize.toDouble(),
      color: textTheme.bodyMedium?.color,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: nesInputDecorationTheme?.labelStyle,
      border: NesInputBorder(
        borderSide: BorderSide(
          color: nesInputDecorationTheme?.borderColor ??
              textTheme.bodyMedium?.color ??
              Colors.black,
          width: nesTheme.pixelSize.toDouble(),
        ),
      ),
      enabledBorder: NesInputBorder(
        borderSide: BorderSide(
          color: nesInputDecorationTheme?.enabledBorderColor ??
              textTheme.bodyMedium?.color ??
              Colors.black,
          width: nesTheme.pixelSize.toDouble(),
        ),
      ),
      focusedBorder: NesInputBorder(
        borderSide: BorderSide(
          width: nesTheme.pixelSize.toDouble(),
          color: nesInputDecorationTheme?.focusedBorderColor ??
              themeData.colorScheme.primary,
        ),
      ),
      errorBorder: NesInputBorder(
        borderSide: BorderSide(
          width: nesTheme.pixelSize.toDouble(),
          color: nesInputDecorationTheme?.errorBorderColor ??
              themeData.colorScheme.error,
        ),
      ),
      focusedErrorBorder: NesInputBorder(
        borderSide: BorderSide(
          width: nesTheme.pixelSize.toDouble(),
          color: nesInputDecorationTheme?.focusedErrorBorderColor ??
              themeData.colorScheme.error,
        ),
      ),
    ),
  );
}
