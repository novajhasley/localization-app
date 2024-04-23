import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjatrader_interview/presentation/bloc/theme/theme_event.dart';
import 'package:ninjatrader_interview/presentation/bloc/theme/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeLightState()) {
    on<ThemeDarkEvent>((event, emit) {
      try {
        emit(ThemeDarkState());
      } catch (e) {
        print('Failed to switch to dark theme: $e');
      }
    });

    on<ThemeLightEvent>((event, emit) {
      try {
        emit(ThemeLightState());
      } catch (e) {
        print('Failed to switch to light theme: $e');
      }
    });
  }
}
