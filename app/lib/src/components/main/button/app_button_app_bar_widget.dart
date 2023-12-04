part of 'app_button_base_builder.dart';

class AppButtonAppBarWidget extends AppButtonBaseBuilder {
  const AppButtonAppBarWidget({super.key, super.prefixIcon, super.onPressed});

  @override
  Widget build(BuildContext context) {
    if (prefixIcon == null) {
      return SizedBox(
        width: AppThemeExt.of.majorScale(12),
        height: AppThemeExt.of.majorScale(12),
      );
    }
    return _standard(context);
  }

  Widget _standard(BuildContext context) {
    return IconButton(
      icon: prefixIcon!,
      iconSize: AppThemeExt.of.majorScale(6),
      padding: EdgeInsets.zero,
      onPressed: onPressed,
    );
  }
}
