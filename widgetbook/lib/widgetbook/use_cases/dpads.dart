// ignore_for_file: public_member_api_docs

import 'package:flutter/widgets.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'default',
  type: NesDpad,
)
Widget normal(BuildContext context) {
  return const Center(
    child: NesDpad(),
  );
}

@widgetbook.UseCase(
  name: 'with callbacks',
  type: NesDpad,
)
Widget withCallbacks(BuildContext context) {
  return const Center(
    child: ControllingDpad(),
  );
}

class ControllingDpad extends StatefulWidget {
  const ControllingDpad({super.key});

  @override
  State createState() => _ControllingDpadState();
}

class _ControllingDpadState extends State<ControllingDpad> {
  NesDpadDirection? _direction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NesDpad(
            onButtonDown: (direction) {
              setState(() {
                _direction = direction;
              });
            },
            onButtonUp: (direction) {
              setState(() {
                _direction = null;
              });
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Direction: ${_direction?.name ?? 'none'}',
          ),
        ],
      ),
    );
  }
}
