import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class NesScaffoldExample extends StatefulWidget {
  const NesScaffoldExample({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const NesScaffoldExample(),
    );
  }

  @override
  State<NesScaffoldExample> createState() => _NesScaffoldExampleState();
}

class _NesScaffoldExampleState extends State<NesScaffoldExample> {
  var _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NesScaffold(
        body: Builder(
          builder: (context) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NesButton(
                    type: NesButtonType.primary,
                    onPressed: () {
                      NesScaffoldMessenger.of(context).showSnackBar(
                        NesSnackbar(
                          text: 'Hello, World! ${_counter++}',
                          type: _counter.isOdd
                              ? NesSnackbarType.success
                              : NesSnackbarType.warning,
                        ),
                        alignment: Alignment.topRight,
                      );
                    },
                    child: const Text('Show Snackbar top Right'),
                  ),
                  const SizedBox(width: 8),
                  NesButton(
                    type: NesButtonType.primary,
                    onPressed: () {
                      NesScaffoldMessenger.of(context).showSnackBar(
                        NesSnackbar(
                          text: 'Hello, World! ${_counter++}',
                          type: _counter.isOdd
                              ? NesSnackbarType.success
                              : NesSnackbarType.warning,
                        ),
                        alignment: Alignment.topLeft,
                      );
                    },
                    child: const Text('Show Snackbar top Left'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
