// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_app/widgetbook/widgetbook.dart';

void main() {
  testWidgets('renders', (WidgetTester tester) async {
    tester.view.physicalSize = Size(2000, 2000);
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(WidgetbookApp());

    expect(find.byType(WidgetbookApp), findsOneWidget);
  });
}
