import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class TooltipsSection extends StatelessWidget {
  const TooltipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tooltips',
          style: theme.textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NesTooltip(
              message: 'This is a tooltip',
              arrowPlacement: NesTooltipArrowPlacement.left,
              child: NesIcon(
                iconData: NesIcons.instance.exclamationMarkBlock,
              ),
            ),
            NesTooltip(
              message: 'This is a tooltip',
              child: NesIcon(
                iconData: NesIcons.instance.exclamationMarkBlock,
              ),
            ),
            NesTooltip(
              message: 'This is a tooltip',
              arrowPlacement: NesTooltipArrowPlacement.right,
              child: NesIcon(
                iconData: NesIcons.instance.exclamationMarkBlock,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
