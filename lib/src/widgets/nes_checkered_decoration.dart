import 'package:flutter/material.dart';

/// {@template nes_checkered_decoration}
/// A decoration that paints a checkered pattern.
/// {@endtemplate}
class NesCheckeredDecoration extends DecorationImage {
  /// {@macro nes_checkered_decoration}
  const NesCheckeredDecoration()
      : super(
          image: const AssetImage(
            'assets/checkered_pattern.png',
            package: 'nes_ui',
          ),
          repeat: ImageRepeat.repeat,
          filterQuality: FilterQuality.none,
          isAntiAlias: false,
        );
}
