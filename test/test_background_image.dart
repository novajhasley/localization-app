import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:ninjatrader_interview/presentation/screens/about_page.dart';
import 'package:ninjatrader_interview/presentation/widgets/background_image.dart';

void main() {
  testWidgets('BackgroundImage widget is present in AboutPage', (WidgetTester tester) async {
    // Build the AboutPage widget
    await tester.pumpWidget(MaterialApp(home: AboutPage()));

    // Verify that the BackgroundImage widget is displayed
    expect(find.byType(BackgroundImage), findsOneWidget);
  });
}