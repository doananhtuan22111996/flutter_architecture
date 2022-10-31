import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'app_colors.dart';

enum AppTheme { lightTheme, dartTheme }

final Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.lightTheme: AppThemeData.lightThemeData,
  AppTheme.dartTheme: AppThemeData.darkThemeData,
};

class AppThemeData {
  AppThemeData._();

  static final AppColors _lightColors = AppColors(Brightness.light);
  static final AppColors _darkColors = AppColors(Brightness.dark);

  static AppColors get appLightColors => _lightColors;

  static AppColors get appDarkColors => _darkColors;

  static ThemeData lightThemeData = themeData(_lightColors);
  static ThemeData darkThemeData = themeData(_darkColors);

  static ThemeData themeData(AppColors appColor) {
    /// NOTE:
    /// Use Default MaterialDesign FontFamily (Roboto)
    /// Only modify them color
    return ThemeData(
        useMaterial3: true,
        // Use Material Design version 3
        iconTheme: IconThemeData(color: appColor.neutralColor[80]),
        // appBarTheme: AppBarTheme(
        //   backgroundColor: appColor.primaryColor,
        //   iconTheme: IconThemeData(color: appColor.neutralColor[0]),
        //   actionsIconTheme: IconThemeData(color: appColor.neutralColor[0]),
        // ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            disabledBackgroundColor: Colors.transparent,
          ),
        ),
        // outlinedButtonTheme: OutlinedButtonThemeData(
        //   style: OutlinedButton.styleFrom(
        //     backgroundColor: appColor.neutralColor,
        //     side: BorderSide(color: appColor.primaryColor),
        //     padding: const EdgeInsets.all(10),
        //   ),
        // ),
        // buttonTheme: ButtonThemeData(
        //   buttonColor: appColor.primaryColor,
        //   hoverColor: appColor.primaryColor[90],
        //   focusColor: appColor.primaryColor[80],
        //   disabledColor: appColor.neutralColor[90],
        // ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: appColor.primaryColor,
          selectionColor: appColor.primaryColor,
          selectionHandleColor: appColor.primaryColor,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(appColor.primaryColor),
          checkColor: MaterialStateProperty.all(appColor.neutralColor),
        ),
        dividerTheme: DividerThemeData(
            color: appColor.neutralColor[90],
            thickness: 1,
            space: 0,
            indent: 0,
            endIndent: 0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // drawerTheme:
        //     DrawerThemeData(backgroundColor: appColor.secondaryColor[98]),
        cardTheme: CardTheme(
          color: appColor.neutralColor[0],
          shadowColor: appColor.neutralColor[10],
          surfaceTintColor: appColor.neutralColor[0],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), side: BorderSide.none),
          margin: EdgeInsets.zero,
        ),
        radioTheme: RadioThemeData(
            fillColor: MaterialStatePropertyAll(appColor.primaryColor)),
        dialogTheme: DialogTheme(backgroundColor: appColor.neutralColor),
        primaryColor: appColor.primaryColor,
        primaryColorLight: appColor.successColor,
        disabledColor: appColor.neutralColor[20],
        dialogBackgroundColor: appColor.neutralColor[0],
        cardColor: appColor.neutralColor[0],
        errorColor: appColor.errorColor,
        dividerColor: appColor.neutralColor[10],
        backgroundColor: appColor.neutralColor[0],
        scaffoldBackgroundColor: appColor.neutralColor[0],
        hintColor: appColor.neutralColor[40],
        colorScheme: ColorScheme(
          brightness: appColor.brightness,
          primary: appColor.primaryColor,
          onPrimary: appColor.neutralColor[0]!,
          // Color Success
          // primaryContainer: appColor.secondaryColor[95],
          // onPrimaryContainer: appColor.secondaryColor[90],
          secondary: appColor.secondaryColor,
          onSecondary: appColor.neutralColor[100]!,
          // secondaryContainer: appColor.secondaryColor[60],
          // onSecondaryContainer: appColor.secondaryColor[70],
          tertiary: appColor.tertiaryColor,
          onTertiary: appColor.neutralColor[0]!,
          // TODO Check with PD
          // tertiaryContainer: appColor.tertiaryColor[60],
          // onTertiaryContainer: appColor.tertiaryColor[70],
          error: appColor.errorColor,
          onError: appColor.neutralColor[0]!,
          // errorContainer: appColor.errorColor[90],
          // onErrorContainer: appColor.errorColor[95],

          background: appColor.neutralColor[0]!,
          onBackground: appColor.neutralColor[80]!,
          surface: appColor.neutralColor[0]!,
          onSurface: appColor.neutralColor[80]!,
          surfaceVariant: appColor.neutralColor[95],
          surfaceTint: appColor.neutralColor[0],
          outline: appColor.neutralColor[10],
          // Text color with black
          inverseSurface: appColor.primaryColor,
          // Blue Color
          onInverseSurface: appColor.neutralColor[0],
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            height: 1.6,
            color: appColor.neutralColor[100],
          ),
          subtitle1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            height: 1.5,
            color: appColor.neutralColor[100],
          ),
          bodyText1: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 1.5,
            color: appColor.neutralColor[100],
          ),
          subtitle2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.5,
            color: appColor.neutralColor[100],
          ),
          bodyText2: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.5,
            color: appColor.neutralColor[100],
          ),
          caption: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.5,
            color: appColor.neutralColor[100],
          ),
          overline: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            height: 1.6,
            color: appColor.neutralColor[100],
          ),
        ));
  }
}
