import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_strong_boilerplate/core/theme/app_theme.dart';
import 'package:flutter_strong_boilerplate/core/theme/app_theme_impl.dart';

class ThemeCubit extends Cubit<ThemeData> {
  /// {@macro brightness_cubit}
  ThemeCubit() : super(_lightTheme);

  static final AppTheme _appTheme = AppThemeImpl();

  static final _lightTheme = _appTheme.lightTheme();
  static final _darkTheme = _appTheme.darkTheme();

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}
