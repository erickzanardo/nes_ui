import 'dart:math';

import 'package:flutter/material.dart';

/// A controller for [NesShakeEffect].
///
/// Call [shake] to trigger the shake animation programmatically.
class NesShakeEffectController extends ChangeNotifier {
  bool _shouldShake = false;

  /// Whether the shake effect is currently requested.
  bool get shouldShake => _shouldShake;

  /// Triggers a single shake animation.
  void shake() {
    _shouldShake = true;
    notifyListeners();
  }

  /// Resets the shake state. Called internally when the animation completes.
  void reset() {
    _shouldShake = false;
  }
}

/// {@template nes_shake_effect}
/// A widget that shakes its child.
///
/// The shake can be controlled either declaratively via the [shaking]
/// parameter, or imperatively via a [NesShakeEffectController].
///
/// When [shaking] is true, the widget will continuously shake until
/// it is set back to false.
///
/// When using a controller, call [NesShakeEffectController.shake] to
/// trigger a single shake that auto-stops after [duration].
/// {@endtemplate}
class NesShakeEffect extends StatefulWidget {
  /// {@macro nes_shake_effect}
  const NesShakeEffect({
    super.key,
    this.shaking = false,
    this.controller,
    this.intensity = 4.0,
    this.duration = const Duration(milliseconds: 300),
    required this.child,
  });

  /// Whether the widget is currently shaking.
  ///
  /// When set to true, the widget will shake continuously until
  /// this is set back to false.
  final bool shaking;

  /// An optional controller to trigger shakes programmatically.
  ///
  /// If not provided, one will be created internally.
  final NesShakeEffectController? controller;

  /// The maximum pixel offset of the shake.
  final double intensity;

  /// The duration of a single shake animation.
  final Duration duration;

  /// The child widget to shake.
  final Widget child;

  @override
  State<NesShakeEffect> createState() => NesShakeEffectState();
}

/// State for [NesShakeEffect].
class NesShakeEffectState extends State<NesShakeEffect>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  final Random _random = Random();

  NesShakeEffectController? _internalController;

  /// The effective controller, either the one provided by the user or
  /// one created internally.
  NesShakeEffectController get _effectiveController =>
      widget.controller ?? (_internalController ??= NesShakeEffectController());

  double _offsetX = 0;
  double _offsetY = 0;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    )
      ..addListener(_onAnimationTick)
      ..addStatusListener(_onAnimationStatus);

    _effectiveController.addListener(_onControllerUpdate);

    if (widget.shaking) {
      _startShake();
    }
  }

  @override
  void didUpdateWidget(NesShakeEffect oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.duration != oldWidget.duration) {
      _animationController.duration = widget.duration;
    }

    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_onControllerUpdate);

      if (oldWidget.controller == null && widget.controller != null) {
        _internalController?.removeListener(_onControllerUpdate);
        _internalController?.dispose();
        _internalController = null;
      }

      _effectiveController.addListener(_onControllerUpdate);
    }

    if (widget.shaking != oldWidget.shaking) {
      if (widget.shaking) {
        _startShake();
      } else {
        _stopShake();
      }
    }
  }

  @override
  void dispose() {
    _animationController
      ..removeListener(_onAnimationTick)
      ..removeStatusListener(_onAnimationStatus)
      ..dispose();

    _effectiveController.removeListener(_onControllerUpdate);
    _internalController?.dispose();

    super.dispose();
  }

  void _onControllerUpdate() {
    if (_effectiveController.shouldShake) {
      _startShake();
    }
  }

  void _onAnimationTick() {
    final decay = 1.0 - _animationController.value;

    setState(() {
      _offsetX = (_random.nextDouble() * 2 - 1) * widget.intensity * decay;
      _offsetY = (_random.nextDouble() * 2 - 1) * widget.intensity * decay;
    });
  }

  void _onAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _effectiveController.reset();

      if (widget.shaking) {
        _animationController
          ..reset()
          ..forward();
      } else {
        setState(() {
          _offsetX = 0;
          _offsetY = 0;
        });
      }
    }
  }

  void _startShake() {
    _animationController
      ..reset()
      ..forward();
  }

  void _stopShake() {
    _animationController.stop();
    setState(() {
      _offsetX = 0;
      _offsetY = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(_offsetX, _offsetY),
      child: widget.child,
    );
  }
}
