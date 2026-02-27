// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'pixel',
  type: NesProgressBar,
  path: 'widgets/progressbar',
)
Widget pixel(BuildContext context) =>
    _build(context, NesProgressBarStyle.pixel);

@widgetbook.UseCase(
  name: 'smooth',
  type: NesProgressBar,
  path: 'widgets/progressbar',
)
Widget smooth(BuildContext context) =>
    _build(context, NesProgressBarStyle.smooth);

Widget _build(BuildContext context, NesProgressBarStyle style) {
  var value = 0.0;
  Timer? timer;

  return StatefulBuilder(
    builder: (context, setState) {
      return Center(
        child: SizedBox(
          width: 256,
          child: Column(
            spacing: 4,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NesProgressBar(value: value, style: style),
              NesButton(
                type: NesButtonType.primary,
                onPressed: () {
                  timer?.cancel();
                  setState(() {
                    timer = Timer.periodic(const Duration(milliseconds: 100), (
                      Timer timer,
                    ) {
                      setState(() {
                        value += 0.02;
                      });
                      if (value >= 1) {
                        timer.cancel();
                      }
                    });
                  });
                },
                child: const Text('Start'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
