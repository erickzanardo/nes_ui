import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class EffectsSection extends StatefulWidget {
  const EffectsSection({super.key});

  @override
  State<EffectsSection> createState() => _EffectsSectionState();
}

class _EffectsSectionState extends State<EffectsSection> {
  final _shakeController = NesShakeEffectController();

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Effects', style: theme.textTheme.displayMedium),
        const SizedBox(height: 16),
        Wrap(
          children: [
            SizedBox(
              height: 40,
              width: 160,
              child: NesBlinker(child: const Text('NES Blinker')),
            ),
            const SizedBox(width: 16),
            SizedBox(
              height: 40,
              child: NesPulser(child: const Text('NES Pulser')),
            ),
            const SizedBox(width: 16),
            NesShakeEffect(
              controller: _shakeController,
              child: NesButton(
                type: NesButtonType.normal,
                onPressed: _shakeController.shake,
                child: const Text('Shake!'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
