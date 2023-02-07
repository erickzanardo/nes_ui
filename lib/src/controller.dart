import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// Type of events for external controllers.
enum NesInputEvent {
  /// Up.
  up,

  /// Down.
  down,

  /// Left.
  left,

  /// Right.
  right,

  /// Confirm.
  confirm,

  /// Cancel.
  cancel,
}

/// {@template nes_keyboard_key_mapping}
/// A model that defines the key mapping for the keyboard on the
/// Nes Ui library.
/// {@endtemplate}
class NesKeyboardKeyMapping {
  /// {@macro nes_keyboard_key_mapping}
  const NesKeyboardKeyMapping({
    this.up = const [
      LogicalKeyboardKey.arrowUp,
    ],
    this.down = const [
      LogicalKeyboardKey.arrowDown,
    ],
    this.left = const [
      LogicalKeyboardKey.arrowLeft,
    ],
    this.right = const [
      LogicalKeyboardKey.arrowRight,
    ],
    this.confirm = const [
      LogicalKeyboardKey.enter,
      LogicalKeyboardKey.gameButton1,
    ],
    this.cancel = const [
      LogicalKeyboardKey.escape,
      LogicalKeyboardKey.gameButton2,
    ],
  });

  /// Key for the up selection.
  final List<LogicalKeyboardKey> up;

  /// Key for the down selection.
  final List<LogicalKeyboardKey> down;

  /// Key for the left selection.
  final List<LogicalKeyboardKey> left;

  /// Key for the right selection.
  final List<LogicalKeyboardKey> right;

  /// Key for the confirm action.
  final List<LogicalKeyboardKey> confirm;

  /// Key for the cancel action.
  final List<LogicalKeyboardKey> cancel;
}

///
abstract class NesInputAdapter {
  ///
  NesInputAdapter();

  ///
  void addListener(
    FocusNode node,
    NesInputEvent event,
    VoidCallback callback,
  );

  ///
  void disposeListeners(
    FocusNode node,
  );
}

/// {@template nes_keyboard_input_adapter}
/// A [NesInputAdapter] that uses the keyboard for input.
/// {@endtemplate}
class NesKeyboardInputAdapter extends NesInputAdapter {
  /// {@macro nes_keyboard_input_adapter}
  NesKeyboardInputAdapter({
    required this.mapping,
  });

  /// Key mapping.
  final NesKeyboardKeyMapping mapping;

  final Map<FocusNode, Map<NesInputEvent, List<VoidCallback>>> _events = {};

  KeyEventResult _handle(FocusNode node, RawKeyEvent event) {
    final events = _events[node];
    if (events != null) {
      if (event is RawKeyUpEvent) {
        if (!node.hasPrimaryFocus) {
          return KeyEventResult.handled;
        }

        final listeners = [
          if (mapping.up.contains(event.logicalKey))
            ...events[NesInputEvent.up] ?? [],
          if (mapping.down.contains(event.logicalKey))
            ...events[NesInputEvent.down] ?? [],
          if (mapping.left.contains(event.logicalKey))
            ...events[NesInputEvent.left] ?? [],
          if (mapping.right.contains(event.logicalKey))
            ...events[NesInputEvent.right] ?? [],
          if (mapping.confirm.contains(event.logicalKey))
            ...events[NesInputEvent.confirm] ?? [],
          if (mapping.cancel.contains(event.logicalKey))
            ...events[NesInputEvent.cancel] ?? [],
        ];

        if (listeners.isNotEmpty) {
          for (final listener in listeners) {
            listener();
          }
        }
      }
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }

  @override
  void addListener(FocusNode node, NesInputEvent event, VoidCallback callback) {
    if (!_events.containsKey(node)) {
      node.onKey = _handle;
      _events[node] = {};
    }

    _events[node]?.putIfAbsent(event, () => List.empty(growable: true));
    _events[node]?[event]?.add(callback);
  }

  @override
  void disposeListeners(FocusNode node) {
    _events.remove(node);
    node.onKey = null;
  }
}

///
class NesInputController {
  ///
  const NesInputController({
    required this.adapters,
  });

  ///
  final List<NesInputAdapter> adapters;

  ///
  void addListener(
    FocusNode node,
    NesInputEvent event,
    VoidCallback callback,
  ) {
    for (final adapter in adapters) {
      adapter.addListener(node, event, callback);
    }
  }

  ///
  void disposeListeners(
    FocusNode node,
  ) {
    for (final adapter in adapters) {
      adapter.disposeListeners(node);
    }
  }
}

///
class NesController extends InheritedWidget {
  ///
  const NesController({
    super.key,
    required super.child,
    required this.controller,
  });

  ///
  final NesInputController controller;

  static final _default = NesInputController(
    adapters: [
      NesKeyboardInputAdapter(mapping: const NesKeyboardKeyMapping()),
    ],
  );

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  ///
  static NesInputController of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<NesController>();

    if (widget == null) {
      return _default;
    }

    return widget.controller;
  }
}
