import 'package:example/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nes_ui/nes_ui.dart';

class NesScaffold extends StatelessWidget {
  const NesScaffold({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AppCubit>();
    final state = cubit.state;
    return Scaffold(
      floatingActionButton: NesButton(
        type: NesButtonType.normal,
        onPressed: cubit.toogleLightMode,
        child: state.lightMode
            ? NesIcon(iconData: NesIcons.instance.sun)
            : NesIcon(iconData: NesIcons.instance.moon),
      ),
      body: child,
    );
  }
}
