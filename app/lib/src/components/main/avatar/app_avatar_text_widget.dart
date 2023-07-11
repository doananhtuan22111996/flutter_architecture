part of 'app_avatar_base_builder.dart';

class AppAvatarTextWidget extends AppAvatarBaseBuilder {
  @override
  Widget build(BuildContext context) {
    if (_text == null) {
      return SizedBox(
        width: _size?.value,
        height: _size?.value,
      );
    }

    Widget textW = AppTextBody2Widget().setText(_text).build(context);
    if (_size == AppAvatarSize.small) {
      textW = AppTextBody3Widget().setText(_text).build(context);
    }
    if (_size == AppAvatarSize.large) {
      textW = AppTextBody1Widget().setText(_text).build(context);
    }
    if (_size == AppAvatarSize.extraLarge) {
      textW = AppTextHeading5Widget().setText(_text).build(context);
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
          alignment: Alignment.center,
          child: ClipOval(child: textW),
        ),
      ),
    );
  }

  @override
  AppAvatarBaseBuilder setText(String? text) {
    _text = text;
    return super.setText(text);
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
