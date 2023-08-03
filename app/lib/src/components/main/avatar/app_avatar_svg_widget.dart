part of 'app_avatar_base_builder.dart';

class AppAvatarSvgWidget extends AppAvatarBaseBuilder {
  @override
  Widget build(BuildContext context) {
    if (_svg == null) {
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
          padding: _padding,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.of.neutralColor[5],
            border: Border.all(color: AppColors.of.neutralColor[3]!),
          ),
          child: ClipOval(child: _svg),
        ),
      ),
    );
  }

  @override
  AppAvatarBaseBuilder setSvg(Widget? svg) {
    _svg = svg;
    return super.setSvg(svg);
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

  EdgeInsets get _padding => _size == AppAvatarSize.extraLarge
      ? EdgeInsets.all(AppThemeExt.of.majorScale(4))
      : _size == AppAvatarSize.large
          ? EdgeInsets.all(AppThemeExt.of.majorScale(3))
          : _size == AppAvatarSize.medium
              ? EdgeInsets.all(AppThemeExt.of.majorScale(2))
              : EdgeInsets.all(AppThemeExt.of.majorScale(1));
}
