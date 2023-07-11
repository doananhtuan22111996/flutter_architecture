part of 'app_dialog_base_builder.dart';

class AppScreenDialogWidget extends AppDialogBaseBuilder {
  @override
  AppDialogBaseBuilder setTitle(String? title) {
    _title = title;
    return super.setTitle(title);
  }

  @override
  AppDialogBaseBuilder setContent(String? content) {
    _content = content;
    return super.setContent(content);
  }

  @override
  AppDialogBaseBuilder setIcon(Widget? icon) {
    _icon = icon;
    return super.setIcon(icon);
  }

  @override
  AppDialogBaseBuilder setPositiveText(String? positiveText) {
    _positiveText = positiveText;
    return super.setPositiveText(positiveText);
  }

  @override
  AppDialogBaseBuilder setNegativeText(String? negativeText) {
    _negativeText = negativeText;
    return super.setNegativeText(negativeText);
  }

  @override
  AppDialogBaseBuilder setAppDialogType(AppDialogType? type) {
    _appDialogType = type;
    return super.setAppDialogType(type);
  }

  @override
  AppDialogBaseBuilder buildDialog(BuildContext context) {
    if (_appDialogType == AppDialogType.success) {
      setIcon(R.svgs.icSuccessOnDialog.svg());
    }
    if (_appDialogType == AppDialogType.error) {
      setIcon(R.svgs.icErrorOnDialog.svg());
    }
    if (_appDialogType == AppDialogType.confirm) {
      setIcon(R.svgs.icConfirmOnDialog.svg());
    }
    _dialog = Dialog.fullscreen(
      child: Container(
        color: AppColors.of.neutralColor[1],
        padding: EdgeInsets.all(AppThemeExt.of.majorScale(6)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: _container(context)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (_negativeText != null)
                  Expanded(
                    child: AppOutlinedButtonWidget()
                        .setButtonText(_negativeText)
                        .setAppButtonSize(AppButtonSize.large)
                        .setOnPressed(() {
                      Get.back();
                      _onNegative?.call();
                    }).build(context),
                  ),
                if (_negativeText != null)
                  SizedBox(width: AppThemeExt.of.majorScale(3)),
                if (_positiveText != null)
                  Expanded(
                    child: AppFilledButtonWidget()
                        .setButtonText(_positiveText)
                        .setAppButtonSize(AppButtonSize.large)
                        .setOnPressed(() {
                      Get.back();
                      _onPositive?.call();
                    }).build(context),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
    return this;
  }

  Widget _container(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        if (_icon != null) _icon!,
        if (_title != null)
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: AppThemeExt.of.majorScale(3)),
            child: AppTextHeading4Widget()
                .setText(_title)
                .setTextAlign(TextAlign.center)
                .build(context),
          ),
        if (_content != null)
          AppTextBody1Widget()
              .setText(_content)
              .setTextStyle(AppTextStyleExt.of.textBody1r)
              .setTextAlign(TextAlign.center)
              .build(context),
      ],
    );
  }
}
