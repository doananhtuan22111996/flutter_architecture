part of 'app_badge_base_builder.dart';

class AppBadgeDotWidget extends AppBadgeBaseBuilder {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppThemeExt.of.majorScale(6 / 4),
      height: AppThemeExt.of.majorScale(6 / 4),
      decoration: BoxDecoration(shape: BoxShape.circle, color: _color),
    );
  }

  @override
  AppBadgeBaseBuilder setColor(Color? color) {
    _color = color;
    return this;
  }
}
