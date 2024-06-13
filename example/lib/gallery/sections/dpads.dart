import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class DpadsSection extends StatelessWidget {
  const DpadsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dpads',
          style: theme.textTheme.displayMedium,
        ),
        const SizedBox(height: 16),
        const ControllingDpad(),
      ],
    );
  }
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
