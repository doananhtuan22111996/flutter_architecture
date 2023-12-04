part of 'app_badge_base_builder.dart';

class AppBadgeDotWidget extends AppBadgeBaseBuilder {
  const AppBadgeDotWidget({super.key, super.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppThemeExt.of.majorScale(6 / 4),
      height: AppThemeExt.of.majorScale(6 / 4),
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
