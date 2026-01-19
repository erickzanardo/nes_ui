import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:nes_ui/src/widgets/nes_button.dart';

part 'nes_button.dart.stories.book.dart';

const meta = Meta<NesButton>(
  docs:
      'The NES Button is a customizable button widget that adheres to the NES UI design principles. It can be used to trigger actions or navigate within the application.',
);

final $Default = _Story(
  name: 'Default',
  args: _Args(
    child: ConstArg(const Text('Button')),
    onPressUp: Arg.fixed(() {}),
  ),
  scenarios: [
    _Scenario(name: 'Disabled'),
    _Scenario(
      name: 'Enabled',
      modes: [
        MaterialThemeMode('dark', flutterNesTheme(brightness: Brightness.dark)),
      ],
      run: (tester, args) async {},
      args: _Args(
        child: ConstArg(const Text('Enabled Button')),
        onPressUp: Arg.fixed(() {}),
      ),
    ),
  ],
);

final $Disabled = _Story(
  name: 'Default',
  args: _Args(child: ConstArg(const Text('Button'))),
);

final $Secondary = _Story(
  name: 'Secondary',
  args: _Args(
    type: Arg.fixed(NesButtonType.normal),
    child: ConstArg(const Text('Secondary Button')),
  ),
);
