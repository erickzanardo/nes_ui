import 'package:flutter/material.dart';
import 'package:flutter_nes/flutter_nes.dart';
import 'package:google_fonts/google_fonts.dart';

/// {@template nes_theme}
/// Class with general theme information for Flutter Nes.
/// {@endtemplate}
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
  NesTheme lerp(NesTheme? other, double t) {
    return NesTheme(
      pixelSize: IntTween(
        begin: pixelSize,
        end: other?.pixelSize ?? pixelSize,
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

  @override
  NesButtonTheme copyWith({
    Color? normal,
    Color? primary,
    Color? success,
    Color? warning,
    Color? error,
    Color? lightLabelColor,
    Color? darkLabelColor,
  }) {
    return NesButtonTheme(
      normal: normal ?? this.normal,
      primary: primary ?? this.primary,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      lightLabelColor: lightLabelColor ?? this.lightLabelColor,
      darkLabelColor: darkLabelColor ?? this.darkLabelColor,
    );
  }

  @override
  NesButtonTheme lerp(NesButtonTheme? other, double t) {
    return NesButtonTheme(
      normal: ColorTween(
            begin: normal,
            end: other?.normal,
          ).lerp(t) ??
          normal,
      primary: ColorTween(
            begin: primary,
            end: other?.primary,
          ).lerp(t) ??
          primary,
      success: ColorTween(
            begin: success,
            end: other?.success,
          ).lerp(t) ??
          success,
      warning: ColorTween(
            begin: warning,
            end: other?.warning,
          ).lerp(t) ??
          warning,
      error: ColorTween(
            begin: error,
            end: other?.error,
          ).lerp(t) ??
          error,
      lightLabelColor: ColorTween(
            begin: lightLabelColor,
            end: other?.lightLabelColor,
          ).lerp(t) ??
          lightLabelColor,
      darkLabelColor: ColorTween(
            begin: darkLabelColor,
            end: other?.darkLabelColor,
          ).lerp(t) ??
          darkLabelColor,
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
  NesIconTheme lerp(NesIconTheme? other, double t) {
    return NesIconTheme(
      primary: ColorTween(
            begin: primary,
            end: other?.primary,
          ).lerp(t) ??
          primary,
      secondary: ColorTween(
            begin: secondary,
            end: other?.secondary,
          ).lerp(t) ??
          secondary,
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

  final themeData = ThemeData(
    brightness: brightness,
    colorSchemeSeed: primaryColor,
    extensions: [
      nesTheme,
      nesButtonTheme,
      iconTheme,
    ],
  );

  final textTheme = GoogleFonts.pressStart2pTextTheme(
    themeData.textTheme,
  );

  return themeData.copyWith(
    textTheme: textTheme,
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
