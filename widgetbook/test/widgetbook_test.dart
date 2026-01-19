import 'package:flutter_test/flutter_test.dart';
import 'package:widgetbook/test.dart';
import 'package:widgetbook_workspace/widgetbook.config.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await testWidgetbook(config);
}
