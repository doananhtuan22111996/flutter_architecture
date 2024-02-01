part of 'app_toast_base_builder.dart';

class AppToastWidget extends AppToastBaseBuilder {
  const AppToastWidget({
    required super.title,
    required super.appToastType,
    super.message,
    super.buttonText,
    super.onButtonPress,
  });

  @override
  void show() {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    final isStandard = buttonText == null;
    Get.rawSnackbar(
      messageText: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(
            left: AppThemeExt.of.majorScale(3),
            top: AppThemeExt.of.majorScale(3),
            bottom: AppThemeExt.of.majorScale(3),
            right: AppThemeExt.of.majorScale(1),
          ),
          child: icon(),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.only(
            top: AppThemeExt.of.majorScale(3),
            bottom: AppThemeExt.of.majorScale(3),
            right: AppThemeExt.of.majorScale(1),
          ),
          child: content(),
        )),
        Padding(
          padding: isStandard
              ? EdgeInsets.zero
              : EdgeInsets.only(
                  top: AppThemeExt.of.majorScale(3),
                  bottom: AppThemeExt.of.majorScale(3),
                  right: AppThemeExt.of.majorScale(3),
                ),
          child: button(),
        ),
      ]),
      borderRadius: AppThemeExt.of.majorScale(1),
      borderColor: borderColor(),
      margin: EdgeInsets.all(AppThemeExt.of.majorScale(4)),
      padding: EdgeInsets.zero,
      backgroundColor: backgroundColor(),
      onTap: (snack) => Get.closeCurrentSnackbar(),
    );
  }
}
