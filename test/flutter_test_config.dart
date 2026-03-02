import 'dart:async';
import 'dart:io';

import 'package:alchemist/alchemist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nes_ui/nes_ui.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();

  final enablePlatformTests = !Platform.environment.containsKey(
    'GITHUB_ACTIONS',
  );
  return AlchemistConfig.runWithConfig(
    config: AlchemistConfig(
      theme: flutterNesTheme(),
      platformGoldensConfig: AlchemistConfig.current()
          .platformGoldensConfig
          .copyWith(enabled: enablePlatformTests),
    ),
    run: testMain,
  );
}
