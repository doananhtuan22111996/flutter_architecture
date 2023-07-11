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

- Package manage resource for project such as: assets (pngs, svgs,...), localization (en, vi)

## Getting started

- [Flutter Gen](https://pub.dev/packages/flutter_gen)
- [Intl](https://pub.dev/packages/intl)
- [Intl Utils](https://pub.dev/packages/intl_utils)

## Usage

- Config intl.
- Install flutter_gen: "dart pub global activate flutter_gen"
- Generate assets (svgs, pngs): "flutter packages pub run build_runner build"

```dart
const svg = R.svg.fire.path;
const png = R.png.appIcon.path;
```

## Additional information
- Next version: 
  - include: Assets (fonts)

