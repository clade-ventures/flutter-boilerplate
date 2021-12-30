import 'package:flutter/material.dart';
import 'package:flutter_strong_boilerplate/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const rootWidget = App();
  runApp(rootWidget);
}