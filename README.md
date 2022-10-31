# flutter_skeleton

Flutter Skeleton

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Firebase](https://console.firebase.google.com/u/0/project/flutterskeleton-c0812/overview)
- [Setup Flavor](hhttps://medium.com/@animeshjain/build-flavors-in-flutter-android-and-ios-with-different-firebase-projects-per-flavor-27c5c5dac10b)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Note
    Ios doesn't register bundle_id on Apple Developer so FirebaseApp config not complete. 

### Android
    - Target Version: SDK 32
    - Min Version: SDK 23
### IOS
    - Target Version: ...
    - Min Version: ...
### Env Config
    - Dev
    - Prod
### Clean Architecture Pattern
    - App Module
    - Data Module
    - Domain Module 
### Dependency Injection
    - GetX
#### UI Layer
    - GetX
    - Localization: vi, en
    - Theme: Light, Dark
    - Material Design 3

#### Components
    - AppMainWidget
    - AppTextWidget
    - AppFilledButtonWidget
    - AppOutlineButtonWidget
    - AppIconWidget
    - AppIconButtonWidget
    - AppTextFieldWidget
    - AppDropDownWidget
    - AppBarWidget
    - AppTextOutlinedWidget
    - AppToastWidget
    - AppSnackBarWidget
    - AppRadioWidget
    - AppSlidableBarWidget
    - AppLoadingWidget
    - AppDialogDefaultWidget
    - AppDialogScreenWidget
    - AppListWidget
#### Data Layer
    - Network: GetConnect
    - Database: Hive
    - Local storage: GetStorage, EncriptSharePreference

#### Doing
    - Refresh Token
    - Customize Component

#### Packages

- [GetX](https://pub.dev/packages/get)
- [GetX Storage](https://pub.dev/packages/get_storage)
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

## Database
Note: Lưu ý khi pull code mới từ master. Cần delele file base_vo.g.dart (lib/data/entities/base_vo.g.dart). Tránh conflict với file đã gen ra trước đó.
* Generate DB: `flutter packages pub run build_runner build`