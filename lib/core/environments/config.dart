import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_strong_boilerplate/core/environments/flavor.dart';

class Config {
  static Flavor? appFlavor;
  static String? appName;
  static String? packageName;

  ///asset code base
  static String? assetsPath;
  static String? imagesPath;
  static String? iconsPath;

  static Future<void> init(
    Flavor flavor,
  ) async {
    appFlavor = flavor;
    appName = flavor.name;
    assetsPath = baseConfig.assetAbsolutePath;
    imagesPath = '${assetsPath!}/images';
    iconsPath = '${assetsPath!}/icons';

    await Firebase.initializeApp();

    /// Initialization of all services.
    if (kDebugMode && !kIsWeb) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
      // await HiveDataBaseService.init();
    }

    /// Initialize Future variables.

    /// Initialize SystemUI.
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );
  }

  static bool get isDevelopment => appFlavor == Flavor.development;
  static bool get isStaging => appFlavor == Flavor.staging;
  static bool get isProduction => appFlavor == Flavor.production;
  static BaseConfig get baseConfig => _baseConfig()!;

  static BaseConfig? _baseConfig() {
    switch (appFlavor) {
      case Flavor.development:
        return const BaseConfig();
      case Flavor.staging:
        return const BaseConfig();
      case Flavor.production:
        return const BaseConfig();
      case null:
        throw UnimplementedError();
    }
  }
}

class BaseConfig {
  // const BaseConfig({this.assetAbsolutePath = Constants.assetPath});
  const BaseConfig({this.assetAbsolutePath = ''});
  final String assetAbsolutePath;
}
