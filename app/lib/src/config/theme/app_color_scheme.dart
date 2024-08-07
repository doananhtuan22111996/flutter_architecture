part of '../app_theme_ext.dart';

// https://m3.material.io/styles/color/system/overview
class _MaterialTheme {
  const _MaterialTheme();

  static _MaterialScheme lightScheme() {
    return const _MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff68548e),
      surfaceTint: Color(0xff68548e),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffebddff),
      onPrimaryContainer: Color(0xff230f46),
      secondary: Color(0xff635b70),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe9def8),
      onSecondaryContainer: Color(0xff1f182b),
      tertiary: Color(0xff7e525d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffd9e1),
      onTertiaryContainer: Color(0xff31101b),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfffef7ff),
      onBackground: Color(0xff1d1b20),
      surface: Color(0xfffef7ff),
      onSurface: Color(0xff1d1b20),
      surfaceVariant: Color(0xffe7e0eb),
      onSurfaceVariant: Color(0xff49454e),
      outline: Color(0xff7a757f),
      outlineVariant: Color(0xffcbc4cf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff322f35),
      inverseOnSurface: Color(0xfff5eff7),
      inversePrimary: Color(0xffd3bcfd),
      primaryFixed: Color(0xffebddff),
      onPrimaryFixed: Color(0xff230f46),
      primaryFixedDim: Color(0xffd3bcfd),
      onPrimaryFixedVariant: Color(0xff4f3d74),
      secondaryFixed: Color(0xffe9def8),
      onSecondaryFixed: Color(0xff1f182b),
      secondaryFixedDim: Color(0xffcdc2db),
      onSecondaryFixedVariant: Color(0xff4b4358),
      tertiaryFixed: Color(0xffffd9e1),
      onTertiaryFixed: Color(0xff31101b),
      tertiaryFixedDim: Color(0xfff0b7c5),
      onTertiaryFixedVariant: Color(0xff643b46),
      surfaceDim: Color(0xffded8e0),
      surfaceBright: Color(0xfffef7ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f1fa),
      surfaceContainer: Color(0xfff2ecf4),
      surfaceContainerHigh: Color(0xffede6ee),
      surfaceContainerHighest: Color(0xffe7e0e8),
    );
  }

  static _MaterialScheme darkScheme() {
    return const _MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd3bcfd),
      surfaceTint: Color(0xffd3bcfd),
      onPrimary: Color(0xff38265c),
      primaryContainer: Color(0xff4f3d74),
      onPrimaryContainer: Color(0xffebddff),
      secondary: Color(0xffcdc2db),
      onSecondary: Color(0xff342d40),
      secondaryContainer: Color(0xff4b4358),
      onSecondaryContainer: Color(0xffe9def8),
      tertiary: Color(0xfff0b7c5),
      onTertiary: Color(0xff4a2530),
      tertiaryContainer: Color(0xff643b46),
      onTertiaryContainer: Color(0xffffd9e1),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      background: Color(0xff151218),
      onBackground: Color(0xffe7e0e8),
      surface: Color(0xff151218),
      onSurface: Color(0xffe7e0e8),
      surfaceVariant: Color(0xff49454e),
      onSurfaceVariant: Color(0xffcbc4cf),
      outline: Color(0xff948f99),
      outlineVariant: Color(0xff49454e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e0e8),
      inverseOnSurface: Color(0xff322f35),
      inversePrimary: Color(0xff68548e),
      primaryFixed: Color(0xffebddff),
      onPrimaryFixed: Color(0xff230f46),
      primaryFixedDim: Color(0xffd3bcfd),
      onPrimaryFixedVariant: Color(0xff4f3d74),
      secondaryFixed: Color(0xffe9def8),
      onSecondaryFixed: Color(0xff1f182b),
      secondaryFixedDim: Color(0xffcdc2db),
      onSecondaryFixedVariant: Color(0xff4b4358),
      tertiaryFixed: Color(0xffffd9e1),
      onTertiaryFixed: Color(0xff31101b),
      tertiaryFixedDim: Color(0xfff0b7c5),
      onTertiaryFixedVariant: Color(0xff643b46),
      surfaceDim: Color(0xff151218),
      surfaceBright: Color(0xff3b383e),
      surfaceContainerLowest: Color(0xff0f0d13),
      surfaceContainerLow: Color(0xff1d1b20),
      surfaceContainer: Color(0xff211f24),
      surfaceContainerHigh: Color(0xff2c292f),
      surfaceContainerHighest: Color(0xff36343a),
    );
  }
}

