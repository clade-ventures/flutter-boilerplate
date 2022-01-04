import 'package:flutter/material.dart';

/// Abstraction for material theme.
abstract class AppTheme {
  ThemeData lightTheme();
  ThemeData darkTheme();

  // TODO(any): Specify if you have another theme.
  // ex: ThemeData auto();
}
