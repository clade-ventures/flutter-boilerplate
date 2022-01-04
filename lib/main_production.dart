import 'package:flutter/material.dart';
import 'package:flutter_strong_boilerplate/app.dart';
import 'package:flutter_strong_boilerplate/core/environments/config.dart';
import 'package:flutter_strong_boilerplate/core/environments/flavor.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Config.init(Flavor.production);
  const rootWidget = App();
  runApp(rootWidget);
}
