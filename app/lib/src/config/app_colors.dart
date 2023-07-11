part of 'app_theme.dart';

abstract class AppColors {
  factory AppColors(Brightness brightness) {
    if (brightness == Brightness.dark) {
      return AppDarkColors();
    }
    // Default
    return AppLightColors();
  }

  static AppColors get of => AppColors(Get.theme.brightness);

  Brightness get brightness;

  MaterialColor get primaryColor;

  MaterialColor get errorColor;

  MaterialColor get neutralColor;

  MaterialColor get processInformColor;

  MaterialColor get successColor;
}

class AppLightColors implements AppColors {
  static const int _primaryValue = 0xFF00A499;
  static const int _errorValue = 0xFFF5222D;
  static const int _neutralValue = 0xFF000D0B;
  static const int _processInformValue = 0xFF0089B6;
  static const int _successColorValue = 0xFF00A100;

  @override
  Brightness get brightness => Brightness.light;

  @override
  MaterialColor get primaryColor => const MaterialColor(
        _primaryValue,
        <int, Color>{
          6: Color(0xFF00867D),
          5: Color(_primaryValue),
        },
      );

  @override
  MaterialColor get errorColor => const MaterialColor(
        _errorValue,
        <int, Color>{
          6: Color(0xFFC91C25),
          5: Color(_errorValue),
        },
      );

  @override
  MaterialColor get neutralColor => const MaterialColor(
        _neutralValue,
        <int, Color>{
          10: Color(_neutralValue),
          5: Color(0xFFBBBCBF),
          4: Color(0xFFD4D5D9),
          3: Color(0xFFEBECF0),
          2: Color(0xFFF5F6FA),
          1: Color(0xFFFFFFFF),
        },
      );

  @override
  MaterialColor get processInformColor => const MaterialColor(
        _processInformValue,
        <int, Color>{
          3: Color(_processInformValue),
        },
      );

  @override
  MaterialColor get successColor => const MaterialColor(
        _successColorValue,
        <int, Color>{
          5: Color(_successColorValue),
        },
      );
}

class AppDarkColors implements AppColors {
  static const int _primaryValue = 0xFF00A499;
  static const int _errorValue = 0xFFF5222D;
  static const int _neutralValue = 0xFF000D0B;
  static const int _processInformValue = 0xFF0089B6;
  static const int _successColorValue = 0xFF00A100;

  @override
  Brightness brightness = Brightness.dark;

  @override
  MaterialColor get primaryColor => const MaterialColor(
        _primaryValue,
        <int, Color>{
          6: Color(0xFF00867D),
          5: Color(_primaryValue),
        },
      );

  @override
  MaterialColor get errorColor => const MaterialColor(
        _errorValue,
        <int, Color>{
          6: Color(0xFFC91C25),
          5: Color(_errorValue),
        },
      );

  @override
  MaterialColor get neutralColor => const MaterialColor(
        _neutralValue,
        <int, Color>{
          10: Color(_neutralValue),
          5: Color(0xFFBBBCBF),
          4: Color(0xFFD4D5D9),
          3: Color(0xFFEBECF0),
          2: Color(0xFFF5F6FA),
          1: Color(0xFFFFFFFF),
        },
      );

  @override
  MaterialColor get processInformColor => const MaterialColor(
        _processInformValue,
        <int, Color>{
          3: Color(_processInformValue),
        },
      );

  @override
  MaterialColor get successColor => const MaterialColor(
        _successColorValue,
        <int, Color>{
          5: Color(_successColorValue),
        },
      );
}
