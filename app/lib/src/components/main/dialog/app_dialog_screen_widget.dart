part of 'app_dialog_base_builder.dart';

class AppScreenDialogWidget extends AppDialogBaseBuilder {
  const AppScreenDialogWidget({
    super.key,
    super.title,
    super.content,
    super.positiveText,
    super.negativeText,
    super.appDialogType,
  });

  @override
  Widget build(BuildContext context) {
    Widget icon = appDialogType == AppDialogType.success
        ? R.svgs.dialog.success.svg()
        : appDialogType == AppDialogType.error
            ? R.svgs.dialog.error.svg()
            : R.svgs.dialog.confirm.svg();
    return Dialog.fullscreen(
      child: Container(
        color: AppColors.of.neutralColor[1],
        padding: EdgeInsets.all(AppThemeExt.of.majorScale(6)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: _container(context, icon)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (negativeText != null)
                  Expanded(
                    child: AppOutlinedButtonWidget(
                      buttonText: negativeText,
                      appButtonSize: AppButtonSize.large,
                      onPressed: () {
                        Get.back();
                        onNegative?.call();
                      },
                    ),
                  ),
                if (negativeText != null)
                  SizedBox(width: AppThemeExt.of.majorScale(3)),
                if (positiveText != null)
                  Expanded(
                    child: AppFilledButtonWidget(
                      buttonText: positiveText,
                      appButtonSize: AppButtonSize.large,
                      onPressed: () {
                        Get.back();
                        onPositive?.call();
                      },
                    ).build(context),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _container(BuildContext context, Widget icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        icon,
        if (title != null)
          Padding(
            padding:
                EdgeInsets.symmetric(vertical: AppThemeExt.of.majorScale(3)),
            child: AppTextHeading4Widget(
              text: title,
              textAlign: TextAlign.center,
            ),
          ),
        if (content != null)
          AppTextBody1Widget(
            text: content,
            textStyle: AppTextStyleExt.of.textBody1r,
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}
