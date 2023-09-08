// ignore_for_file: lines_longer_than_80_chars
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_mini_sprite/flutter_mini_sprite.dart';
import 'package:mini_sprite/mini_sprite.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@nes_icon_data}
/// Model class holding the data of for a [NesIcon].
/// {@endtemplate}
class NesIconData {
  /// {@macro nes_icon_data}
  NesIconData(this.sprite);

  /// Sprite.
  final MiniSprite sprite;
}

/// Built in library of icons for the Flutter Nes Design library.
class NesIcons {
  NesIcons._();

  /// Instance of [NesIcons].
  static final NesIcons instance = NesIcons._();

  /// A check icon.
  late final check = NesIconData(
    MiniSprite.fromDataString(
      '8,8;6,-1;2,0;5,-1;1,0;1,1;1,0;4,-1;1,0;2,1;3,0;1,-1;1,0;2,1;1,0;1,-1;1,0;1,1;1,0;2,1;1,0;2,-1;1,0;3,1;1,0;4,-1;1,0;1,1;1,0;6,-1;1,0;5,-1',
    ),
  );

  /// A close icon.
  late final close = NesIconData(
    MiniSprite.fromDataString(
      '8,8;1,-1;1,0;4,-1;1,0;1,-1;1,0;1,1;1,0;2,-1;1,0;1,1;1,0;1,-1;1,0;1,1;2,0;1,1;1,0;3,-1;1,0;2,1;1,0;4,-1;1,0;2,1;1,0;3,-1;1,0;1,1;2,0;1,1;1,0;1,-1;1,0;1,1;1,0;2,-1;1,0;1,1;1,0;1,-1;1,0;4,-1;1,0;1,-1',
    ),
  );

  /// A sword icon.
  late final sword = NesIconData(
    MiniSprite.fromDataString(
      '8,8;3,-1;1,0;3,-1;1,0;4,-1;1,0;1,-1;1,0;5,-1;2,0;5,-1;1,0;1,1;2,0;3,-1;1,0;1,1;1,0;2,-1;1,0;1,-1;1,0;1,1;1,0;4,-1;1,0;1,1;1,0;5,-1;2,0;6,-1',
    ),
  );

