# Flutter Architecture

Welcome to the Flutter Architecture repository! This project aims to demonstrate and provide a
reference for structuring Flutter applications using best practices in software architecture.

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
- [References](#references)

## Introduction

This repository provides a sample Flutter application showcasing an effective architecture that
promotes scalability, testability, and maintainability. The goal is to help developers understand
and implement robust architectural patterns in their Flutter projects.

## Features

- Clean architecture with separation of concerns
- State management using GetX
- Dependency injection using GetX
- Repository pattern for data access
- Modular and scalable project structure

## Technologies Used

- Flutter
- Dart
- GetX (state management and dependency injection)
- Dio (networking)

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) (version X.X.X or higher)
- [Dart](https://dart.dev/get-dart) (version X.X.X or higher)

### Installation

- Install Flutter 3.22.3 or latest version
- Install **Melos** latest version (Optional)
- Install **fvm** latest version (Optional)

### Environment

- At Config module
- `cd configs`
- Generated: `dart run lib/src/env.json.dart create`
- Generated: `dart run lib/src/web.json.dart create`

### MacOs

- One time: `make denied` (Mac OS)
- PreBuild:
    - `make pre-bootstrap`
    - `make pub-get`
    - `make build-init`
    - `make build-runner`
- Run: `make run flavor=[dev|staging|prod]`

### Window

_If you can not install Melos, Fvm on Windown. You need to follow step by step to ready run source
code_

- **scripts package**
    - cd scripts
    - sh pre-bootstrap.sh
- flutter pub get
- **utilities package**:
    - cd utilities
    - flutter pub get
- **domain package**
    - cd domain
    - flutter pub get
    - flutter packages pub run build_runner build --delete-conflicting-outputs
- **data package**
    - cd data
    - flutter pub get
    - flutter packages pub run build_runner build --delete-conflicting-outputs
- **config package**
    - cd configs
    - flutter pub get
    - flutter packages pub run build_runner build --delete-conflicting-outputs
- **app package**
    - cd app
    - flutter pub get
- Run source
    - cd configs
    - dart run lib/src/env.json.dart [dev|staging|prod]
    - cd ..
    - dart run scripts/build.dart [dev|staging|prod] -> Run complete and copy command on console
    - cd app
    - paste command and run

### WidgetBook

- Widget Book is a web platform to build UIkit. It runs quickly on web instead of run by the mobile
  platform.
- Run Project:
    - One time: `make denied` (Mac OS)
    - PreBuild:
        - `make pre-bootstrap`
        - `make pub-get`
        - `make build-init`
        - `make build-runner`
    - `make widget-book`

## References

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Git-chglog](https://github.com/git-chglog/git-chglog)
- [Firebase](https://console.firebase.google.com/u/0/project/flutterskeleton-c0812/overview)
- [Setup Flavor](https://medium.com/@animeshjain/build-flavors-in-flutter-android-and-ios-with-different-firebase-projects-per-flavor-27c5c5dac10b)
- [GetX](https://pub.dev/packages/get)
- [GetX Storage](https://pub.dev/packages/get_storage)
- [Dio](https://pub.dev/packages/dio)
- [Flutter secure storage](https://pub.dev/packages/flutter_secure_storage)
- [Package Info Plus](https://pub.dev/packages/package_info_plus)
- [Hive](https://pub.dev/packages/hive)
- [Hive Flutter](https://pub.dev/packages/hive_flutter)
- [Firebase Core](https://pub.dev/packages/firebase_core)
- [Firebase Auth](https://pub.dev/packages/firebase_auth)
- [Loader overlay](https://pub.dev/packages/loader_overlay)
- [Pull to refresh](https://pub.dev/packages/pull_to_refresh_plus)
- [Flutter_slidable](https://pub.dev/packages/flutter_slidable)
- [Dropdown Button](https://pub.dev/packages/dropdown_button2)
- [Flutter DateTime Picker](https://pub.dev/packages/flutter_datetime_picker)
