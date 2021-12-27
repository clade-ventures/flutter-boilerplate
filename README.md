# flutter_strong_boilerplate

[![Generic badge](https://img.shields.io/badge/Flutter-Latest-blue)](https://flutter.dev/docs)
[![Generic badge](https://img.shields.io/badge/Dart-Latest-blue)](https://dart.dev/guides)
[![Generic badge](https://img.shields.io/badge/development-v0.0.1-brightgreen)](https://play.google.com/store/{your_application_id})
[![Generic badge](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

Flutter repository template

## TODOs
- [] BLoC Bases
- [] Core Material Component  
- [] Model Generator
- [] Theme Abstraction (normal, dark, and other)
- [] Linter
- [] Firebase Analytics
- [] Github Actions (CI/CD)
- [] Fastlane
- [] Documentation Bases (Readme.md's)
- [] Flavor & App Config (Endpoints)

## ⚡️ Getting Started

### 🚚 How to run, drive, and build Apk

Example how to run release development app
```
flutter clean
flutter pub get
flutter run -t lib/main_development.dart --release --flavor development
```

Example how to build release development app
```
flutter clean
flutter pub get
flutter build apk -t lib/main_development.dart --release --no-shrink --flavor development --split-per-abi
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
2. production

### 🎯 Architecture & Pattern

Reso coder's fllutter clean architecture

![alt text](https://i0.wp.com/resocoder.com/wp-content/uploads/2019/08/Clean-Architecture-Flutter-Diagram.png?ssl=1)

