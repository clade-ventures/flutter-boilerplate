# Flutter Boilerplate

[![Generic badge](https://img.shields.io/badge/Flutter-Latest-blue)](https://flutter.dev/docs)
[![Generic badge](https://img.shields.io/badge/Dart-Latest-blue)](https://dart.dev/guides)
[![test](https://github.com/clade-ventures/flutter-boilerplate/actions/workflows/test.yaml/badge.svg?branch=main)](https://github.com/clade-ventures/flutter-boilerplate/actions/workflows/test.yaml)
[![Generic badge](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

Flutter repository template

## TODOs
- [ ] BLoC Bases
- [ ] Core Material Component
- [X] Example Feature (Include Unit Test)  
- [ ] Model Generator
- [X] Theme Abstraction (normal, dark, and other)
- [X] Linter
- [X] Firebase Analytics
- [X] Firebase Crashlytics
- [ ] Github Actions (CI/CD)
- [ ] Fastlane
- [ ] Documentation Bases (Readme.md's)
- [X] Flavor & App Config (Endpoints)

## ⚡️Getting Started

### 🚚 How to run, drive, and build Apk

Example how to run release development app
```shell
flutter clean
flutter pub get
flutter run -t lib/main_development.dart --release --flavor development
```
If you want to run with different flavor change development to specific flavor. for ex:
```shell
flutter run -t lib/main_staging.dart --release --flavor staging
flutter run -t lib/main_production.dart --release --flavor production
```

Example how to build release development app
```
flutter clean
flutter pub get
flutter build apk -t lib/main_development.dart --release --no-shrink --flavor development --split-per-abi
```
If you want to build with different flavor change development to specific flavor. for ex:
```shell
flutter build apk -t lib/main_staging.dart --release --no-shrink --flavor staging --split-per-abi
flutter build apk -t lib/main_production.dart --release --no-shrink --flavor production --split-per-abi
```

Example how to run flutter web app
```
flutter run -t lib/main_development.dart -d chrome
```

Example how to drive automation test on development environment
note that automation test doesn't support release mode
```
flutter drive -t test_driver/app.dart --flavor development
```

### ⚙️ Supported Flavor

1. development
2. staging
3. production

### 🎯 Architecture & Pattern

Reso coder's fllutter clean architecture

![alt text](https://i0.wp.com/resocoder.com/wp-content/uploads/2019/08/Clean-Architecture-Flutter-Diagram.png?ssl=1)

### 🧬️ State Management

Using [flutter BLoC](https://pub.dev/packages/flutter_bloc) for Business Logic Component Design Pattern.
