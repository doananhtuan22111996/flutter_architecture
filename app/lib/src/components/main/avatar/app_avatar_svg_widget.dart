part of 'app_avatar_base_builder.dart';

class AppAvatarSvgWidget extends AppAvatarBaseBuilder {
  const AppAvatarSvgWidget(
      {super.key, required super.svg, super.size, super.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      customBorder: const CircleBorder(),
      child: Padding(
        padding: EdgeInsets.all(AppThemeExt.of.majorScale(1)),
        child: Container(
          width: size?.value,
          height: size?.value,
          padding: _padding,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.of.neutralColor[5],
            border: Border.all(color: AppColors.of.neutralColor[3]!),
          ),
          child: ClipOval(child: svg),
        ),
      ),
    );
  }

  EdgeInsets get _padding => size == AppAvatarSize.extraLarge
      ? EdgeInsets.all(AppThemeExt.of.majorScale(4))
      : size == AppAvatarSize.large
          ? EdgeInsets.all(AppThemeExt.of.majorScale(3))
          : size == AppAvatarSize.medium
              ? EdgeInsets.all(AppThemeExt.of.majorScale(2))
              : EdgeInsets.all(AppThemeExt.of.majorScale(1));
}
