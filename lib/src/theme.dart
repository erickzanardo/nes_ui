import 'package:flutter/material.dart';
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
  Brightness brightness = Brightness.light,
  NesTheme nesTheme = const NesTheme(pixelSize: 2),
}) {
  return ThemeData(brightness: brightness).copyWith(
    textTheme: GoogleFonts.pressStart2pTextTheme(),
    extensions: [
      nesTheme,
    ],
  );
}
