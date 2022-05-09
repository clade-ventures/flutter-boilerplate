import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import '../../../../app.dart';
import '../../../theme/base_colors.dart';

class Messenger {
  // TODO(any): create no connection messenger.
  static void noConnection(BuildContext context, VoidCallback callback) {}

  /// Flushbar Messenger error without passing the context
  /// X mean exclude context :)
  static void errorX(String message) {
    Flushbar<void>(
      icon: const Icon(Icons.info_outline, color: Colors.white),
      duration: const Duration(milliseconds: 1800),
      backgroundColor: BaseColors.danger,
      message: message,
    ).show(ctx!);
  }

  /// Flushbar Messenger success without passing the context
  /// X mean exclude context :)
  static void successX(String message) {
    final primaryColor = Theme.of(ctx!).primaryColor;
    Flushbar<void>(
      icon: const Icon(Icons.check, color: Colors.white),
      duration: const Duration(milliseconds: 1800),
      backgroundColor: primaryColor,
      message: message,
    ).show(ctx!);
  }
}
