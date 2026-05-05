// This is a basic Flutter widget test.

import 'package:flutter_test/flutter_test.dart';

import 'package:kiemtragiuaki/main.dart';

void main() {
  testWidgets('App opens on About page', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Về chúng tôi'), findsOneWidget);
  });
}