  /// A shield icon.
  late final shield = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,0;4,-1;3,0;1,1;7,0;2,1;6,0;2,1;6,0;2,1;6,0;2,1;5,0;1,-1;1,0;2,1;3,0;3,-1;4,0;2,-1',
    ),
  );

  /// An axe icon.
  late final axe = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;2,0;6,-1;1,0;1,1;1,0;4,-1;1,0;3,1;1,0;2,-1;1,0;1,1;1,0;1,1;2,0;3,-1;1,0;1,1;1,0;6,-1;1,0;1,1;1,0;6,-1;1,0;1,1;1,0;6,-1;1,0;3,-1',
    ),
  );

  /// An arrow icon.
  late final arrow = NesIconData(
    MiniSprite.fromDataString(
      '8,8;6,-1;1,0;1,1;5,-1;1,0;1,1;1,0;5,-1;2,0;5,-1;1,0;6,-1;1,0;4,-1;1,0;1,-1;1,0;5,-1;2,0;6,-1;3,0;5,-1',
    ),
  );

  /// A hand pointing right.
  late final handPointingRight = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;2,0;5,-1;1,0;2,1;5,0;6,1;2,0;2,1;6,0;4,1;1,0;2,-1;1,0;2,1;3,0;3,-1;1,0;3,1;1,0;4,-1;3,0;3,-1',
    ),
  );

  /// An arrow pointing left.
  late final leftArrowIndicator = NesIconData(
    MiniSprite.fromDataString(
      '8,8;3,-1;3,0;4,-1;4,0;3,-1;5,0;2,-1;6,0;2,-1;1,0;1,1;4,0;3,-1;1,0;1,1;3,0;4,-1;1,0;2,1;1,0;5,-1;3,0;2,-1',
    ),
  );

  /// An arrow pointing right.
  late final rightArrowIndicator = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;3,0;5,-1;4,0;4,-1;5,0;3,-1;6,0;2,-1;4,0;1,1;1,0;2,-1;3,0;1,1;1,0;3,-1;1,0;2,1;1,0;4,-1;3,0;3,-1',
    ),
  );

  /// An arrow pointing up.
  late final topArrowIndicator = NesIconData(
    MiniSprite.fromDataString(
      '8,8;3,-1;2,0;5,-1;1,0;1,1;2,0;3,-1;1,0;1,1;4,0;1,-1;1,0;1,1;7,0;1,1;14,0;16,-1',
    ),
  );

  /// An arrow pointing down.
  late final bottomArrowIndicator = NesIconData(
    MiniSprite.fromDataString(
      '8,8;16,-1;9,0;1,1;7,0;1,1;6,0;1,-1;1,0;1,1;4,0;3,-1;1,0;1,1;2,0;5,-1;2,0;3,-1',
    ),
  );

  /// A sun
  late final sun = NesIconData(
    MiniSprite.fromDataString(
      '8,8;1,0;2,-1;2,0;2,-1;1,0;2,-1;1,0;2,1;1,0;3,-1;1,0;4,1;1,0;1,-1;1,0;6,1;2,0;6,1;1,0;1,-1;1,0;4,1;1,0;3,-1;1,0;2,1;1,0;2,-1;1,0;2,-1;2,0;2,-1;1,0',
    ),
  );

  /// A moon
  late final moon = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;4,0;3,-1;1,0;2,1;1,0;3,-1;1,0;2,1;1,0;4,-1;1,0;2,1;1,0;2,-1;1,0;1,-1;1,0;3,1;2,0;1,1;2,0;6,1;1,0;1,-1;1,0;4,1;1,0;3,-1;4,0;2,-1',
    ),
  );

  /// A gallery
  late final gallery = NesIconData(
    MiniSprite.fromDataString(
      '8,8;9,0;1,1;1,0;4,1;3,0;1,1;1,0;3,1;2,0;1,1;1,0;4,1;2,0;4,1;1,0;1,1;2,0;1,1;1,0;1,1;20,0',
    ),
  );

  /// A gamepad
  late final gamepad = NesIconData(
    MiniSprite.fromDataString(
      '8,8;4,-1;1,0;6,-1;1,0;7,-1;1,0;5,-1;6,0;1,-1;1,0;1,1;1,0;4,1;3,0;1,1;1,0;2,1;3,0;1,1;1,0;2,1;1,0;1,1;9,0',
    ),
  );

  /// A delete icon.
  late final delete = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;4,0;2,-1;10,0;4,-1;2,0;1,-1;1,0;1,-1;2,0;1,-1;1,0;2,-1;1,0;1,-1;2,0;1,-1;1,0;2,-1;1,0;1,-1;2,0;1,-1;1,0;2,-1;1,0;4,-1;1,0;3,-1;4,0;2,-1',
    ),
  );

  /// An add icon.
  late final add = NesIconData(
    MiniSprite.fromDataString(
      '8,8;3,-1;2,0;6,-1;2,0;6,-1;2,0;3,-1;16,0;3,-1;2,0;6,-1;2,0;6,-1;2,0;3,-1',
    ),
  );

  /// A remove icon.
  late final remove = NesIconData(
    MiniSprite.fromDataString(
      '8,8;24,-1;16,0;24,-1',
    ),
  );

  /// A redo icon.
  late final redo = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;4,0;3,-1;1,0;4,-1;1,0;1,-1;1,0;6,-1;1,0;2,-1;1,0;4,-1;1,0;1,-1;1,0;1,-1;1,0;3,-1;2,0;1,-1;1,0;1,-1;1,0;2,-1;1,0;2,-1;1,0;3,-1;1,0;4,-1;3,0;2,-1',
    ),
  );

  /// An unpressed button icon.
  late final unpressedButton = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;4,0;3,-1;6,0;1,-1;25,0;1,1;4,0;1,1;1,0;1,-1;1,0;4,1;1,0;3,-1;4,0;2,-1',
    ),
  );

  /// A pressed button icon.
  late final pressedButton = NesIconData(
    MiniSprite.fromDataString(
      '8,8;10,-1;4,0;3,-1;6,0;1,-1;24,0;1,-1;6,0;3,-1;4,0;2,-1',
    ),
  );

  /// A closed folder.
  late final closedFolder = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;9,0;4,1;10,0;6,1;2,0;6,1;2,0;6,1;1,0;1,-1;1,0;5,1;1,0;1,-1;7,0',
    ),
  );

  /// An open folder.
  late final openFolder = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;6,0;2,-1;1,0;4,1;3,0;5,1;6,0;2,1;2,0;4,1;1,0;1,1;1,0;1,-1;1,0;4,1;2,0;1,-1;2,0;4,1;1,0;2,-1;6,0',
    ),
  );

  /// A thin arrow pointing left.
  late final thinArrowLeft = NesIconData(
    MiniSprite.fromDataString(
      '8,8;3,-1;1,0;6,-1;1,0;6,-1;2,0;5,-1;16,0;1,-1;2,0;7,-1;1,0;8,-1;1,0;4,-1',
    ),
  );

  /// A thin arrow pointing right.
  late final thinArrowRight = NesIconData(
    MiniSprite.fromDataString(
      '8,8;4,-1;1,0;8,-1;1,0;7,-1;2,0;1,-1;16,0;5,-1;2,0;6,-1;1,0;6,-1;1,0;3,-1',
    ),
  );

  /// A music note icon.
  late final musicNote = NesIconData(
    MiniSprite.fromDataString(
      '8,8;3,-1;4,0;4,-1;5,0;3,-1;2,0;2,-1;1,0;3,-1;2,0;4,-1;4,0;3,-1;5,0;3,-1;4,0;5,-1;2,0;5,-1',
    ),
  );

  /// A key hole.
  late final keyHole = NesIconData(
    MiniSprite.fromDataString(
      '8,8;3,-1;2,0;5,-1;4,0;4,-1;4,0;5,-1;2,0;5,-1;4,0;4,-1;4,0;3,-1;6,0;2,-1;6,0;1,-1',
    ),
  );

  /// A Question mark.
  late final questionMark = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;4,0;3,-1;2,0;2,-1;2,0;2,-1;1,0;3,-1;2,0;5,-1;2,0;5,-1;2,0;14,-1;2,0;6,-1;2,0;3,-1',
    ),
  );

  /// A dart lang icon.
  late final dartLang = NesIconData(
    MiniSprite.fromDataString(
      '8,8;10,0;3,-1;6,0;3,-1;6,0;3,-1;6,0;2,-1;7,0;1,-1;2,0;1,-1;13,0;1,-1',
    ),
  );

  /// A middle connection icon.
  late final middleConnection = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;1,0;7,-1;1,0;7,-1;1,0;7,-1;1,0;7,-1;6,0;2,-1;1,0;7,-1;1,0;7,-1;1,0;5,-1',
    ),
  );

  /// A bottom connection icon.
  late final bottomConnection = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;1,0;7,-1;1,0;7,-1;1,0;7,-1;1,0;7,-1;6,0;24,-1',
    ),
  );

  /// A top connection icon.
  late final topConnection = NesIconData(
    MiniSprite.fromDataString(
      '8,8;26,-1;6,0;2,-1;1,0;7,-1;1,0;7,-1;1,0;7,-1;1,0;5,-1',
    ),
  );

  /// Three vertical dots.
  late final threeVerticalDots = NesIconData(
    MiniSprite.fromDataString(
      '8,8;3,-1;2,0;6,-1;2,0;14,-1;2,0;6,-1;2,0;14,-1;2,0;6,-1;2,0;3,-1',
    ),
  );

  /// Three horizontal dots.
  late final threeHorizontalDots = NesIconData(
    MiniSprite.fromDataString(
      '8,8;24,-1;2,0;1,-1;2,0;1,-1;4,0;1,-1;2,0;1,-1;2,0;24,-1',
    ),
  );

  /// New file.
  late final newFile = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;4,0;3,-1;1,0;3,1;2,0;2,-1;1,0;3,1;3,0;1,-1;1,0;5,1;1,0;1,-1;1,0;5,1;1,0;1,-1;1,0;5,1;1,0;1,-1;1,0;5,1;1,0;1,-1;7,0',
    ),
  );

  /// Save file.
  late final saveFile = NesIconData(
    MiniSprite.fromDataString(
      '8,8;7,0;1,-1;2,0;2,1;1,0;1,1;4,0;4,1;11,0;6,1;2,0;6,1;2,0;6,1;9,0',
    ),
  );

  /// Open eye.
  late final openEye = NesIconData(
    MiniSprite.fromDataString(
      '8,8;10,-1;4,0;3,-1;1,0;4,1;1,0;1,-1;1,0;2,1;2,0;2,1;2,0;2,1;2,0;2,1;3,0;4,1;2,0;1,-1;6,0;3,-1;4,0;2,-1',
    ),
  );

  /// Closed eye.
  late final closedEye = NesIconData(
    MiniSprite.fromDataString(
      '8,8;10,-1;4,0;3,-1;6,0;1,-1;18,0;1,1;2,0;1,1;2,0;1,-1;6,0;3,-1;4,0;2,-1',
    ),
  );

  /// Window.
  late final window = NesIconData(
    MiniSprite.fromDataString(
      '8,8;10,0;1,1;1,0;1,1;1,0;1,1;10,0;6,1;2,0;6,1;2,0;6,1;2,0;6,1;9,0',
    ),
  );

  /// Text file.
  late final textFile = NesIconData(
    MiniSprite.fromDataString(
      '8,8;6,0;2,-1;7,0;1,-1;2,0;4,1;12,0;4,1;12,0;4,1;10,0',
    ),
  );

  /// Download file
  late final download = NesIconData(
    MiniSprite.fromDataString(
      '8,8;3,-1;2,0;6,-1;2,0;4,-1;1,0;1,-1;2,0;1,-1;1,0;2,-1;6,0;3,-1;4,0;5,-1;2,0;11,-1;8,0',
    ),
  );

  /// Zoom in
  late final zoomIn = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;3,0;4,-1;1,0;3,1;1,0;2,-1;1,0;2,1;1,0;2,1;1,0;1,-1;1,0;1,1;3,0;1,1;1,0;1,-1;1,0;2,1;1,0;2,1;1,0;2,-1;1,0;3,1;1,0;4,-1;3,0;1,-1;1,0;8,-1;1,0',
    ),
  );

  /// Zoom out
  late final zoomOut = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;3,0;4,-1;1,0;3,1;1,0;2,-1;1,0;5,1;1,0;1,-1;1,0;1,1;3,0;1,1;1,0;1,-1;1,0;5,1;1,0;2,-1;1,0;3,1;1,0;4,-1;3,0;1,-1;1,0;8,-1;1,0',
    ),
  );

  /// Yaml file
  late final yamlFile = NesIconData(
    MiniSprite.fromDataString(
      '8,8;6,0;2,-1;3,0;2,1;2,0;1,-1;3,0;2,1;6,0;2,1;6,0;2,1;14,0;2,1;11,0',
    ),
  );

  /// Xml file
  late final xmlFile = NesIconData(
    MiniSprite.fromDataString(
      '8,8;6,0;2,-1;7,0;1,-1;2,0;1,1;2,0;1,1;3,0;1,1;4,0;1,1;2,0;1,1;4,0;1,1;3,0;1,1;2,0;1,1;18,0',
    ),
  );

  /// Exclamation mark block
  late final exclamationMarkBlock = NesIconData(
    MiniSprite.fromDataString(
      '8,8;1,-1;6,0;1,-1;3,0;2,1;6,0;2,1;6,0;2,1;6,0;2,1;14,0;2,1;3,0;1,-1;6,0;1,-1',
    ),
  );

  /// Question mark block
  late final questionMarkBlock = NesIconData(
    MiniSprite.fromDataString(
      '8,8;1,-1;6,0;1,-1;2,0;4,1;4,0;1,1;2,0;1,1;6,0;2,1;5,0;2,1;14,0;2,1;3,0;1,-1;6,0;1,-1',
    ),
  );

  /// Left hand
  late final leftHand = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;3,0;4,-1;1,0;3,1;1,0;2,-1;1,0;4,1;1,0;2,-1;1,0;4,1;2,0;1,-1;1,0;4,1;1,0;1,1;2,0;5,1;1,0;2,-1;1,0;3,1;1,0;4,-1;3,0;3,-1',
    ),
  );

  /// Right hand
  late final rightHand = NesIconData(
    MiniSprite.fromDataString(
      '8,8;3,-1;3,0;4,-1;1,0;3,1;1,0;3,-1;1,0;4,1;1,0;1,-1;2,0;4,1;2,0;1,1;1,0;4,1;1,0;1,-1;1,0;5,1;1,0;2,-1;1,0;3,1;1,0;4,-1;3,0;2,-1',
    ),
  );

  /// Helm
  late final helm = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;4,0;3,-1;1,0;4,1;1,0;1,-1;1,0;6,1;2,0;1,1;4,0;1,1;2,0;2,1;2,0;2,1;2,0;2,1;2,0;2,1;3,0;4,1;2,0;1,-1;6,0;1,-1',
    ),
  );

  /// Upper Armor
  late final upperArmor = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;1,0;2,-1;1,0;3,-1;1,0;1,1;2,0;1,1;1,0;1,-1;1,0;6,1;1,0;1,-1;1,0;4,1;1,0;2,-1;1,0;4,1;1,0;2,-1;1,0;4,1;1,0;2,-1;1,0;4,1;1,0;3,-1;4,0;2,-1',
    ),
  );

  /// Lower Armor
  late final lowerArmor = NesIconData(
    MiniSprite.fromDataString(
      '8,8;7,0;1,-1;1,0;5,1;1,0;1,-1;1,0;5,1;1,0;1,-1;1,0;3,1;1,0;1,1;1,0;1,-1;1,0;2,1;1,0;2,1;1,0;1,-1;1,0;2,1;1,0;2,1;1,0;1,-1;1,0;2,1;1,0;2,1;1,0;2,-1;5,0;2,-1',
    ),
  );

  /// Exchange
  late final exchange = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;1,0;6,-1;3,0;4,-1;1,0;1,-1;1,0;1,-1;1,0;5,-1;1,0;10,-1;1,0;5,-1;1,0;1,-1;1,0;1,-1;1,0;4,-1;3,0;6,-1;1,0;2,-1',
    ),
  );

  /// Edit
  late final edit = NesIconData(
    MiniSprite.fromDataString(
      '8,8;5,-1;1,0;6,-1;3,0;4,-1;5,0;2,-1;5,0;2,-1;5,0;2,-1;1,0;1,-1;3,0;3,-1;2,0;1,-1;1,0;4,-1;3,0;5,-1',
    ),
  );

  /// Expand
  late final expand = NesIconData(
    MiniSprite.fromDataString(
      '8,8;3,0;2,-1;5,0;4,-1;3,0;1,-1;1,0;2,-1;1,0;1,-1;1,0;3,-1;2,0;6,-1;2,0;3,-1;1,0;1,-1;1,0;2,-1;1,0;1,-1;3,0;4,-1;5,0;2,-1;3,0',
    ),
  );

  /// Cut
  late final cut = NesIconData(
    MiniSprite.fromDataString(
      '8,8;1,0;6,-1;1,0;1,-1;1,0;4,-1;1,0;2,-1;2,0;2,-1;2,0;3,-1;4,0;5,-1;2,0;4,-1;2,0;2,-1;2,0;1,-1;1,0;1,-1;1,0;2,-1;1,0;1,-1;1,0;1,-1;1,0;4,-1;1,0;1,-1',
    ),
  );
}

