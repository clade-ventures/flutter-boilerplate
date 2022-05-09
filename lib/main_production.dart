import 'package:flutter/material.dart';
import 'app.dart';
import 'core/environments/config.dart';
import 'core/environments/flavor.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Config.init(Flavor.production);
  const rootWidget = App();
  runApp(rootWidget);
}
