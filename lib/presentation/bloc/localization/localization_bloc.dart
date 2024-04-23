import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjatrader_interview/presentation/bloc/localization/localization_event.dart';
import 'package:ninjatrader_interview/presentation/bloc/localization/localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc() : super(LocaleUpdated(const Locale('en'))) {
    on<SetLocale>((event, emit) {
      emit(LocaleUpdated(event.locale));
    });
  }

  Stream<LocalizationState> mapEventToState(LocalizationEvent event) async* {
    if (event is SetLocale) {
      try {
        // Potentially unsafe operation goes here
        // For example, a network request
        yield LocaleUpdated(event.locale);
      } catch (e) {
        // Handle the error and yield an error state
        print(e.toString());
      }
    }
  }
}
