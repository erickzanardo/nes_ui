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
      LogicalKeyboardKey.gameButtonA,
    ],
    this.cancel = const [
      LogicalKeyboardKey.escape,
      LogicalKeyboardKey.gameButtonB,
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

/// {@template nes_input_adapter}
/// Base class for Nes UI controller adapters. Implement it
/// to add a new adapter to the library.
/// {@endtemplate}
abstract class NesInputAdapter {
  /// {@macro nes_input_adapter}
  NesInputAdapter();

  /// Adds a listener to the adapter.
  void addListener(
    FocusNode node,
    NesInputEvent event,
    VoidCallback callback,
  );

  /// Disposes all listeners on the adapater.
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

  KeyEventResult _handle(FocusNode node, KeyEvent event) {
    final events = _events[node];
    if (events != null) {
      if (event is KeyUpEvent) {
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
      _events[node] = {};
    }

    _events[node]?.putIfAbsent(event, () => List.empty(growable: true));
    _events[node]?[event]?.add(callback);
  }

  @override
  void disposeListeners(FocusNode node) {
    _events.remove(node);
  }
}

/// {@template nes_input_controller}
/// The central class that controls all controller adapters of Nes UI.
///
/// Use [NesController.of] to obtain an instance of it.
/// {@endtemplate}
class NesInputController {
  /// {@macro nes_input_controller}
  const NesInputController({
    required this.adapters,
  });

  /// All adapters on this controller.
  final List<NesInputAdapter> adapters;

  /// Add a listener to the adapters.
  void addListener(
    FocusNode node,
    NesInputEvent event,
    VoidCallback callback,
  ) {
    for (final adapter in adapters) {
      adapter.addListener(node, event, callback);
    }
  }

  /// Remove all listeners from the given [node].
  void disposeListeners(
    FocusNode node,
  ) {
    for (final adapter in adapters) {
      adapter.disposeListeners(node);
    }
  }

  /// Process keyboard inputs events.
  KeyEventResult processKeyBoardInput(FocusNode node, KeyEvent event) {
    final keyboardAdapters = adapters.whereType<NesKeyboardInputAdapter>();
    for (final adapter in keyboardAdapters) {
      return adapter._handle(node, event);
    }
    return KeyEventResult.ignored;
  }
}

/// {@template nes_controller}
/// Provides a [NesInputController] down the widget tree.
///
/// Call [NesController.of] to get the instance, when no [NesInputController]
/// is found on the widget tree, [NesController.defaultController] is returned.
/// {@endtemplate}
class NesController extends InheritedWidget {
  /// {@macro nes_controller}
  const NesController({
    super.key,
    required super.child,
    required this.controller,
  });

  /// The controller of this widget.
  final NesInputController controller;

  /// Default instance.
  static final defaultController = NesInputController(
    adapters: [
      NesKeyboardInputAdapter(mapping: const NesKeyboardKeyMapping()),
    ],
  );

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  /// {@macro nes_controller}
  static NesInputController of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<NesController>();

    if (widget == null) {
      return defaultController;
    }

    return widget.controller;
  }
}
