import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ninjatrader_interview/presentation/bloc/theme/theme_event.dart';
import 'package:ninjatrader_interview/presentation/bloc/theme/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeLightState()) {
    on<ThemeDarkEvent>((event, emit) {
      emit(ThemeDarkState());
    });

    on<ThemeLightEvent>((event, emit) {
      emit(ThemeLightState());
    });
  }
}
