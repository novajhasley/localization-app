import 'package:bloc_test/bloc_test.dart';
import 'package:ninjatrader_interview/presentation/bloc/theme/theme_bloc.dart';
import 'package:ninjatrader_interview/presentation/bloc/theme/theme_event.dart';
import 'package:ninjatrader_interview/presentation/bloc/theme/theme_state.dart';

void main() {
  blocTest<ThemeBloc, ThemeState>(
    'emits [ThemeDarkState] when [ThemeDarkEvent] is added',
    build: () => ThemeBloc(),
    act: (bloc) => bloc.add(ThemeDarkEvent()),
    expect: () => [ThemeDarkState()],
  );

  blocTest<ThemeBloc, ThemeState>(
    'emits [ThemeLightState] when [ThemeLightEvent] is added',
    build: () => ThemeBloc(),
    act: (bloc) => bloc.add(ThemeLightEvent()),
    expect: () => [ThemeLightState()],
  );
}
