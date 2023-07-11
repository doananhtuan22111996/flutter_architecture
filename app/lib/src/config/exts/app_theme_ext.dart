part of '../app_theme.dart';

class AppThemeExt {
  @protected
  final double _sizeBase = 4.0;

  AppThemeExt._();

  static AppThemeExt get of => AppThemeExt._();

  double Function(num x) get majorScale => (x) => _sizeBase * x;
}
