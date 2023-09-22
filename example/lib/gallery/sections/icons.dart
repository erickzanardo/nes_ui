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
              data: NesIcons.instance.check,
              label: 'check',
            ),
            _IconEntry(
              data: NesIcons.instance.close,
              label: 'close',
            ),
            _IconEntry(
              data: NesIcons.instance.handPointingRight,
              label: 'handPointingRight',
            ),
            _IconEntry(
              data: NesIcons.instance.leftArrowIndicator,
              label: 'leftArrowIndicator',
            ),
            _IconEntry(
              data: NesIcons.instance.rightArrowIndicator,
              label: 'rightArrowIndicator',
            ),
            _IconEntry(
              data: NesIcons.instance.topArrowIndicator,
              label: 'topArrowIndicator',
            ),
            _IconEntry(
              data: NesIcons.instance.bottomArrowIndicator,
              label: 'bottomArrowIndicator',
            ),
            _IconEntry(
              data: NesIcons.instance.sword,
              label: 'sword',
            ),
            _IconEntry(
              data: NesIcons.instance.shield,
              label: 'shield',
            ),
            _IconEntry(
              data: NesIcons.instance.axe,
              label: 'axe',
            ),
            _IconEntry(
              data: NesIcons.instance.arrow,
              label: 'arrow',
            ),
            _IconEntry(
              data: NesIcons.instance.sun,
              label: 'sun',
            ),
            _IconEntry(
              data: NesIcons.instance.moon,
              label: 'moon',
            ),
            _IconEntry(
              data: NesIcons.instance.gallery,
              label: 'gallery',
            ),
            _IconEntry(
              data: NesIcons.instance.gamepad,
              label: 'gamepad',
            ),
            _IconEntry(
              data: NesIcons.instance.delete,
              label: 'delete',
            ),
            _IconEntry(
              data: NesIcons.instance.add,
              label: 'add',
            ),
            _IconEntry(
              data: NesIcons.instance.remove,
              label: 'remove',
            ),
            _IconEntry(
              data: NesIcons.instance.redo,
              label: 'redo',
            ),
            _IconEntry(
              data: NesIcons.instance.openFolder,
              label: 'openFolder',
            ),
            _IconEntry(
              data: NesIcons.instance.closedFolder,
              label: 'closedFolder',
            ),
            _IconEntry(
              data: NesIcons.instance.thinArrowLeft,
              label: 'thinArrowLeft',
            ),
            _IconEntry(
              data: NesIcons.instance.thinArrowRight,
              label: 'thinArrowRight',
            ),
            _IconEntry(
              data: NesIcons.instance.musicNote,
              label: 'musicNote',
            ),
            _IconEntry(
              data: NesIcons.instance.keyHole,
              label: 'keyHole',
            ),
            _IconEntry(
              data: NesIcons.instance.questionMark,
              label: 'questionMark',
            ),
            _IconEntry(
              data: NesIcons.instance.dartLang,
              label: 'dartLang',
            ),
            _IconEntry(
              data: NesIcons.instance.bottomConnection,
              label: 'bottomConnection',
            ),
            _IconEntry(
              data: NesIcons.instance.middleConnection,
              label: 'middleConnection',
            ),
            _IconEntry(
              data: NesIcons.instance.topConnection,
              label: 'topConnection',
            ),
            _IconEntry(
              data: NesIcons.instance.threeVerticalDots,
              label: 'threeVerticalDots',
            ),
            _IconEntry(
              data: NesIcons.instance.threeHorizontalDots,
              label: 'threeHorizontalDots',
            ),
            _IconEntry(
              data: NesIcons.instance.newFile,
              label: 'newFile',
            ),
            _IconEntry(
              data: NesIcons.instance.saveFile,
              label: 'saveFile',
            ),
            _IconEntry(
              data: NesIcons.instance.openEye,
              label: 'openEye',
            ),
            _IconEntry(
              data: NesIcons.instance.closedEye,
              label: 'closedEye',
            ),
            _IconEntry(
              data: NesIcons.instance.window,
              label: 'window',
            ),
            _IconEntry(
              data: NesIcons.instance.textFile,
              label: 'textFile',
            ),
            _IconEntry(
              data: NesIcons.instance.download,
              label: 'download',
            ),
            _IconEntry(
              data: NesIcons.instance.zoomIn,
              label: 'zoomIn',
            ),
            _IconEntry(
              data: NesIcons.instance.zoomOut,
              label: 'zoomOut',
            ),
            _IconEntry(
              data: NesIcons.instance.yamlFile,
              label: 'yamlFile',
            ),
            _IconEntry(
              data: NesIcons.instance.xmlFile,
              label: 'xmlFile',
            ),
            _IconEntry(
              data: NesIcons.instance.exclamationMarkBlock,
              label: 'exclamationMarkBlock',
            ),
            _IconEntry(
              data: NesIcons.instance.questionMarkBlock,
              label: 'questionMarkBlock',
            ),
            _IconEntry(
              data: NesIcons.instance.leftHand,
              label: 'leftHand',
            ),
            _IconEntry(
              data: NesIcons.instance.rightHand,
              label: 'rightHand',
            ),
            _IconEntry(
              data: NesIcons.instance.helm,
              label: 'helm',
            ),
            _IconEntry(
              data: NesIcons.instance.upperArmor,
              label: 'upperArmor',
            ),
            _IconEntry(
              data: NesIcons.instance.lowerArmor,
              label: 'lowerArmor',
            ),
            _IconEntry(
              data: NesIcons.instance.exchange,
              label: 'exchange',
            ),
            _IconEntry(
              data: NesIcons.instance.edit,
              label: 'edit',
            ),
            _IconEntry(
              data: NesIcons.instance.expand,
              label: 'expand',
            ),
            _IconEntry(
              data: NesIcons.instance.cut,
              label: 'cut',
            ),
            _IconEntry(
              data: NesIcons.instance.eraser,
              label: 'eraser',
            ),
            _IconEntry(
              data: NesIcons.instance.copy,
              label: 'copy',
            ),
            _IconEntry(
              data: NesIcons.instance.paste,
              label: 'paste',
            ),
            _IconEntry(
              data: NesIcons.instance.tv,
              label: 'tv',
            ),
            _IconEntry(
              data: NesIcons.instance.radio,
              label: 'radio',
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
