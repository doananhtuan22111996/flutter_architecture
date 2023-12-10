part of 'app_avatar_base_builder.dart';

class AppAvatarFileWidget extends AppAvatarBaseBuilder {
  const AppAvatarFileWidget({
    super.key,
    required super.file,
    super.size,
    super.onPressed,
  });

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
          child: ClipOval(child: Image.file(file!, fit: BoxFit.fill)),
        ),
      ),
    );
  }
}
