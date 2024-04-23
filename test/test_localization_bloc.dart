import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:ninjatrader_interview/presentation/bloc/localization/localization_bloc.dart';
import 'package:ninjatrader_interview/presentation/bloc/localization/localization_event.dart';
import 'package:ninjatrader_interview/presentation/bloc/localization/localization_state.dart';

void main() {

  blocTest<LocalizationBloc, LocalizationState>(
    'emits [LocaleUpdated] when [SetLocale] is added',
    build: () => LocalizationBloc(),
    act: (bloc) => bloc.add(SetLocale(Locale('en'))),
    expect: () => [LocaleUpdated(Locale('en'))],
  );
}