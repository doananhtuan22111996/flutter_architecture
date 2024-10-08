part of 'app_icon_base_builder.dart';

class AppIconWidget extends _AppIconBaseBuilder {
  const AppIconWidget({
    super.key,
    required super.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(icon);
  }
}
