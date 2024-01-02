// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook_app/widgetbook/widgetbook.dart';

void main() {
  testWidgets('renders', (WidgetTester tester) async {
    await tester.pumpWidget(WidgetbookApp());

    expect(find.byType(WidgetbookApp), findsOneWidget);
  });
}