/// {@template nes_icon}
/// Widget that renders icons from the Flutter Nes design library.
///
/// Check [NesIcons] for the library of built in icons.
/// {@endtemplate}
class NesIcon extends StatelessWidget {
  /// {@macro nes_icon}
  const NesIcon({
    super.key,
    required this.iconData,
    this.size,
    this.primaryColor,
    this.secondaryColor,
  });

  /// Data of this icon.
  final NesIconData iconData;

  /// An optional size for the icon.
  ///
  /// When ommited the icon will be in its "original"
  /// size concerning the current pixel size of the theme.
  final Size? size;

  /// Optional primary color for the icon.
  /// Will use value from the theme if none is provided.
  final Color? primaryColor;

  /// Optional secondary color for the icon.
  /// Will use value from the theme if none is provided.
  final Color? secondaryColor;

  @override
  Widget build(BuildContext context) {
    final nesTheme = context.nesThemeExtension<NesTheme>();
    final nesIconTheme = context.nesThemeExtension<NesIconTheme>();

    var pixelSize = nesTheme.pixelSize.toDouble();

    final customSize = size;
    if (customSize != null) {
      final spriteHorizontalUnits = iconData.sprite.pixels[0].length;
      final spriteVerticalUnits = iconData.sprite.pixels.length;

      final width = customSize.width / spriteHorizontalUnits;
      final height = customSize.height / spriteVerticalUnits;

      pixelSize = math.min(width, height).roundToDouble();
    }

    return MiniSpriteWidget(
      pixelSize: pixelSize,
      palette: [
        primaryColor ?? nesIconTheme.primary,
        secondaryColor ?? nesIconTheme.secondary,
      ],
      sprite: iconData.sprite,
    );
  }
}
