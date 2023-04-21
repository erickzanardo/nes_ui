import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';

extension NesUIScreenSizeTester on WidgetTester {
  Future<void> setDisplaySize(Size size) async {
    await binding.setSurfaceSize(size);
    addTearDown(() {
      view.resetPhysicalSize();
    });
  }
}
