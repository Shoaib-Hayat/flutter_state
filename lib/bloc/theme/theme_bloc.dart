import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(
    const ThemeState(
      isDark: false,
    ),
  ) {
    on<ToggleTheme>(_toggleTheme);
  }

  void _toggleTheme(
      ToggleTheme event,
      Emitter<ThemeState> emit,
      ) {
    emit(
      ThemeState(
        isDark: !state.isDark,
      ),
    );
  }
}