class _MaterialScheme {
  const _MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension _MaterialSchemeUtils on _MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      // surface
      background: background,
      // onSurface
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      // surfaceContainerHighest
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

// abstract class AppColors {
//   factory AppColors(Brightness brightness) {
//     if (brightness == Brightness.dark) {
//       return AppDarkColors();
//     }
//     // Default
//     return AppLightColors();
//   }
//
//   static AppColors get of => AppColors(Get.theme.brightness);
//
//   Brightness get brightness;
//
//   MaterialColor get primaryColor;
//
//   MaterialColor get secondaryColor;
//
//   MaterialColor get errorColor;
//
//   MaterialColor get neutralColor;
//
//   MaterialColor get processInformColor;
//
//   MaterialColor get successColor;
//
//   MaterialColor get purpleColor;
// }
//
// class AppLightColors implements AppColors {
//   static const int _primaryValue = 0xFF00A499;
//   static const int _secondaryValue = 0xFFFFB81C;
//   static const int _errorValue = 0xFFF5222D;
//   static const int _neutralValue = 0xFF000D0B;
//   static const int _processInformValue = 0xFF0089B6;
//   static const int _successColorValue = 0xFF00A100;
//   static const int _purpleValue = 0xFF5E00AA;
//
//   @override
//   Brightness get brightness => Brightness.light;
//
//   @override
//   MaterialColor get primaryColor => const MaterialColor(
//     _primaryValue,
//     <int, Color>{
//       6: Color(0xFF00867D),
//       5: Color(_primaryValue),
//       1: Color(0xFFE5F6F5),
//     },
//   );
//
//   @override
//   MaterialColor get errorColor => const MaterialColor(
//     _errorValue,
//     <int, Color>{
//       6: Color(0xFFC91C25),
//       5: Color(_errorValue),
//       1: Color(0xFFFEE9EA),
//     },
//   );
//
//   @override
//   MaterialColor get neutralColor => const MaterialColor(
//     _neutralValue,
//     <int, Color>{
//       10: Color(_neutralValue),
//       6: Color(0xFF8A8B8C),
//       5: Color(0xFFBBBCBF),
//       4: Color(0xFFD4D5D9),
//       3: Color(0xFFEBECF0),
//       2: Color(0xFFF5F6FA),
//       1: Color(0xFFFFFFFF),
//     },
//   );
//
//   @override
//   MaterialColor get processInformColor => const MaterialColor(
//     _processInformValue,
//     <int, Color>{
//       5: Color(0xFF0089B6),
//       3: Color(_processInformValue),
//       1: Color(0xFFE5F3F8),
//     },
//   );
//
//   @override
//   MaterialColor get successColor => const MaterialColor(
//     _successColorValue,
//     <int, Color>{
//       5: Color(_successColorValue),
//       1: Color(0xFFE5F6E5),
//     },
//   );
//
//   @override
//   MaterialColor get secondaryColor => const MaterialColor(
//     _secondaryValue,
//     <int, Color>{
//       6: Color(0xFFCC9619),
//       5: Color(_secondaryValue),
//       1: Color(0xFFFFF8E8),
//     },
//   );
//
//   @override
//   MaterialColor get purpleColor => const MaterialColor(
//     _purpleValue,
//     <int, Color>{
//       5: Color(_purpleValue),
//       1: Color(0xFFEFE5F7),
//     },
//   );
// }
//
// class AppDarkColors implements AppColors {
//   static const int _primaryValue = 0xFFBB86FC;
//   static const int _secondaryValue = 0xFF03DAC5;
//   static const int _errorValue = 0xFFCF6679;
//   static const int _neutralValue = 0xFF000D0B;
//   static const int _processInformValue = 0xFF0089B6;
//   static const int _successColorValue = 0xFF00A100;
//   static const int _purpleValue = 0xFF5E00AA;
//
//   @override
//   Brightness brightness = Brightness.dark;
//
//   @override
//   MaterialColor get primaryColor => const MaterialColor(
//     _primaryValue,
//     <int, Color>{
//       6: Color(0xFF985EFF),
//       5: Color(_primaryValue),
//     },
//   );
//
//   @override
//   MaterialColor get errorColor => const MaterialColor(
//     _errorValue,
//     <int, Color>{
//       6: Color(0xFFC91C25),
//       5: Color(_errorValue),
//       1: Color(0xFFFEE9EA),
//     },
//   );
//
//   @override
//   MaterialColor get neutralColor => const MaterialColor(
//     _neutralValue,
//     <int, Color>{
//       10: Color(_neutralValue),
//       6: Color(0xFF8A8B8C),
//       5: Color(0xFFBBBCBF),
//       4: Color(0xFFD4D5D9),
//       3: Color(0xFFEBECF0),
//       2: Color(0xFFF5F6FA),
//       1: Color(0xFFFFFFFF),
//     },
//   );
//
//   @override
//   MaterialColor get processInformColor => const MaterialColor(
//     _processInformValue,
//     <int, Color>{
//       5: Color(0xFF0089B6),
//       3: Color(_processInformValue),
//       1: Color(0xFFE5F3F8),
//     },
//   );
//
//   @override
//   MaterialColor get successColor => const MaterialColor(
//     _successColorValue,
//     <int, Color>{
//       5: Color(_successColorValue),
//       1: Color(0xFFE5F6E5),
//     },
//   );
//
//   @override
//   MaterialColor get secondaryColor => const MaterialColor(
//     _secondaryValue,
//     <int, Color>{
//       6: Color(0xFF019592),
//       5: Color(_secondaryValue),
//       1: Color(0xFF70EFDE),
//     },
//   );
//
//   @override
//   MaterialColor get purpleColor => const MaterialColor(
//     _purpleValue,
//     <int, Color>{
//       5: Color(_purpleValue),
//       1: Color(0xFFEFE5F7),
//     },
//   );
// }
