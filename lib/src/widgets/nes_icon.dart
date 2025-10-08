// ignore_for_file: lines_longer_than_80_chars
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_mini_sprite/flutter_mini_sprite.dart';
import 'package:mini_sprite/mini_sprite.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_icon_data}
/// Model class holding the data of for a [NesIcon].
/// {@endtemplate}
class NesIconData {
  /// {@macro nes_icon_data}
  NesIconData(this.sprite);

  /// Sprite.
  final MiniSprite sprite;
}

/// Built in library of icons for the Flutter Nes Design library.
// ignore: non_constant_identifier_names
final NesIcons = NesIconCollection._singleton();

/// This is the internal class that holds the data for [NesIcons].
/// Use [NesIcons] to access the icons.
class NesIconCollection {
  NesIconCollection._singleton();

  /// Instance of [NesIconCollection].
  @Deprecated('Instance is no longer needed. Use NesIcons directly.')
  late final NesIconCollection instance = NesIcons;

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

  /// Upload file
  late final upload = NesIconData(
    MiniSprite.fromDataString(
      '8,8;3,-1;2,0;5,-1;4,0;3,-1;6,0;2,-1;1,0;1,-1;2,0;1,-1;1,0;4,-1;2,0;6,-1;2,0;11,-1;8,0',
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

  /// Eraser
  late final eraser = NesIconData(
    MiniSprite.fromDataString(
      '8,8;4,-1;1,0;6,-1;3,0;4,-1;5,0;2,-1;1,0;1,-1;6,0;3,-1;3,0;2,-1;1,0;3,-1;1,0;4,-1;3,0;3,-1;8,0',
    ),
  );

  /// Copy
  late final copy = NesIconData(
    MiniSprite.fromDataString(
      '8,8;3,-1;4,0;4,-1;1,0;2,1;6,0;3,1;2,0;2,1;2,0;2,1;2,0;3,1;1,0;2,1;2,0;3,1;5,0;3,1;1,0;3,-1;5,0;3,-1',
    ),
  );

  /// Paste
  late final paste = NesIconData(
    MiniSprite.fromDataString(
      '8,8;3,-1;2,0;4,-1;6,0;1,-1;1,0;1,1;4,0;1,1;2,0;6,1;2,0;6,1;2,0;6,1;2,0;6,1;9,0',
    ),
  );

  /// Camera
  late final camera = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;2,0;5,-1;2,0;1,1;1,0;4,-1;1,0;1,1;2,0;3,-1;6,0;2,-1;22,0;4,-1;2,0;4,-1',
    ),
  );

