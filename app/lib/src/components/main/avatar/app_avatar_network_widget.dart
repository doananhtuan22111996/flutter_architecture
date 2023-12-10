part of 'app_avatar_base_builder.dart';

class AppAvatarNetworkWidget extends AppAvatarBaseBuilder {
  const AppAvatarNetworkWidget(
      {super.key, required super.link, super.size, super.onPressed});

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
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.of.neutralColor[3]!),
          ),
          child: ClipOval(child: Image.network(link!, fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
