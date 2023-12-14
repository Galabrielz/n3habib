import 'package:flutter_test/flutter_test.dart';

import 'package:habibi/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
  });
}