  /// TV
  late final tv = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;1,0;1,-1;1,0;6,-1;1,0;4,-1;9,0;4,1;1,0;1,1;2,0;4,1;4,0;4,1;1,0;1,1;2,0;4,1;11,0',
    ),
  );

  /// Radio
  late final radio = NesIconData(
    MiniSprite.fromDataString(
      '8,8;6,-1;1,0;6,-1;1,0;2,-1;9,0;3,1;1,0;2,1;6,0;2,1;2,0;3,1;12,0;8,-1',
    ),
  );

  /// Hourglass with its top half full
  late final hourglassTopFull = NesIconData(
    MiniSprite.fromDataString(
      '8,8;9,0;1,-1;4,0;1,-1;1,0;1,-1;1,0;1,-1;2,0;1,-1;1,0;3,-1;4,0;4,-1;1,0;2,-1;1,0;3,-1;1,0;4,-1;1,0;1,-1;1,0;6,-1;9,0',
    ),
  );

  /// Hourglass with its content in the middle
  late final hourglassMiddle = NesIconData(
    MiniSprite.fromDataString(
      '8,8;9,0;6,-1;1,0;1,-1;2,0;2,-1;2,0;3,-1;4,0;4,-1;4,0;3,-1;1,0;1,-1;2,0;1,-1;1,0;1,-1;1,0;6,-1;9,0',
    ),
  );

  /// Hourglass with its bottom half full
  late final hourglassBottomFull = NesIconData(
    MiniSprite.fromDataString(
      '8,8;9,0;6,-1;1,0;1,-1;1,0;4,-1;1,0;3,-1;1,0;2,-1;1,0;4,-1;4,0;3,-1;1,0;1,-1;2,0;1,-1;1,0;1,-1;1,0;1,-1;4,0;1,-1;9,0',
    ),
  );

  /// Flag
  late final flag = NesIconData(
    MiniSprite.fromDataString(
      '8,8;3,-1;1,0;7,-1;2,0;6,-1;4,0;4,-1;5,0;3,-1;2,0;6,-1;1,0;7,-1;1,0;5,-1;5,0;2,-1',
    ),
  );

  /// Checked Flag
  late final checkedFlag = NesIconData(
    MiniSprite.fromDataString(
      '8,8;5,0;3,-1;1,0;1,1;1,0;1,1;6,0;1,1;2,0;1,1;3,0;1,1;1,0;1,1;2,0;1,1;3,0;1,1;2,0;1,1;3,0;1,1;1,0;1,1;2,0;1,1;6,0;1,1;2,0;4,-1;4,0',
    ),
  );

  /// Inifinite
  late final infinite = NesIconData(
    MiniSprite.fromDataString(
      '8,8;17,-1;2,0;2,-1;2,0;1,-1;1,0;1,-1;1,0;1,-1;1,0;2,-1;2,0;2,-1;2,0;2,-1;2,0;2,-1;1,0;1,-1;1,0;1,-1;1,0;1,-1;2,0;2,-1;2,0;9,-1',
    ),
  );

  /// User
  late final user = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;4,0;3,-1;6,0;2,-1;6,0;2,-1;6,0;3,-1;4,0;5,-1;2,0;4,-1;6,0;1,-1;8,0',
    ),
  );

  /// Bag/Chest
  late final chest = NesIconData(
    MiniSprite.fromDataString(
      '8,8;9,-1;6,0;1,-1;1,0;6,1;2,0;1,1;4,0;1,1;10,0;2,1;2,0;2,1;2,0;6,1;9,0',
    ),
  );

  /// Lamp.
  late final lamp = NesIconData(
    MiniSprite.fromDataString(
      '8,8;3,-1;2,0;5,-1;1,0;2,1;1,0;3,-1;1,0;2,1;1,0;1,1;1,0;2,-1;1,0;1,1;1,0;2,1;1,0;3,-1;1,0;2,1;1,0;4,-1;1,0;2,1;1,0;5,-1;2,0;6,-1;2,0;3,-1',
    ),
  );

  /// Clock.
  late final clock = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;4,0;3,-1;1,0;4,1;1,0;1,-1;1,0;2,1;1,0;3,1;2,0;2,1;1,0;3,1;2,0;2,1;3,0;1,1;2,0;6,1;1,0;1,-1;1,0;4,1;1,0;3,-1;4,0;2,-1',
    ),
  );

  /// Tree.
  late final tree = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;4,0;3,-1;2,0;1,1;1,0;1,1;1,0;1,-1;2,0;1,1;1,0;1,1;1,0;1,1;2,0;1,1;1,0;1,1;1,0;1,1;1,0;2,-1;5,0;5,-1;1,0;7,-1;2,0;5,-1;4,0;2,-1',
    ),
  );

  /// Energy.
  late final energy = NesIconData(
    MiniSprite.fromDataString(
      '8,8;5,-1;2,0;5,-1;2,0;5,-1;2,0;5,-1;5,0;5,-1;2,0;5,-1;2,0;5,-1;2,0;5,-1;2,0;5,-1',
    ),
  );

  /// Leaves
  late final leaves = NesIconData(
    MiniSprite.fromDataString(
      '8,8;8,-1;3,0;2,-1;5,0;1,1;2,0;1,1;3,0;1,1;2,0;1,1;1,0;1,1;1,0;1,-1;2,0;1,1;1,0;1,1;1,0;3,-1;2,0;1,1;1,0;4,-1;3,0;5,-1;1,0;5,-1',
    ),
  );

  /// Fruit
  late final fruit = NesIconData(
    MiniSprite.fromDataString(
      '8,8;4,-1;1,0;6,-1;1,0;1,1;1,0;5,-1;2,0;5,-1;4,0;3,-1;1,0;4,1;1,0;2,-1;1,0;4,1;1,0;3,-1;1,0;2,1;1,0;5,-1;2,0;3,-1',
    ),
  );

  /// Fat arrow up
  late final fatArrowUp = NesIconData(
    MiniSprite.fromDataString(
      '8,8;3,-1;2,0;5,-1;1,0;2,1;1,0;3,-1;1,0;4,1;1,0;1,-1;3,0;2,1;3,0;2,-1;1,0;2,1;1,0;4,-1;1,0;2,1;1,0;4,-1;1,0;2,1;1,0;4,-1;4,0;2,-1',
    ),
  );

  /// Fat arrow down
  late final fatArrowDown = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;4,0;4,-1;1,0;2,1;1,0;4,-1;1,0;2,1;1,0;4,-1;1,0;2,1;1,0;2,-1;3,0;2,1;3,0;1,-1;1,0;4,1;1,0;3,-1;1,0;2,1;1,0;5,-1;2,0;3,-1',
    ),
  );

  /// Hammer
  late final hammer = NesIconData(
    MiniSprite.fromDataString(
      '8,8;3,-1;3,0;4,-1;1,0;1,1;1,0;4,-1;1,0;1,1;1,0;4,-1;1,0;1,1;3,0;4,-1;1,0;1,-1;3,0;6,-1;3,0;6,-1;3,0;6,-1;1,0;1,-1',
    ),
  );

  /// Owl
  late final owl = NesIconData(
    MiniSprite.fromDataString(
      '8,8;8,-1;2,0;4,-1;2,0;1,-1;2,0;2,-1;2,0;2,-1;1,0;1,1;2,0;1,1;1,0;1,-1;1,0;1,1;1,0;2,1;1,0;1,1;2,0;1,1;4,0;1,1;2,0;2,1;2,0;2,1;1,0;1,-1;6,0;1,-1',
    ),
  );

  /// Letter
  late final letter = NesIconData(
    MiniSprite.fromDataString(
      '8,8;8,-1;10,0;4,1;3,0;1,1;1,0;2,1;1,0;1,1;2,0;2,1;2,0;2,1;2,0;6,1;9,0;8,-1',
    ),
  );

  /// Factory
  late final factory = NesIconData(
    MiniSprite.fromDataString(
      '8,8;5,-1;2,0;8,-1;1,0;6,-1;3,0;1,-1;1,0;1,-1;1,0;1,-1;11,0;1,1;1,0;1,1;1,0;1,1;18,0',
    ),
  );

  /// Rail
  late final rail = NesIconData(
    MiniSprite.fromDataString(
      '8,8;9,-1;1,0;4,-1;1,0;1,-1;8,0;1,-1;1,0;4,-1;1,0;1,-1;8,0;1,-1;1,0;4,-1;1,0;1,-1;8,0;1,-1;1,0;4,-1;1,0;1,-1',
    ),
  );

  /// Robot
  late final robot = NesIconData(
    MiniSprite.fromDataString(
      '8,8;1,-1;6,0;1,-1;1,0;6,1;2,0;3,1;2,0;1,1;2,0;3,1;2,0;1,1;2,0;6,1;10,0;6,1;1,0;1,-1;6,0;1,-1',
    ),
  );

  /// Pickaxe
  late final pickaxe = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;4,0;6,-1;3,0;6,-1;3,0;4,-1;1,0;1,-1;2,0;3,-1;1,0;3,-1;1,0;2,-1;1,0;4,-1;1,0;1,-1;1,0;6,-1;1,0;7,-1',
    ),
  );

  /// Shovel
  late final shovel = NesIconData(
    MiniSprite.fromDataString(
      '8,8;1,-1;6,0;4,-1;2,0;6,-1;2,0;6,-1;2,0;4,-1;6,0;2,-1;1,0;4,1;1,0;2,-1;2,0;2,1;2,0;3,-1;4,0;2,-1',
    ),
  );

  /// Oven
  late final oven = NesIconData(
    MiniSprite.fromDataString(
      '8,8;5,-1;1,0;1,-1;1,0;4,-1;1,0;1,-1;1,0;13,-1;2,0;3,-1;6,0;2,-1;2,0;2,1;2,0;2,-1;1,0;4,1;1,0;2,-1;6,0;1,-1',
    ),
  );

  /// Rotate
  late final rotate = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;5,0;2,-1;2,0;5,-1;2,0;6,-1;3,0;2,-1;1,0;2,-1;7,0;2,-1;7,0;3,-1;4,0;6,-1;1,0;2,-1',
    ),
  );

  /// Penguin
  late final penguin = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;4,0;3,-1;1,0;1,1;2,0;1,1;1,0;2,-1;2,0;2,1;2,0;1,-1;11,0;2,1;5,0;4,1;4,0;4,1;2,0;1,-1;6,0;1,-1',
    ),
  );

  /// Apple
  late final apple = NesIconData(
    MiniSprite.fromDataString(
      '8,8;5,-1;1,0;6,-1;1,0;4,-1;6,0;1,-1;3,0;1,1;6,0;1,1;13,0;1,-1;6,0;3,-1;4,0;2,-1',
    ),
  );

  /// Windows
  late final windows = NesIconData(
    MiniSprite.fromDataString(
      '8,8;4,0;4,-1;1,0;2,1;4,0;1,-1;1,0;2,1;1,0;2,1;1,0;1,-1;4,0;2,1;1,0;1,-1;1,0;2,1;4,0;1,-1;1,0;2,1;1,0;2,1;1,0;1,-1;4,0;2,1;1,0;4,-1;4,0;1,-1',
    ),
  );

  /// Audio
  late final audio = NesIconData(
    MiniSprite.fromDataString(
      '8,8;4,-1;2,0;5,-1;1,0;2,1;1,0;3,-1;1,0;3,1;1,0;1,-1;2,0;4,1;1,0;1,-1;2,0;4,1;1,0;3,-1;1,0;3,1;1,0;4,-1;1,0;2,1;1,0;5,-1;2,0;2,-1',
    ),
  );

  /// Audio Muted
  late final audioMuted = NesIconData(
    MiniSprite.fromDataString(
      '8,8;1,0;3,-1;2,0;3,-1;1,0;1,-1;1,0;2,1;1,0;3,-1;1,0;3,1;1,0;1,-1;2,0;1,1;1,0;2,1;1,0;1,-1;2,0;2,1;1,0;1,1;1,0;3,-1;1,0;2,1;2,0;4,-1;1,0;2,1;1,0;5,-1;2,0;1,-1;1,0',
    ),
  );

  /// Screen
  late final screen = NesIconData(
    MiniSprite.fromDataString(
      '8,8;9,0;6,1;2,0;6,1;2,0;6,1;12,0;2,1;3,0;2,-1;4,0;2,-1;8,0',
    ),
  );

  /// Rename
  late final rename = NesIconData(
    MiniSprite.fromDataString(
      '8,8;13,-1;3,0;1,-1;1,0;4,-1;1,0;1,-1;1,0;1,-1;1,0;3,-1;1,0;1,-1;3,0;3,-1;1,0;1,-1;1,0;1,-1;1,0;3,-1;1,0;6,-1;3,0;8,-1',
    ),
  );

  /// Hamburger Menu
  late final hamburgerMenu = NesIconData(
    MiniSprite.fromDataString(
      '8,8;17,-1;6,0;10,-1;6,0;10,-1;6,0;9,-1',
    ),
  );

  /// Arrow cursor
  late final arrowCursor = NesIconData(
    MiniSprite.fromDataString(
      '8,8;3,0;5,-1;1,0;2,1;2,0;3,-1;1,0;4,1;2,0;1,-1;2,0;4,1;1,0;1,-1;2,0;3,1;1,0;3,-1;2,0;1,1;1,0;1,1;1,0;2,-1;7,0;2,-1;2,0;1,-1;2,0;1,-1',
    ),
  );

  /// Center
  late final center = NesIconData(
    MiniSprite.fromDataString(
      '8,8;3,-1;2,0;6,-1;2,0;4,-1;6,0;3,-1;4,0;5,-1;2,0;14,-1;2,0;6,-1;2,0;3,-1',
    ),
  );

  /// Market
  late final market = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;4,0;3,-1;1,0;1,1;2,0;1,1;1,0;1,-1;1,0;1,1;1,0;2,1;1,0;1,1;3,0;1,-1;2,0;1,-1;2,0;1,-1;1,0;4,-1;1,0;2,-1;1,0;4,-1;1,0;1,-1;16,0',
    ),
  );

  /// Play
  late final play = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;2,0;6,-1;3,0;5,-1;4,0;4,-1;5,0;3,-1;5,0;3,-1;4,0;4,-1;3,0;5,-1;2,0;4,-1',
    ),
  );

  /// Pause
  late final pause = NesIconData(
    MiniSprite.fromDataString(
      '8,8;1,-1;2,0;2,-1;2,0;2,-1;2,0;2,-1;2,0;2,-1;2,0;2,-1;2,0;2,-1;2,0;2,-1;2,0;2,-1;2,0;2,-1;2,0;2,-1;2,0;2,-1;2,0;2,-1;2,0;2,-1;2,0;2,-1;2,0;2,-1;2,0;1,-1',
    ),
  );

  /// Wrench
  late final wrench = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;1,0;2,-1;1,0;3,-1;2,0;2,-1;2,0;2,-1;6,0;3,-1;4,0;5,-1;2,0;6,-1;2,0;6,-1;2,0;6,-1;2,0;3,-1',
    ),
  );

  /// Discord
  late final discord = NesIconData(
    MiniSprite.fromDataString(
      '8,8;9,-1;6,0;1,-1;10,0;1,-1;2,0;1,-1;12,0;4,-1;2,0;16,-1',
    ),
  );

  /// Bell
  late final bell = NesIconData(
    MiniSprite.fromDataString(
      '8,8;3,-1;2,0;5,-1;4,0;4,-1;1,0;1,1;2,0;4,-1;1,0;1,1;2,0;3,-1;1,0;1,1;4,0;1,-1;16,0;3,-1;2,0;3,-1',
    ),
  );

  /// Alien
  late final alien = NesIconData(
    MiniSprite.fromDataString(
      '8,8;1,0;6,-1;1,0;1,-1;2,0;2,-1;2,0;1,-1;9,0;2,-1;2,0;2,-1;10,0;1,-1;4,0;1,-1;1,0;1,-1;2,0;2,-1;2,0;9,-1',
    ),
  );

  /// Block
  late final block = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;4,0;3,-1;1,0;4,-1;1,0;1,-1;1,0;1,-1;1,0;4,-1;2,0;2,-1;1,0;3,-1;2,0;3,-1;1,0;2,-1;2,0;4,-1;1,0;1,-1;1,0;1,-1;1,0;4,-1;1,0;3,-1;4,0;2,-1',
    ),
  );

  /// Gem
  late final gem = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;4,0;3,-1;1,0;2,1;1,0;1,1;1,0;1,-1;2,0;1,1;1,0;1,1;4,0;1,1;7,0;2,1;1,0;2,1;2,0;1,-1;2,0;2,1;2,0;3,-1;1,0;1,1;2,0;5,-1;2,0;3,-1',
    ),
  );

  /// Heart
  late final heart = NesIconData(
    MiniSprite.fromDataString(
      '8,8;9,-1;2,0;2,-1;2,0;1,-1;24,0;1,-1;6,0;3,-1;4,0;5,-1;2,0;3,-1',
    ),
  );

  /// Lock
  late final lock = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;4,0;3,-1;1,0;4,1;1,0;2,-1;1,0;1,1;2,0;1,1;1,0;1,-1;9,0;6,1;2,0;2,1;2,0;2,1;2,0;6,1;9,0',
    ),
  );

  /// Key
  late final key = NesIconData(
    MiniSprite.fromDataString(
      '8,8;13,-1;3,0;5,-1;1,0;1,-1;7,0;1,-1;7,0;1,-1;1,0;1,-1;2,0;2,-1;1,0;1,-1;1,0;1,-1;2,0;2,-1;3,0;8,-1',
    ),
  );

  /// Crane
  late final crane = NesIconData(
    MiniSprite.fromDataString(
      '8,8;2,-1;2,0;4,-1;7,0;1,-1;12,0;2,-1;1,0;3,-1;2,0;2,-1;1,0;3,-1;2,0;1,-1;3,0;2,-1;2,0;5,-1;4,0;3,-1',
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
    this.accentColor,
    this.shadowColor,
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

  /// An optional accent color for the icon.
  /// Will use value from the theme if none is provided.
  ///
  /// Only has effect in [NesIcons16].
  final Color? accentColor;

  /// An optional shadow color for the icon.
  /// Will use value from the theme if none is provided.
  ///
  /// Only has effect in [NesIcons16].
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    final nesTheme = context.nesThemeExtension<NesTheme>();
    final nesIconTheme = context.nesThemeExtension<NesIconTheme>();

    var pixelSize = nesTheme.pixelSize.toDouble();

    final iconSize = size ?? Size.square(nesIconTheme.size);
    final spriteHorizontalUnits = iconData.sprite.pixels[0].length;
    final spriteVerticalUnits = iconData.sprite.pixels.length;

    final width = iconSize.width / spriteHorizontalUnits;
    final height = iconSize.height / spriteVerticalUnits;

    pixelSize = math.min(width, height).roundToDouble();

    return MiniSpriteWidget(
      pixelSize: pixelSize,
      palette: [
        primaryColor ?? nesIconTheme.primary,
        secondaryColor ?? nesIconTheme.secondary,
        accentColor ?? nesIconTheme.accent,
        shadowColor ?? nesIconTheme.shadow,
      ],
      sprite: iconData.sprite,
    );
  }
}
