part of 'tooltip_controller.dart';

class TooltipPage extends GetWidget<TooltipController> {
  const TooltipPage({super.key});

  static void open() {
    Get.toNamed(Routes.tooltip);
  }

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget()
        .setAppBar(AppBarWidget().setHeaderPage('Tooltip').build(context))
        .setBody(_body(context))
        .build(context);
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppThemeExt.of.majorScale(4)),
      child: AppTooltipWidget(
        message:
            'This is message a long. Message will show full content when hovering. This is message a long.',
        child: AppOutlinedButtonWidget()
            .setButtonText('Tooltip')
            .setIsDisabled(true)
            .build(context),
      ),
    );
  }
}
