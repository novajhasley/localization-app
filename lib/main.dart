import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjatrader_interview/presentation/bloc/localization/localization_bloc.dart';
import 'package:ninjatrader_interview/presentation/bloc/localization/localization_state.dart';
import 'package:ninjatrader_interview/presentation/bloc/theme/theme_bloc.dart';
import 'package:ninjatrader_interview/presentation/bloc/theme/theme_state.dart';
import 'package:ninjatrader_interview/presentation/screens/main_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LocalizationBloc()),
        BlocProvider(create: (context) => ThemeBloc()),
      ],
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
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (themeContext, theme) {
        return BlocBuilder<LocalizationBloc, LocalizationState>(
          builder: (context, state) {
            Locale locale = const Locale('en');
            if (state is LocaleUpdated) {
              locale = state.locale;
            }
            return MaterialApp(
              title: 'NinjaTrader Interview',
              debugShowCheckedModeBanner: false,
              theme: theme.themeData,
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
      },
    );
  }
}
