import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class ContainerPlaygroundPage extends StatefulWidget {
  const ContainerPlaygroundPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => const ContainerPlaygroundPage(),
    );
  }

  @override
  State<ContainerPlaygroundPage> createState() =>
      _ContainerPlaygroundPageState();
}

class _Option {
  const _Option({required this.label, required this.painterBuilder});

  final String label;
  final NesContainerPainterBuilder painterBuilder;
}

const _options = [
  _Option(
    label: 'Rounded Border',
    painterBuilder: NesContainerRoundedBorderPainter.new,
  ),
  _Option(
    label: 'Square Corner',
    painterBuilder: NesContainerSquareCornerPainter.new,
  ),
  _Option(
    label: 'Corner Inner Square',
    painterBuilder: NesContainerCornerInnerSquarePainter.new,
  ),
];

class _ContainerPlaygroundPageState extends State<ContainerPlaygroundPage> {
  var _option = _options.last;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: flutterNesTheme(
        nesContainerTheme:
            context.nesThemeExtension<NesContainerTheme>().copyWith(
                  painter: _option.painterBuilder,
                ) as NesContainerTheme,
      ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 48),
                NesButton(
                  type: NesButtonType.normal,
                  onPressed: () async {
                    final option = await const _OptionsDialog().show(context);
                    if (option != null) {
                      setState(() {
                        _option = option;
                      });
                    }
                  },
                  child: Text(_option.label),
                ),
                const SizedBox(height: 48),
                const NesContainer(
                  width: 400,
                  label: 'With Label',
                  child: Center(child: Text('NesContainer')),
                ),
                const SizedBox(height: 16),
                const NesContainer(
                  width: 400,
                  child: Center(child: Text('Without Label')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _OptionsDialog extends StatelessWidget {
  const _OptionsDialog();

  Future<_Option?> show(BuildContext context) {
    return NesDialog.show<_Option?>(
      context: context,
      builder: (_) => const _OptionsDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (final option in _options)
              Padding(
                padding: const EdgeInsets.all(16),
                child: NesButton(
                  type: NesButtonType.normal,
                  onPressed: () {
                    Navigator.of(context).pop(option);
                  },
                  child: Text(option.label),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
