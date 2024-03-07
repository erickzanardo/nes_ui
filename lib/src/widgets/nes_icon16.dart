// ignore_for_file: lines_longer_than_80_chars
import 'package:mini_sprite/mini_sprite.dart';
import 'package:nes_ui/nes_ui.dart';

/// Built in library of 16x16 icons for the Flutter Nes Design library.
/// Use [NesIcons] to access the icons.
class NesIcons16 {
  NesIcons16._();

  /// A check icon.
  static final check = NesIconData(
    MiniSprite.fromDataString(
      '16,16;14,-1;2,0;13,-1;1,0;1,2;1,0;12,-1;1,0;1,2;1,3;1,0;11,-1;1,0;1,2;1,1;1,2;1,0;10,-1;1,0;1,2;2,1;1,3;1,0;9,-1;1,0;1,2;2,1;1,3;1,0;9,-1;1,0;1,2;2,1;1,3;1,0;3,-1;2,0;4,-1;1,0;1,2;2,1;1,3;1,0;3,-1;1,0;2,2;1,0;2,-1;1,0;1,2;2,1;1,3;1,0;4,-1;1,0;1,3;1,2;1,0;1,-1;1,0;1,2;2,1;1,3;1,0;5,-1;1,0;1,2;1,1;1,2;1,0;1,2;2,1;1,3;1,0;6,-1;1,0;1,3;2,1;1,2;2,1;1,3;1,0;8,-1;1,0;1,3;3,1;1,3;1,0;10,-1;1,0;1,3;1,1;1,3;1,0;12,-1;1,0;1,3;1,0;14,-1;1,0;11,-1',
    ),
  );
}
