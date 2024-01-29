import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class IconsSection extends StatelessWidget {
  const IconsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Icons',
          style: theme.textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        Wrap(
          children: [
            _IconEntry(
              data: NesIcons.check,
              label: 'check',
            ),
            _IconEntry(
              data: NesIcons.close,
              label: 'close',
            ),
            _IconEntry(
              data: NesIcons.handPointingRight,
              label: 'handPointingRight',
            ),
            _IconEntry(
              data: NesIcons.leftArrowIndicator,
              label: 'leftArrowIndicator',
            ),
            _IconEntry(
              data: NesIcons.rightArrowIndicator,
              label: 'rightArrowIndicator',
            ),
            _IconEntry(
              data: NesIcons.topArrowIndicator,
              label: 'topArrowIndicator',
            ),
            _IconEntry(
              data: NesIcons.bottomArrowIndicator,
              label: 'bottomArrowIndicator',
            ),
            _IconEntry(
              data: NesIcons.sword,
              label: 'sword',
            ),
            _IconEntry(
              data: NesIcons.shield,
              label: 'shield',
            ),
            _IconEntry(
              data: NesIcons.axe,
              label: 'axe',
            ),
            _IconEntry(
              data: NesIcons.arrow,
              label: 'arrow',
            ),
            _IconEntry(
              data: NesIcons.sun,
              label: 'sun',
            ),
            _IconEntry(
              data: NesIcons.moon,
              label: 'moon',
            ),
            _IconEntry(
              data: NesIcons.gallery,
              label: 'gallery',
            ),
            _IconEntry(
              data: NesIcons.gamepad,
              label: 'gamepad',
            ),
            _IconEntry(
              data: NesIcons.delete,
              label: 'delete',
            ),
            _IconEntry(
              data: NesIcons.add,
              label: 'add',
            ),
            _IconEntry(
              data: NesIcons.remove,
              label: 'remove',
            ),
            _IconEntry(
              data: NesIcons.redo,
              label: 'redo',
            ),
            _IconEntry(
              data: NesIcons.openFolder,
              label: 'openFolder',
            ),
            _IconEntry(
              data: NesIcons.closedFolder,
              label: 'closedFolder',
            ),
            _IconEntry(
              data: NesIcons.thinArrowLeft,
              label: 'thinArrowLeft',
            ),
            _IconEntry(
              data: NesIcons.thinArrowRight,
              label: 'thinArrowRight',
            ),
            _IconEntry(
              data: NesIcons.musicNote,
              label: 'musicNote',
            ),
            _IconEntry(
              data: NesIcons.keyHole,
              label: 'keyHole',
            ),
            _IconEntry(
              data: NesIcons.questionMark,
              label: 'questionMark',
            ),
            _IconEntry(
              data: NesIcons.dartLang,
              label: 'dartLang',
            ),
            _IconEntry(
              data: NesIcons.bottomConnection,
              label: 'bottomConnection',
            ),
            _IconEntry(
              data: NesIcons.middleConnection,
              label: 'middleConnection',
            ),
            _IconEntry(
              data: NesIcons.topConnection,
              label: 'topConnection',
            ),
            _IconEntry(
              data: NesIcons.threeVerticalDots,
              label: 'threeVerticalDots',
            ),
            _IconEntry(
              data: NesIcons.threeHorizontalDots,
              label: 'threeHorizontalDots',
            ),
            _IconEntry(
              data: NesIcons.newFile,
              label: 'newFile',
            ),
            _IconEntry(
              data: NesIcons.saveFile,
              label: 'saveFile',
            ),
            _IconEntry(
              data: NesIcons.openEye,
              label: 'openEye',
            ),
            _IconEntry(
              data: NesIcons.closedEye,
              label: 'closedEye',
            ),
            _IconEntry(
              data: NesIcons.window,
              label: 'window',
            ),
            _IconEntry(
              data: NesIcons.textFile,
              label: 'textFile',
            ),
            _IconEntry(
              data: NesIcons.download,
              label: 'download',
            ),
            _IconEntry(
              data: NesIcons.zoomIn,
              label: 'zoomIn',
            ),
            _IconEntry(
              data: NesIcons.zoomOut,
              label: 'zoomOut',
            ),
            _IconEntry(
              data: NesIcons.yamlFile,
              label: 'yamlFile',
            ),
            _IconEntry(
              data: NesIcons.xmlFile,
              label: 'xmlFile',
            ),
            _IconEntry(
              data: NesIcons.exclamationMarkBlock,
              label: 'exclamationMarkBlock',
            ),
            _IconEntry(
              data: NesIcons.questionMarkBlock,
              label: 'questionMarkBlock',
            ),
            _IconEntry(
              data: NesIcons.leftHand,
              label: 'leftHand',
            ),
            _IconEntry(
              data: NesIcons.rightHand,
              label: 'rightHand',
            ),
            _IconEntry(
              data: NesIcons.helm,
              label: 'helm',
            ),
            _IconEntry(
              data: NesIcons.upperArmor,
              label: 'upperArmor',
            ),
            _IconEntry(
              data: NesIcons.lowerArmor,
              label: 'lowerArmor',
            ),
            _IconEntry(
              data: NesIcons.exchange,
              label: 'exchange',
            ),
            _IconEntry(
              data: NesIcons.edit,
              label: 'edit',
            ),
            _IconEntry(
              data: NesIcons.expand,
              label: 'expand',
            ),
            _IconEntry(
              data: NesIcons.cut,
              label: 'cut',
            ),
            _IconEntry(
              data: NesIcons.eraser,
              label: 'eraser',
            ),
            _IconEntry(
              data: NesIcons.copy,
              label: 'copy',
            ),
            _IconEntry(
              data: NesIcons.paste,
              label: 'paste',
            ),
            _IconEntry(
              data: NesIcons.tv,
              label: 'tv',
            ),
            _IconEntry(
              data: NesIcons.radio,
              label: 'radio',
            ),
            _IconEntry(
              data: NesIcons.hourglassTopFull,
              label: 'hourglassTopFull',
            ),
            _IconEntry(
              data: NesIcons.hourglassBottomFull,
              label: 'hourglassBottomFull',
            ),
            _IconEntry(
              data: NesIcons.hourglassMiddle,
              label: 'hourglassMiddle',
            ),
            _IconEntry(
              data: NesIcons.flag,
              label: 'flag',
            ),
            _IconEntry(
              data: NesIcons.checkedFlag,
              label: 'checkedFlag',
            ),
            _IconEntry(
              data: NesIcons.infinite,
              label: 'infinite',
            ),
            _IconEntry(
              data: NesIcons.user,
              label: 'user',
            ),
            _IconEntry(
              data: NesIcons.chest,
              label: 'chest',
            ),
            _IconEntry(
              data: NesIcons.lamp,
              label: 'lamp',
            ),
            _IconEntry(
              data: NesIcons.clock,
              label: 'clock',
            ),
            _IconEntry(
              data: NesIcons.tree,
              label: 'tree',
            ),
            _IconEntry(
              data: NesIcons.energy,
              label: 'energy',
            ),
            _IconEntry(
              data: NesIcons.leaves,
              label: 'leaves',
            ),
            _IconEntry(
              data: NesIcons.fruit,
              label: 'fruit',
            ),
            _IconEntry(
              data: NesIcons.fatArrowUp,
              label: 'fatArrowUp',
            ),
            _IconEntry(
              data: NesIcons.fatArrowDown,
              label: 'fatArrowDown',
            ),
            _IconEntry(
              data: NesIcons.hammer,
              label: 'hammer',
            ),
            _IconEntry(
              data: NesIcons.owl,
              label: 'owl',
            ),
            _IconEntry(
              data: NesIcons.letter,
              label: 'letter',
            ),
            _IconEntry(
              data: NesIcons.factory,
              label: 'factory',
            ),
            _IconEntry(
              data: NesIcons.rail,
              label: 'rail',
            ),
            _IconEntry(
              data: NesIcons.robot,
              label: 'robot',
            ),
            _IconEntry(
              data: NesIcons.pickaxe,
              label: 'pickaxe',
            ),
            _IconEntry(
              data: NesIcons.oven,
              label: 'oven',
            ),
            _IconEntry(
              data: NesIcons.rotate,
              label: 'rotate',
            ),
            _IconEntry(
              data: NesIcons.penguin,
              label: 'penguin',
            ),
            _IconEntry(
              data: NesIcons.apple,
              label: 'apple',
            ),
            _IconEntry(
              data: NesIcons.windows,
              label: 'windows',
            ),
            _IconEntry(
              data: NesIcons.audio,
              label: 'audio',
            ),
            _IconEntry(
              data: NesIcons.audio_muted,
              label: 'audioMuted',
            ),
            _IconEntry(
              data: NesIcons.screen,
              label: 'screen',
            ),
            _IconEntry(
              data: NesIcons.rename,
              label: 'rename',
            ),
            _IconEntry(
              data: NesIcons.hamburgerMenu,
              label: 'hamburgerMenu',
            ),
            _IconEntry(
              data: NesIcons.arrowCursor,
              label: 'arrowCursor',
            ),
            _IconEntry(
              data: NesIcons.center,
              label: 'center',
            ),
          ],
        ),
      ],
    );
  }
}

class _IconEntry extends StatelessWidget {
  const _IconEntry({
    required this.data,
    required this.label,
  });

  final NesIconData data;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          NesIcon(iconData: data),
          const SizedBox(height: 8),
          SizedBox(
            width: 120,
            child: Text(
              label,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
