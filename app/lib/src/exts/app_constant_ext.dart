part of 'app_exts.dart';

class AppConstants {
  AppConstants._();

  static const code = 'code';
  static const basic = 'Basic';
  static const bearer = 'Bearer';
  static const pageLimit = 25;
  static const markRead = 'MARK_READ';
  static const dateTimeDefaultFormat = 'dd/MM/yyyy';
  static const dateTimeRequestFormat = 'yyyy-MM-dd';
  static const allValue = 'all';
  static const eKYCMatching = 80;
  static const vietNam = 'Việt Nam';
}

class AppUIConstants {
  static double defaultPadding = 16;
  static double minPadding = 4;

  static double mainHorizontalMargin = 16;
  static double mainVerticalMargin = 16;

  static double subVerticalMargin = 12;
  static double subHorizontalMargin = 12;

  static double radioButtonSize = 20;
  static double svgSize = 24;
  static double subButtonHeight = 40;

  static double boxBorderRadius = 8;
}

class AppRoutesParamKey {
  static String id = 'id';
}
