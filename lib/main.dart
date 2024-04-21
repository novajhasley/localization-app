import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjatrader_interview/presentation/bloc/localization/localization_bloc.dart';
import 'package:ninjatrader_interview/presentation/bloc/localization/localization_state.dart';
import 'package:ninjatrader_interview/presentation/screens/main_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => LocalizationBloc(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (context, state) {
        Locale locale = const Locale('en');
        if (state is LocaleUpdated) {
          locale = state.locale;
        }
        return MaterialApp(
          title: 'NinjaTrader Interview',
          debugShowCheckedModeBanner: false,
          locale: locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              builder: (context) => const MainPage(),
              settings: settings,
            );
          },
          home: const MainPage(),
        );
      },
    );
  }
}
