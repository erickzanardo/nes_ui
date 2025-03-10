// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: NesTooltip,
)
Widget normal(BuildContext context) => const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          NesTooltip(
            message: 'This is a tooltip',
            child: Text('Hover for the default tooltip'),
          ),
          NesTooltip(
            message: 'This is a tooltip',
            arrowPlacement: NesTooltipArrowPlacement.left,
            child: Text('Hover for arrow on the left'),
          ),
          NesTooltip(
            message: 'This is a tooltip',
            arrowPlacement: NesTooltipArrowPlacement.right,
            child: Text('Hover for arrow on the right'),
          ),
          NesTooltip(
            message: 'This is a tooltip',
            arrowDirection: NesTooltipArrowDirection.bottom,
            child: Text('Hover for tooltip on the bottom'),
          ),
          NesTooltip(
            message: 'This is a tooltip',
            arrowDirection: NesTooltipArrowDirection.bottom,
            arrowPlacement: NesTooltipArrowPlacement.left,
            child: Text('Hover for tooltip on bottom and arrow on the left'),
          ),
          NesTooltip(
            message: 'This is a tooltip',
            arrowDirection: NesTooltipArrowDirection.bottom,
            arrowPlacement: NesTooltipArrowPlacement.right,
            child: Text('Hover for tooltip on bottom and arrow on the right'),
          ),
        ],
      ),
    );
