part of 'app_avatar_base_builder.dart';

class AppAvatarTextWidget extends AppAvatarBaseBuilder {
  const AppAvatarTextWidget(
      {super.key, required super.text, super.size, super.onPressed});

  @override
  Widget build(BuildContext context) {
    Widget textW = AppTextBody2Widget(text: text);
    if (size == AppAvatarSize.small) {
      textW = AppTextBody3Widget(text: text);
    }
    if (size == AppAvatarSize.large) {
      textW = AppTextBody1Widget(text: text);
    }
    if (size == AppAvatarSize.extraLarge) {
      textW = AppTextHeading5Widget(text: text);
    }

    return InkWell(
      onTap: onPressed,
      customBorder: const CircleBorder(),
      child: Padding(
        padding: EdgeInsets.all(AppThemeExt.of.majorScale(1)),
        child: Container(
          width: size?.value,
          height: size?.value,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.of.neutralColor[3]!),
          ),
          alignment: Alignment.center,
          child: ClipOval(child: textW),
        ),
      ),
    );
  }
}
