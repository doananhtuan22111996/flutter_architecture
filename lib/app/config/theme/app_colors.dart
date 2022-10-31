part of 'app_theme.dart';

abstract class AppColors extends Colors {
  factory AppColors(Brightness brightness) {
    if (brightness == Brightness.light) {
      return AppLightColors();
    }
    if (brightness == Brightness.dark) {
      return AppDarkColors();
    }

    // Default
    return AppLightColors();
  }

  static AppColors get() {
    return AppColors(Get.theme.brightness);
  }

  Brightness get brightness;

  Color get primaryColor;

  Color get secondaryColor;

  Color get tertiaryColor;

  MaterialColor get errorColor;

  MaterialColor get waringColor;

  MaterialColor get successColor;

  MaterialColor get infoColor;

  MaterialColor get neutralColor;
}

class AppLightColors implements AppColors {
  static const int _primaryValue = 0xFF1D842E;
  static const int _secondaryValue = 0xFFFFCC00;
  static const int _tertiaryValue = 0xFFF26F23;
  static const int _errorValue = 0xFFFF0000;
  static const int _waringValue = 0xFFFBA51D;
  static const int _successValue = 0xFF1AAF32;
  static const int _infoValue = 0xFF0085FF;
  static const int _neutralValue = 0xFF1A1C19;

  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get primaryColor => const Color(_primaryValue);

  @override
  Color get secondaryColor => const Color(_secondaryValue);

  @override
  Color get tertiaryColor => const Color(_tertiaryValue);

  @override
  MaterialColor get errorColor => const MaterialColor(
        _errorValue,
        <int, Color>{
          100: Color(_errorValue),
          60: Color(0xFFDE3730),
          40: Color(0xFFFF5449),
          10: Color(0xFFFFDAD6),
        },
      );

  @override
  MaterialColor get waringColor => const MaterialColor(
        _waringValue,
        <int, Color>{
          100: Color(_waringValue),
          40: Color(0xFFFDDBA5),
          10: Color(0xFFFFF6E8),
        },
      );

  @override
  MaterialColor get successColor => const MaterialColor(
        _successValue,
        <int, Color>{
          100: Color(_successValue),
          5: Color(0xFFE3F6DD),
        },
      );

  @override
  MaterialColor get infoColor => const MaterialColor(
        _infoValue,
        <int, Color>{
          100: Color(_infoValue),
          5: Color(0xFFF0F8FF),
        },
      );

  @override
  MaterialColor get neutralColor => const MaterialColor(
        _neutralValue,
        <int, Color>{
          100: Color(_neutralValue),
          80: Color(0xFF454743),
          60: Color(0xFF767873),
          40: Color(0xFFAAACA6),
          30: Color(0xFFC6C7C1),
          20: Color(0xFFE2E3DD),
          10: Color(0xFFF0F1EB),
          0: Color(0xFFFFFFFF),
        },
      );
}

class AppDarkColors implements AppColors {
  static const int _primaryValue = 0xFF1D842E;
  static const int _secondaryValue = 0xFFFFCC00;
  static const int _tertiaryValue = 0xFFF26F23;
  static const int _errorValue = 0xFFFF0000;
  static const int _waringValue = 0xFFFBA51D;
  static const int _successValue = 0xFF1AAF32;
  static const int _infoValue = 0xFF0085FF;
  static const int _neutralValue = 0xFF1A1C19;

  @override
  Brightness get brightness => Brightness.dark;

  @override
  Color get primaryColor => const Color(_primaryValue);

  @override
  Color get secondaryColor => const Color(_secondaryValue);

  @override
  Color get tertiaryColor => const Color(_tertiaryValue);

  @override
  MaterialColor get errorColor => const MaterialColor(
        _errorValue,
        <int, Color>{
          100: Color(_errorValue),
          60: Color(0xFFDE3730),
          40: Color(0xFFFF5449),
          10: Color(0xFFFFDAD6),
        },
      );

  @override
  MaterialColor get waringColor => const MaterialColor(
        _waringValue,
        <int, Color>{
          100: Color(_waringValue),
          40: Color(0xFFFDDBA5),
          10: Color(0xFFFFF6E8),
        },
      );

  @override
  MaterialColor get successColor => const MaterialColor(
        _successValue,
        <int, Color>{
          100: Color(_successValue),
          5: Color(0xFFE3F6DD),
        },
      );

  @override
  MaterialColor get infoColor => const MaterialColor(
        _infoValue,
        <int, Color>{
          100: Color(_infoValue),
          5: Color(0xFFF0F8FF),
        },
      );

  @override
  MaterialColor get neutralColor => const MaterialColor(
        _neutralValue,
        <int, Color>{
          100: Color(_neutralValue),
          80: Color(0xFF454743),
          60: Color(0xFF767873),
          40: Color(0xFFAAACA6),
          30: Color(0xFFC6C7C1),
          20: Color(0xFFE2E3DD),
          10: Color(0xFFF0F1EB),
          0: Color(0xFFFFFFFF),
        },
      );
}
