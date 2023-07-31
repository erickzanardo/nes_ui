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
  });

  /// The size of a pixel unit used in Flutter nes, like the width
  /// of a border of a button.
  final int pixelSize;

  @override
  NesTheme copyWith({int? pixelSize}) {
    return NesTheme(
      pixelSize: pixelSize ?? this.pixelSize,
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
    );
  }
}

/// {@template nes_button_theme}
/// Class with information regarding buttons inside Flutter Nes.
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
    this.borderColor,
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

  /// The color of the button border. When null, fallbacks
  /// to the [TextTheme.labelMedium] color.
  final Color? borderColor;

  @override
  NesButtonTheme copyWith({
    Color? normal,
    Color? primary,
    Color? success,
    Color? warning,
    Color? error,
    Color? lightLabelColor,
    Color? darkLabelColor,
    Color? borderColor,
  }) {
    return NesButtonTheme(
      normal: normal ?? this.normal,
      primary: primary ?? this.primary,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      lightLabelColor: lightLabelColor ?? this.lightLabelColor,
      darkLabelColor: darkLabelColor ?? this.darkLabelColor,
      borderColor: borderColor ?? this.borderColor,
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
      borderColor: ColorTween(
            begin: borderColor,
            end: otherExt?.borderColor,
          ).lerp(t) ??
          borderColor,
    );
  }
}

/// {@template nes_icon_theme}
/// Class with information regarding icons inside Flutter Nes.
/// {@endtemplate}
class NesIconTheme extends ThemeExtension<NesIconTheme> {
  /// {@macro nes_icon_theme}
  const NesIconTheme({
    required this.primary,
    required this.secondary,
  });

  /// Primary color of the icon palette.
  final Color primary;

  /// Secondary color of the icon palette.
  final Color secondary;

  @override
  NesIconTheme copyWith({
    Color? primary,
    Color? secondary,
  }) {
    return NesIconTheme(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
    );
  }

  @override
  NesIconTheme lerp(ThemeExtension<NesIconTheme>? other, double t) {
    final otherExt = other as NesIconTheme?;
    return NesIconTheme(
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

/// {@template nes_button_theme}
/// Class with information regarding buttons inside Flutter Nes.
/// {@endtemplate}
class NesSnackbarTheme extends ThemeExtension<NesSnackbarTheme> {
  /// {@macro nes_button_theme}
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
/// Class with information regarding tooltips inside NesUI.
/// {@endtemplate}
class NesTooltipTheme extends ThemeExtension<NesTooltipTheme> {
  /// {@macro nes_tooltip_theme}
  const NesTooltipTheme({
    required this.background,
    required this.textColor,
  });

  /// The color for the tooltip background.
  /// Defaults to TextTheme.bodyMedium.
  final Color background;

  /// The color for the text message.
  /// Defaults to  Theme.background.
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
/// Class with information regarding containers inside NesUI.
///
/// A [NesContainerTheme] is an optional custom theme for NesUI containers,
/// by default, [flutterNesTheme] will create a [NesContainerTheme] where:
///
///  - [backgroundColor] is [ThemeData.cardColor]
///  - [borderColor] is [ThemeData.textTheme.labelMedium.color]
///  - [labelTextStyle] is [ThemeData.textTheme.labelMedium]
///
/// {@endtemplate}
class NesContainerTheme extends ThemeExtension<NesContainerTheme> {
  /// {@macro nes_container_theme}
  const NesContainerTheme({
    required this.backgroundColor,
    required this.borderColor,
    required this.labelTextStyle,
  });

  /// The background color of the container.
  final Color backgroundColor;

  /// The border color of the container.
  final Color borderColor;

  /// The text style of the label.
  final TextStyle labelTextStyle;

  @override
  ThemeExtension<NesContainerTheme> copyWith({
    Color? backgroundColor,
    Color? borderColor,
    TextStyle? labelTextStyle,
  }) {
    return NesContainerTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      labelTextStyle: labelTextStyle ?? this.labelTextStyle,
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
  ),
  NesIconTheme? nesIconTheme,
  NesSelectionListTheme nesSelectionListTheme = const NesSelectionListTheme(
    markerSize: Size(24, 24),
    itemMinHeight: 32,
  ),
  NesOverlayTransitionTheme? nesOverlayTransitionTheme,
  NesSnackbarTheme nesSnackbarTheme = const NesSnackbarTheme(
    normal: Color(0xffffffff),
    success: Color(0xff92cc41),
    warning: Color(0xfff7d51d),
    error: Color(0xffe76e55),
  ),
  NesTooltipTheme? nesTooltipTheme,
  NesContainerTheme? nesContainerTheme,
  Iterable<ThemeExtension<dynamic>> customExtensions = const [],
}) {
  final iconTheme = nesIconTheme ??
      (brightness == Brightness.light
          ? const NesIconTheme(
              primary: Color(0xff000000),
              secondary: Color(0xffffffff),
            )
          : const NesIconTheme(
              primary: Color(0xff808080),
              secondary: Color(0xffe5e5e5),
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

  final toolTipTheme = nesTooltipTheme ??
      NesTooltipTheme(
        background: textTheme.bodyMedium?.color ?? Colors.black,
        textColor: themeData.colorScheme.background,
      );

  final containerTheme = nesContainerTheme ??
      NesContainerTheme(
        backgroundColor: themeData.cardColor,
        borderColor: textTheme.labelMedium?.color ?? Colors.black,
        labelTextStyle: textTheme.labelMedium ?? const TextStyle(),
      );

  return themeData.copyWith(
    textTheme: textTheme,
    extensions: [
      nesTheme,
      nesButtonTheme,
      iconTheme,
      nesSelectionListTheme,
      overlayTransitionTheme,
      nesSnackbarTheme,
      toolTipTheme,
      containerTheme,
      ...customExtensions,
    ],
    dividerTheme: DividerThemeData(
      thickness: nesTheme.pixelSize.toDouble(),
      color: textTheme.bodyMedium?.color,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: NesInputBorder(
        borderSide: BorderSide(
          color: textTheme.bodyMedium?.color ?? Colors.black,
          width: nesTheme.pixelSize.toDouble(),
        ),
      ),
      enabledBorder: NesInputBorder(
        borderSide: BorderSide(
          color: textTheme.bodyMedium?.color ?? Colors.black,
          width: nesTheme.pixelSize.toDouble(),
        ),
      ),
      focusedBorder: NesInputBorder(
        borderSide: BorderSide(
          width: nesTheme.pixelSize.toDouble(),
          color: themeData.colorScheme.primary,
        ),
      ),
      errorBorder: NesInputBorder(
        borderSide: BorderSide(
          width: nesTheme.pixelSize.toDouble(),
          color: themeData.colorScheme.error,
        ),
      ),
      focusedErrorBorder: NesInputBorder(
        borderSide: BorderSide(
          width: nesTheme.pixelSize.toDouble(),
          color: themeData.colorScheme.error,
        ),
      ),
    ),
  );
}
