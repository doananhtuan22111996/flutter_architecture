// ignore_for_file: constant_identifier_names, unused_element
part of 'app_theme.dart';

class _AppTextSize {
  static const double T40 = 40;
  static const double T34 = 34;
  static const double T28 = 28;
  static const double T24 = 24;
  static const double T20 = 20;
  static const double T16 = 16;
  static const double T14 = 14;
  static const double T12 = 12;
}

abstract class _AppTextStyle {
  static FontWeight get bold => FontWeight.w700;

  static FontWeight get semiBold => FontWeight.w600;

  static FontWeight get regular => FontWeight.w400;

  static FontWeight get medium => FontWeight.w500;

  static TextTheme textTheme(AppColors appColor) {
    return TextTheme(
      /// headline1
      displayLarge: _textHeading1s.copyWith(
        color: appColor.neutralColor,
      ),

      /// headline2
      displayMedium: _textHeading2s.copyWith(
        color: appColor.neutralColor,
      ),

      /// headline3
      displaySmall: _textHeading3s.copyWith(
        color: appColor.neutralColor,
      ),

      /// headline4
      headlineMedium: _textHeading4s.copyWith(
        color: appColor.neutralColor,
      ),

      /// headline5
      headlineSmall: _textHeading5s.copyWith(
        color: appColor.neutralColor,
      ),

      /// headline6
      /// titleLarge: textHeading6s,

      /// subtitle1
      /// titleMedium: subtitle1s,

      /// bodyText1
      bodyLarge: _textBody1s.copyWith(
        color: appColor.neutralColor,
      ),

      /// bodyText2
      bodyMedium: _textBody2s.copyWith(
        color: appColor.neutralColor,
      ),

      /// caption, bodyText3
      bodySmall: _textBody3s.copyWith(
        color: appColor.neutralColor,
      ),

      /// button
      /// labelLarge: AppTextStyleExt.of.textBody1m,

      /// overline
      /// labelSmall: overline,
    );
  }

  static final TextStyle _textHeading1s = TextStyle(
    height: 1.2,
    fontSize: _AppTextSize.T40,
    fontWeight: semiBold,
  );

  static final TextStyle _textHeading2s = TextStyle(
    height: 1.1,
    fontSize: _AppTextSize.T34,
    fontWeight: semiBold,
  );

  static final TextStyle _textHeading3s = TextStyle(
    height: 1.2,
    fontSize: _AppTextSize.T28,
    fontWeight: semiBold,
  );

  static final TextStyle _textHeading4s = TextStyle(
    height: 1.3,
    fontSize: _AppTextSize.T24,
    fontWeight: semiBold,
  );

  static final TextStyle _textHeading5s = TextStyle(
    height: 1.4,
    fontSize: _AppTextSize.T20,
    fontWeight: semiBold,
  );

  static final TextStyle _textBody1s = TextStyle(
    height: 1.5,
    fontSize: _AppTextSize.T16,
    fontWeight: semiBold,
  );

  static final TextStyle _textBody2s = TextStyle(
    height: 1.5,
    fontSize: _AppTextSize.T14,
    fontWeight: semiBold,
  );

  static final TextStyle _textBody3s = TextStyle(
    height: 1.6,
    fontSize: _AppTextSize.T12,
    fontWeight: semiBold,
  );
}
