import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

/// {@template nes_scaffold_messenger}
/// Manages widgets displayed by a [NesScaffold].
/// {@endtemplate}
class NesScaffoldMessenger extends StatefulWidget {
  /// {@macro nes_scaffold_messenger}
  const NesScaffoldMessenger({required this.body, super.key});

  /// The primary content of the scaffold.
  final Widget body;

  /// Returns the [NesScaffoldMessengerState] in the scope.
  static NesScaffoldMessengerState of(BuildContext context) {
    return _NesScaffoldMessengerScope.of(context);
  }

  @override
  NesScaffoldMessengerState createState() => NesScaffoldMessengerState();
}

class _SnackbarMessage {
  const _SnackbarMessage({
    required this.id,
    required this.snackbar,
    required this.alignment,
    required this.offset,
    this.markForRemoval = false,
  });

  final int id;
  final NesSnackbar snackbar;
  final Alignment alignment;
  final Offset offset;
  final bool markForRemoval;

  _SnackbarMessage copyWith({
    int? id,
    Alignment? alignment,
    Offset? offset,
    bool? markForRemoval,
  }) {
    return _SnackbarMessage(
      id: id ?? this.id,
      snackbar: snackbar,
      alignment: alignment ?? this.alignment,
      offset: offset ?? this.offset,
      markForRemoval: markForRemoval ?? this.markForRemoval,
    );
  }
}

/// Handles the state of a [NesScaffoldMessenger].
///
/// This class allows the user to show snackbars and etc.
class NesScaffoldMessengerState extends State<NesScaffoldMessenger> {
  late int _snackbarId = 0;
  final List<Timer> _timers = [];

  Future<void> _waitABit() async {
    final completer = Completer<void>();

    late final Timer timer;

    timer = Timer(const Duration(seconds: 3), () {
      completer.complete();
      _timers.remove(timer);
      timer.cancel();
    });

    _timers.add(timer);

    return completer.future;
  }

  /// Adds a [NesSnackbar] to the [NesScaffold].
  void showSnackBar(
    NesSnackbar snackbar, {
    Alignment alignment = Alignment.bottomCenter,
  }) {
    final message = _SnackbarMessage(
      id: _snackbarId++,
      snackbar: snackbar,
      alignment: alignment,
      offset: Offset(alignment.x + alignment.x, alignment.y + alignment.y),
    );
    _snackbars.value = [..._snackbars.value, message];

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _snackbars.value = _snackbars.value.map((e) {
        if (e.id == message.id) {
          return e.copyWith(offset: Offset.zero);
        }
        return e;
      }).toList();
    });

    _waitABit().then((_) {
      _snackbars.value = _snackbars.value.map((e) {
        if (e.id == message.id) {
          return e.copyWith(
            markForRemoval: true,
            offset: Offset(
              alignment.x + alignment.x,
              alignment.y + alignment.y,
            ),
          );
        }
        return e;
      }).toList();
    });

    _overlayController.show();
  }

  late final _snackbars = ValueNotifier<List<_SnackbarMessage>>([]);
  late final _overlayController = OverlayPortalController();

  void _checkForRemovals() {
    _snackbars.value = _snackbars.value.where((element) {
      return !element.markForRemoval;
    }).toList();
  }

  @override
  void dispose() {
    super.dispose();

    for (final timer in _timers) {
      timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _NesScaffoldMessengerScope(
      state: this,
      child: OverlayPortal(
        overlayChildBuilder: (context) {
          return ValueListenableBuilder<List<_SnackbarMessage>>(
            valueListenable: _snackbars,
            builder: (context, snackbars, child) {
              final values = List<_SnackbarMessage>.from(snackbars)
                ..sort((a, b) {
                  return a.id.compareTo(b.id);
                });
              return Stack(
                children: [
                  for (var i = 0; i < values.length; i++)
                    Align(
                      alignment: values[i].alignment,
                      child: AnimatedSlide(
                        key: ValueKey('slide_${values[i].id}'),
                        onEnd: _checkForRemovals,
                        duration: const Duration(milliseconds: 300),
                        offset: values[i].offset,
                        child: AnimatedPadding(
                          key: ValueKey('padding_${values[i].id}'),
                          duration: const Duration(milliseconds: 300),
                          padding: EdgeInsets.only(
                            top: 32 * i + 16,
                            left: 16,
                            right: 16,
                          ),
                          child: NesDropshadow(child: snackbars[i].snackbar),
                        ),
                      ),
                    ),
                ],
              );
            },
          );
        },
        controller: _overlayController,
        child: widget.body,
      ),
    );
  }
}

class _NesScaffoldMessengerScope extends InheritedWidget {
  const _NesScaffoldMessengerScope({required super.child, required this.state});

  final NesScaffoldMessengerState state;

  /// Returns the current message.
  static NesScaffoldMessengerState of(BuildContext context) {
    final result = context
        .dependOnInheritedWidgetOfExactType<_NesScaffoldMessengerScope>()
        ?.state;

    if (result == null) {
      throw FlutterError(
        'NesScaffoldMessenger.of() called with a context that does not contain '
        'a NesScaffoldMessenger.\n'
        'No NesScaffoldMessengerState ancestor could be found starting from '
        'the context that was passed to NesScaffoldMessenger.of().\n'
        'The context used was:\n'
        '  $context',
      );
    }

    return result;
  }

  @override
  bool updateShouldNotify(_NesScaffoldMessengerScope oldWidget) =>
      state != oldWidget.state;
}

/// {@template nes_scaffold}
/// A Nes UI system scaffold widget.
///
/// Right now it doesn't replace the [Scaffold] widget, so we
/// advise to use it in combination with Material's [Scaffold].
///
/// That might change as we develop the library.
///
/// To interact with the [NesScaffold] state, use a [NesScaffoldMessenger].
///
/// {@endtemplate}
class NesScaffold extends StatelessWidget {
  /// {@macro nes_scaffold}
  const NesScaffold({required this.body, super.key});

  /// The primary content of the scaffold.
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return NesScaffoldMessenger(body: body);
  }
}
