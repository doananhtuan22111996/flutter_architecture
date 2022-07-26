part of 'app_theme.dart';

abstract class AppColors extends Colors {
  factory AppColors(AppTheme theme) {
    if (theme == AppTheme.lightTheme) {
      return AppCollection1Colors();
    }
    if (theme == AppTheme.dartTheme) {
      return AppCollection2Colors();
    }
    throw 'Can\'t create $theme.';
  }

  Color get primaryColor;

  Color get neutralColor;

  Color get backgroundColor;

  Color get buttonColor;

  Color get disableColor;

  Color get dialogColor;

  Color get errorColor;

  // MaterialColor get neutral;

  // MaterialColor get yellow;

  // MaterialColor get red;

  // MaterialColor get blue;

  // MaterialColor get green;
}

class AppCollection1Colors implements AppColors {
  static const int _primaryValue = 0xFF1164E4;
  static const int _secondaryValue = 0xFFF63B3B;
  static const int _neutralValue = 0xFF101010;
  static const int _backgroundValue = 0xFFEFEFEF;
  static const int _buttonValue = 0xFFE52013;
  static const int _blueValue = 0xFF1164E4;
  static const int _greenValue = 0xFF1CC174;
  static const int _disableValue = 0xFFFFABAB;
  static const int _dialogValue = 0xFFFDF050;
  static const int _errorValue = 0xFFF85F5F;

  @override
  Color get primaryColor => const Color(_primaryValue);

  @override
  Color get neutralColor => const Color(_neutralValue);

  @override
  Color get backgroundColor => const Color(_backgroundValue);

  @override
  Color get buttonColor => const Color(_buttonValue);

  @override
  Color get disableColor => const Color(_disableValue);

  @override
  Color get dialogColor => const Color(_dialogValue);

  @override
  Color get errorColor => const Color(_errorValue);

  // @override
  // MaterialColor get neutral => const MaterialColor(
  //       _neutralValue,
  //       <int, Color>{
  //         100: Color(0xFFFFFFFF),
  //         200: Color(0xFFF2F2F2),
  //         300: Color(0xFFE9E9E9),
  //         310: Color(0xFFD9D9D9),
  //         400: Color(0xFFDCDCDC),
  //         500: Color(0xFF9F9F9D),
  //         600: Color(0xFF7C7C79),
  //         700: Color(0xFF454442),
  //         800: Color(0xFF222220),
  //         900: Color(_neutralValue),
  //       },
  //     );

  // @override
  // MaterialColor get yellow => const MaterialColor(_primaryValue, <int, Color>{
  //       100: Color(0xFFFFFDDE),
  //       300: Color(0xFFFFFAC2),
  //       400: Color(0xFFF1C143),
  //       700: Color(0xFFFCF27C),
  //       800: Color(0xFFFDF050),
  //       900: Color(0xFFF5CE00),
  //     });

  // @override
  // MaterialColor get red => const MaterialColor(_secondaryValue, <int, Color>{
  //       100: Color(0xFFFFE9E9),
  //       300: Color(0xFFFFABAB),
  //       700: Color(0xFFF85F5F),
  //       800: Color(0xFFF63B3B),
  //       900: Color(0xFFE52013),
  //       // 600: Color(0xFFE83126),
  //     });

  // @override
  // MaterialColor get blue => const MaterialColor(_blueValue, <int, Color>{
  //       200: Color(0xFFDFECFF),
  //       600: Color(0xFF69A4FF),
  //       700: Color(0xFF2E7CF6),
  //       800: Color(0xFF1164E4),
  //       900: Color(0xFF0350C7),
  //     });

  // @override
  // MaterialColor get green => const MaterialColor(_greenValue, <int, Color>{
  //       200: Color(0xFFCCF9DC),
  //       300: Color(0xFFADF6C8),
  //       700: Color(0xFF39D673),
  //       800: Color(0xFF1CC174),
  //       900: Color(0xFF09A35B),
  //     });
}

class AppCollection2Colors implements AppColors {
  static const int _primaryValue = 0xFFE52013;
  static const int _secondaryValue = 0xFFF63B3B;
  static const int _neutralValue = 0xFFE9E9E9;
  static const int _backgroundValue = 0xFF1CC174;
  static const int _buttonValue = 0xFF1164E4;
  static const int _blueValue = 0xFF1164E4;
  static const int _greenValue = 0xFF1CC174;
  static const int _disableValue = 0xFFDFECFF;
  static const int _dialogValue = 0xFF0350C7;
  static const int _errorValue = 0xFFF85F5F;

  @override
  Color get primaryColor => const Color(_primaryValue);

  @override
  Color get neutralColor => const Color(_neutralValue);

  @override
  Color get backgroundColor => const Color(_backgroundValue);

  @override
  Color get buttonColor => const Color(_buttonValue);

  @override
  Color get disableColor => const Color(_disableValue);

  @override
  Color get dialogColor => const Color(_dialogValue);

  @override
  Color get errorColor => const Color(_errorValue);

  // @override
  // MaterialColor get neutral => const MaterialColor(
  //       _neutralValue,
  //       <int, Color>{
  //         100: Color(0xFFFFFFFF),
  //         200: Color(0xFFF2F2F2),
  //         300: Color(0xFFE9E9E9),
  //         310: Color(0xFFD9D9D9),
  //         400: Color(0xFFDCDCDC),
  //         500: Color(0xFF9F9F9D),
  //         600: Color(0xFF7C7C79),
  //         700: Color(0xFF454442),
  //         800: Color(0xFF222220),
  //         900: Color(_neutralValue),
  //       },
  //     );

  // @override
  // MaterialColor get yellow => const MaterialColor(_primaryValue, <int, Color>{
  //       100: Color(0xFFFFFDDE),
  //       300: Color(0xFFFFFAC2),
  //       400: Color(0xFFF1C143),
  //       700: Color(0xFFFCF27C),
  //       800: Color(0xFFFDF050),
  //       900: Color(0xFFF5CE00),
  //     });

  // @override
  // MaterialColor get red => const MaterialColor(_secondaryValue, <int, Color>{
  //       100: Color(0xFFFFE9E9),
  //       300: Color(0xFFFFABAB),
  //       700: Color(0xFFF85F5F),
  //       800: Color(0xFFF63B3B),
  //       900: Color(0xFFE52013),
  //       // 600: Color(0xFFE83126),
  //     });

  // @override
  // MaterialColor get blue => const MaterialColor(_blueValue, <int, Color>{
  //       200: Color(0xFFDFECFF),
  //       600: Color(0xFF69A4FF),
  //       700: Color(0xFF2E7CF6),
  //       800: Color(0xFF1164E4),
  //       900: Color(0xFF0350C7),
  //     });

  // @override
  // MaterialColor get green => const MaterialColor(_greenValue, <int, Color>{
  //       200: Color(0xFFCCF9DC),
  //       300: Color(0xFFADF6C8),
  //       700: Color(0xFF39D673),
  //       800: Color(0xFF1CC174),
  //       900: Color(0xFF09A35B),
  //     });
}
