import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'exts/app_theme_ext.dart';

part 'exts/app_text_style_ext.dart';

part 'app_colors.dart';

part 'app_text_style.dart';

part 'app_button_style.dart';

class AppThemeData {
  AppThemeData._();

  static ThemeData lightTheme = themeData(Brightness.light);
  static ThemeData darkTheme = themeData(Brightness.dark);

  static ThemeData themeData(Brightness brightness) {
    final appColor = AppColors(brightness);

    /// NOTE:
    /// Use Default MaterialDesign FontFamily (Roboto)
    /// Only modify them color
    return ThemeData(
      // Use Material Design version 3
      useMaterial3: true,
      brightness: brightness,
      textTheme: _AppTextStyle.textTheme(appColor),
      filledButtonTheme:
          FilledButtonThemeData(style: AppButtonStyle.filledButtonStyle),
      textButtonTheme:
          TextButtonThemeData(style: AppButtonStyle.textButtonStyle),
      outlinedButtonTheme:
          OutlinedButtonThemeData(style: AppButtonStyle.outlinedButtonStyle),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: appColor.primaryColor,
        selectionColor: appColor.primaryColor,
        selectionHandleColor: appColor.primaryColor,
      ),
      cupertinoOverrideTheme:
          CupertinoThemeData(primaryColor: appColor.primaryColor),
    );
  }
}
