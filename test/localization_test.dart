// localization_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ninjatrader_interview/classes/language_constants.dart';

void main() {
  testWidgets('Localization test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            body: Text(translation(context).helloUser),
          );
        },
      ),
    ));

    expect(find.text('Hello, user!'), findsOneWidget);

    await tester.binding.setLocale('es', '');
    await tester.pump();

    expect(find.text('¡Hola, usuario!'), findsOneWidget);
  });
}
