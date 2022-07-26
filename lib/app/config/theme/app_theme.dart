import 'package:flutter/material.dart';

part 'app_colors.dart';
part 'app_text_theme.dart';

enum AppTheme { lightTheme, dartTheme }

class AppThemeData {
  AppThemeData._();

  static ThemeData lightTheme = themeData(AppTheme.lightTheme);
  static ThemeData dartTheme = themeData(AppTheme.dartTheme);

  static ThemeData themeData(AppTheme appTheme) {
    final AppColors appColor = AppColors(appTheme);
    return ThemeData(
      iconTheme: IconThemeData(color: appColor.neutralColor),
      backgroundColor: appColor.backgroundColor,
      scaffoldBackgroundColor: appColor.backgroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: appTheme == AppTheme.lightTheme ? 'Poppins' : 'Cairo',
      textTheme: AppTextTheme.textTheme(appColor),
      buttonTheme: ButtonThemeData(buttonColor: appColor.buttonColor),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(appColor.buttonColor),
          textStyle: MaterialStateProperty.all(
            AppTextTheme.textTheme(appColor)
                .bodyText1
                ?.copyWith(color: appColor.primaryColor),
          ),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: appColor.primaryColor,
        selectionColor: appColor.primaryColor,
        selectionHandleColor: appColor.primaryColor,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
        },
      ),
      primaryColor: appColor.primaryColor,
      primaryColorDark: appColor.primaryColor,
      primaryColorLight: appColor.primaryColor,
      disabledColor: appColor.disableColor,
      dialogBackgroundColor: appColor.dialogColor,
      errorColor: appColor.errorColor,
    );
  }
}
