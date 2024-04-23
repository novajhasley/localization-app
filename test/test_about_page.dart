import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:ninjatrader_interview/presentation/screens/about_page.dart';

void main() {
  testWidgets('AboutPage renders correctly', (WidgetTester tester) async {
    // Build the AboutPage widget
    await tester.pumpWidget(MaterialApp(home: AboutPage()));

    // Verify that the AboutPage widget is displayed
    expect(find.byType(AboutPage), findsOneWidget);
  });
}
