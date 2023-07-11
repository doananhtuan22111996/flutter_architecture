<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

## Features

- Move all config of project with envirorment (dev, prod).
- Increase security
- Easy to change
- Easy to reuse

## Getting started

1. flutter_native_splash
   - Fork from https://github.com/jonbhanson/flutter_native_splash
   - https://github.com/lux-studio-66/flutter_native_splash.git
     - branch: master
     - Custom info: app_module, path android package generate, path ios package generate
2. flutter_launcher_icons
   - Fork from https://github.com/fluttercommunity/flutter_launcher_icons/
   - https://github.com/lux-studio-66/flutter_launcher_icons.git
     - branch: master
     - Custom info: app_module, path android package generate, path ios package generate

## Usage

1. flutter_native_splash with flavor (dev, prod)

   - Prepare: f`lutter_native_splash-$(flavor).yaml
   - Run the package: flutter pub run flutter_native_splash:create --flavor (dev/prod)
   - Config xcode: Follow document here https://pub.dev/packages/flutter_native_splash

2. flutter_launch_icon with flavor(dev, prod)
   - Prepare: f`lutter_launcher_icons-$(flavor).yaml
   - Run the package: flutter pub run flutter_launcher_icons:main
   - Config xcode:
     - Follow document here https://github.com/fluttercommunity/flutter_launcher_icons
     - Runner Target -> Build Settings-> Asset Catalog Compiler -> Primary App Icon Set Name

## Additional information

1. flutter_launch_icon
   - Refer: https://stackoverflow.com/questions/66112604/how-to-change-flutter-app-icon-depending-on-flavor
