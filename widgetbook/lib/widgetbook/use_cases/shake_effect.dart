// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'default (declarative)', type: NesShakeEffect)
Widget defaultShake(BuildContext context) => const Center(
      child: _DeclarativeShakeDemo(),
    );

@widgetbook.UseCase(name: 'with controller', type: NesShakeEffect)
Widget withController(BuildContext context) => const Center(
      child: _ControllerShakeDemo(),
    );

@widgetbook.UseCase(name: 'with custom intensity', type: NesShakeEffect)
Widget customIntensity(BuildContext context) => const Center(
      child: _CustomIntensityDemo(),
    );

class _DeclarativeShakeDemo extends StatefulWidget {
  const _DeclarativeShakeDemo();

  @override
  State<_DeclarativeShakeDemo> createState() => _DeclarativeShakeDemoState();
}

class _DeclarativeShakeDemoState extends State<_DeclarativeShakeDemo> {
  bool _shaking = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        NesShakeEffect(
          shaking: _shaking,
          child: const NesContainer(
            width: 200,
            height: 100,
            child: Center(child: Text('Shake me!')),
          ),
        ),
        const SizedBox(height: 16),
        NesButton(
          type: NesButtonType.normal,
          onPressed: () {
            setState(() {
              _shaking = !_shaking;
            });
          },
          child: Text(_shaking ? 'Stop' : 'Start'),
        ),
      ],
    );
  }
}

class _ControllerShakeDemo extends StatefulWidget {
  const _ControllerShakeDemo();

  @override
  State<_ControllerShakeDemo> createState() => _ControllerShakeDemoState();
}

class _ControllerShakeDemoState extends State<_ControllerShakeDemo> {
  final _controller = NesShakeEffectController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        NesShakeEffect(
          controller: _controller,
          child: const NesContainer(
            width: 200,
            height: 100,
            child: Center(child: Text('Shake me!')),
          ),
        ),
        const SizedBox(height: 16),
        NesButton(
          type: NesButtonType.normal,
          onPressed: _controller.shake,
          child: const Text('Shake!'),
        ),
      ],
    );
  }
}

class _CustomIntensityDemo extends StatefulWidget {
  const _CustomIntensityDemo();

  @override
  State<_CustomIntensityDemo> createState() => _CustomIntensityDemoState();
}

class _CustomIntensityDemoState extends State<_CustomIntensityDemo> {
  final _controller = NesShakeEffectController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        NesShakeEffect(
          controller: _controller,
          intensity: 8,
          duration: const Duration(milliseconds: 500),
          child: const NesContainer(
            width: 200,
            height: 100,
            child: Center(child: Text('Heavy shake!')),
          ),
        ),
        const SizedBox(height: 16),
        NesButton(
          type: NesButtonType.normal,
          onPressed: _controller.shake,
          child: const Text('Shake!'),
        ),
      ],
    );
  }
}
