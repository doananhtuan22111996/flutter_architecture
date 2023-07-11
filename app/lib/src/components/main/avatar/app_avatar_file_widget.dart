part of 'app_avatar_base_builder.dart';

class AppAvatarFileWidget extends AppAvatarBaseBuilder {
  @override
  Widget build(BuildContext context) {
    if (_file == null) {
      return SizedBox(
        width: _size?.value,
        height: _size?.value,
      );
    }
    return InkWell(
      onTap: _onPressed,
      customBorder: const CircleBorder(),
      child: Padding(
        padding: EdgeInsets.all(AppThemeExt.of.majorScale(1)),
        child: Container(
          width: _size?.value,
          height: _size?.value,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.of.neutralColor[3]!),
          ),
          child: ClipOval(child: Image.file(_file!, fit: BoxFit.fill)),
        ),
      ),
    );
  }

  @override
  AppAvatarBaseBuilder setFile(File? file) {
    _file = file;
    return super.setFile(file);
  }

  @override
  AppAvatarBaseBuilder setSize(AppAvatarSize? size) {
    _size = size;
    return super.setSize(size);
  }

  @override
  AppAvatarBaseBuilder setOnPressed(void Function()? onPressed) {
    _onPressed = onPressed;
    return super.setOnPressed(onPressed);
  }
}
