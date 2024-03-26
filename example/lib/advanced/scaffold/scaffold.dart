import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class NesScaffoldExample extends StatelessWidget {
  const NesScaffoldExample({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(
      builder: (_) => const NesScaffoldExample(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NesScaffold(
        body: Center(
          child: Text('Hello, World!'),
        ),
      ),
    );
  }
}
