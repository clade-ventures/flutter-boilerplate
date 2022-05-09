import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'base_colors.dart';

/// Implementation for app material theme.
class AppThemeImpl implements AppTheme {
  // TODO(Any): Specify dark theme.
  @override
  ThemeData darkTheme() {
    return ThemeData(
      primarySwatch: BaseColors.materialBlack,
      brightness: Brightness.dark,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.black,
      ),
    );
  }

  // TODO(Any): Specify light theme.
  @override
  ThemeData lightTheme() {
    return ThemeData(
      primarySwatch: BaseColors.materialPrimary,
      brightness: Brightness.light,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.white,
      ),
    );
  }
}
