part of 'button_controller.dart';

class ButtonPage extends GetView<ButtonController> {
  const ButtonPage({Key? key}) : super(key: key);

  static void open() {
    Get.toNamed(Routes.button);
  }

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
        appBar: AppBarWidget(headerPage: R.strings.button).build(context),
        body: _body(context));
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppThemeExt.of.majorScale(4)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _filled(context)),
                Expanded(child: _outlined(context)),
              ],
            ),
            SizedBox(height: AppThemeExt.of.majorScale(4)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _text(context)),
                Expanded(child: _circle(context)),
              ],
            ),
            SizedBox(height: AppThemeExt.of.majorScale(4)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _square(context)),
                Expanded(child: _danger(context)),
              ],
            ),
            SizedBox(height: AppThemeExt.of.majorScale(4)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _outlinedDanger(context)),
                Expanded(child: _textDanger(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _filled(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextBody1Widget(text: 'Filled Button'),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppFilledButtonWidget(
          buttonText: R.strings.button,
          appButtonSize: AppButtonSize.large,
          onPressed: () => controller.toast(),
        ).build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppFilledButtonWidget(
          buttonText: R.strings.button,
          appButtonSize: AppButtonSize.medium,
          onPressed: () => controller.toast(),
        ).build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppFilledButtonWidget(
          buttonText: R.strings.button,
          appButtonSize: AppButtonSize.small,
          onPressed: () => controller.toast(),
        ).build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppFilledButtonWidget(
          buttonText: R.strings.button,
          isDisabled: true,
          onPressed: () => controller.toast(),
        ).build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppFilledButtonWidget.icon(
          buttonText: R.strings.button,
          prefixIcon: const Icon(Icons.close),
          onPressed: () => controller.toast(),
        ).build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppFilledButtonWidget.icon(
          buttonText: R.strings.button,
          isDisabled: true,
          prefixIcon: const Icon(Icons.close),
          onPressed: () => controller.toast(),
        ).build(context),
      ],
    );
  }

  Widget _outlined(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextBody1Widget(text: 'Outlined Button'),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppOutlinedButtonWidget(
          buttonText: R.strings.button,
          appButtonSize: AppButtonSize.large,
          onPressed: () => controller.toast(),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppOutlinedButtonWidget(
          buttonText: R.strings.button,
          appButtonSize: AppButtonSize.medium,
          onPressed: () => controller.toast(),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppOutlinedButtonWidget(
          buttonText: R.strings.button,
          appButtonSize: AppButtonSize.small,
          onPressed: () => controller.toast(),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppOutlinedButtonWidget(
          buttonText: R.strings.button,
          isDisabled: true,
          onPressed: () => controller.toast(),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppOutlinedButtonWidget.icon(
          buttonText: R.strings.button,
          prefixIcon: const Icon(Icons.close),
          onPressed: () => controller.toast(),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppOutlinedButtonWidget.icon(
          buttonText: R.strings.button,
          isDisabled: true,
          prefixIcon: const Icon(Icons.close),
          onPressed: () => controller.toast(),
        ),
      ],
    );
  }

  Widget _text(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextBody1Widget(text: 'Text Button'),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextButtonWidget(
          buttonText: R.strings.button,
          appButtonSize: AppButtonSize.large,
          onPressed: () => controller.toast(),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextButtonWidget(
          buttonText: R.strings.button,
          appButtonSize: AppButtonSize.medium,
          onPressed: () => controller.toast(),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextButtonWidget(
          buttonText: R.strings.button,
          appButtonSize: AppButtonSize.small,
          onPressed: () => controller.toast(),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextButtonWidget(
          buttonText: R.strings.button,
          isDisabled: true,
          onPressed: () => controller.toast(),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextButtonWidget.icon(
          buttonText: R.strings.button,
          prefixIcon: const Icon(Icons.close),
          onPressed: () => controller.toast(),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextButtonWidget(
          buttonText: R.strings.button,
          textStyle: AppTextStyleExt.of.textBody1rUnderline,
          onPressed: () => controller.toast(),
        ),
      ],
    );
  }

  Widget _circle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextBody1Widget(text: 'Circle Button'),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppFilledButtonWidget(
                  buttonText: 'A',
                  appButtonType: AppButtonType.circle,
                  appButtonSize: AppButtonSize.large,
                  onPressed: () => controller.toast(),
                ).build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget(
                    buttonText: 'A',
                    appButtonType: AppButtonType.circle,
                    appButtonSize: AppButtonSize.medium,
                    onPressed: () => controller.toast()).build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget(
                    buttonText: 'A',
                    appButtonType: AppButtonType.circle,
                    appButtonSize: AppButtonSize.small,
                    onPressed: () => controller.toast()).build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget(
                    buttonText: 'A',
                    appButtonType: AppButtonType.circle,
                    isDisabled: true,
                    onPressed: () => controller.toast()).build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget.icon(
                    appButtonType: AppButtonType.circle,
                    prefixIcon: const Icon(Icons.close),
                    onPressed: () => controller.toast()).build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget.icon(
                    appButtonType: AppButtonType.circle,
                    prefixIcon: const Icon(Icons.close),
                    isDisabled: true,
                    onPressed: () => controller.toast()).build(context),
              ],
            ),
            SizedBox(width: AppThemeExt.of.majorScale(2)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppOutlinedButtonWidget(
                  buttonText: 'A',
                  appButtonType: AppButtonType.circle,
                  appButtonSize: AppButtonSize.large,
                  onPressed: () => controller.toast(),
                ),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppOutlinedButtonWidget(
                  buttonText: 'A',
                  appButtonType: AppButtonType.circle,
                  appButtonSize: AppButtonSize.medium,
                  onPressed: () => controller.toast(),
                ),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppOutlinedButtonWidget(
                  buttonText: 'A',
                  appButtonType: AppButtonType.circle,
                  appButtonSize: AppButtonSize.small,
                  onPressed: () => controller.toast(),
                ),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppOutlinedButtonWidget(
                  buttonText: 'A',
                  appButtonType: AppButtonType.circle,
                  isDisabled: true,
                  onPressed: () => controller.toast(),
                ),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppOutlinedButtonWidget.icon(
                  appButtonType: AppButtonType.circle,
                  prefixIcon: const Icon(Icons.close),
                  onPressed: () => controller.toast(),
                ),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppOutlinedButtonWidget.icon(
                  appButtonType: AppButtonType.circle,
                  prefixIcon: const Icon(Icons.close),
                  isDisabled: true,
                  onPressed: () => controller.toast(),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget _square(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextBody1Widget(text: 'Square Button'),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppFilledButtonWidget(
                  buttonText: 'A',
                  appButtonType: AppButtonType.square,
                  appButtonSize: AppButtonSize.large,
                  onPressed: () => controller.toast(),
                ).build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget(
                  buttonText: 'A',
                  appButtonType: AppButtonType.square,
                  appButtonSize: AppButtonSize.medium,
                  onPressed: () => controller.toast(),
                ).build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget(
                  buttonText: 'A',
                  appButtonType: AppButtonType.square,
                  appButtonSize: AppButtonSize.small,
                  onPressed: () => controller.toast(),
                ).build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget(
                  buttonText: 'A',
                  appButtonType: AppButtonType.square,
                  isDisabled: true,
                  onPressed: () => controller.toast(),
                ).build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget.icon(
                  appButtonType: AppButtonType.square,
                  prefixIcon: const Icon(Icons.close),
                  onPressed: () => controller.toast(),
                ).build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget.icon(
                  appButtonType: AppButtonType.square,
                  prefixIcon: const Icon(Icons.close),
                  isDisabled: true,
                  onPressed: () => controller.toast(),
                ).build(context),
              ],
            ),
            SizedBox(width: AppThemeExt.of.majorScale(2)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppOutlinedButtonWidget(
                  buttonText: 'A',
                  appButtonType: AppButtonType.square,
                  appButtonSize: AppButtonSize.large,
                  onPressed: () => controller.toast(),
                ),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppOutlinedButtonWidget(
                  buttonText: 'A',
                  appButtonType: AppButtonType.square,
                  appButtonSize: AppButtonSize.medium,
                  onPressed: () => controller.toast(),
                ),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppOutlinedButtonWidget(
                  buttonText: 'A',
                  appButtonType: AppButtonType.square,
                  appButtonSize: AppButtonSize.small,
                  onPressed: () => controller.toast(),
                ),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppOutlinedButtonWidget(
                  buttonText: 'A',
                  appButtonType: AppButtonType.square,
                  isDisabled: true,
                  onPressed: () => controller.toast(),
                ),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppOutlinedButtonWidget.icon(
                  appButtonType: AppButtonType.square,
                  prefixIcon: const Icon(Icons.close),
                  onPressed: () => controller.toast(),
                ),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppOutlinedButtonWidget.icon(
                  appButtonType: AppButtonType.square,
                  isDisabled: true,
                  prefixIcon: const Icon(Icons.close),
                  onPressed: () => controller.toast(),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _danger(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextBody1Widget(text: 'Danger Button'),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppFilledButtonWidget(
          buttonText: R.strings.button,
          appButtonType: AppButtonType.danger,
          appButtonSize: AppButtonSize.large,
          onPressed: () => controller.toast(),
        ).build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppFilledButtonWidget(
          buttonText: R.strings.button,
          appButtonType: AppButtonType.danger,
          appButtonSize: AppButtonSize.medium,
          onPressed: () => controller.toast(),
        ).build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppFilledButtonWidget(
          buttonText: R.strings.button,
          appButtonType: AppButtonType.danger,
          appButtonSize: AppButtonSize.small,
          onPressed: () => controller.toast(),
        ).build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppFilledButtonWidget(
          buttonText: R.strings.button,
          appButtonType: AppButtonType.danger,
          isDisabled: true,
          onPressed: () => controller.toast(),
        ).build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppFilledButtonWidget.icon(
          buttonText: R.strings.button,
          appButtonType: AppButtonType.danger,
          prefixIcon: const Icon(Icons.close),
          onPressed: () => controller.toast(),
        ).build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppFilledButtonWidget.icon(
          buttonText: R.strings.button,
          appButtonType: AppButtonType.danger,
          prefixIcon: const Icon(Icons.close),
          isDisabled: true,
          onPressed: () => controller.toast(),
        ).build(context),
      ],
    );
  }

  Widget _outlinedDanger(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextBody1Widget(
          text: 'Outlined Danger Button',
          maxLines: 1,
          textOverflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppOutlinedButtonWidget(
          buttonText: R.strings.button,
          appButtonType: AppButtonType.danger,
          appButtonSize: AppButtonSize.large,
          onPressed: () => controller.toast(),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppOutlinedButtonWidget(
          buttonText: R.strings.button,
          appButtonType: AppButtonType.danger,
          appButtonSize: AppButtonSize.medium,
          onPressed: () => controller.toast(),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppOutlinedButtonWidget(
          buttonText: R.strings.button,
          appButtonType: AppButtonType.danger,
          appButtonSize: AppButtonSize.small,
          onPressed: () => controller.toast(),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppOutlinedButtonWidget(
          buttonText: R.strings.button,
          appButtonType: AppButtonType.danger,
          isDisabled: true,
          onPressed: () => controller.toast(),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppOutlinedButtonWidget.icon(
          buttonText: R.strings.button,
          appButtonType: AppButtonType.danger,
          prefixIcon: const Icon(Icons.close),
          onPressed: () => controller.toast(),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppOutlinedButtonWidget.icon(
          buttonText: R.strings.button,
          appButtonType: AppButtonType.danger,
          isDisabled: true,
          prefixIcon: const Icon(Icons.close),
          onPressed: () => controller.toast(),
        ),
      ],
    );
  }

  Widget _textDanger(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextBody1Widget(text: 'Text Danger Button'),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextButtonWidget(
          buttonText: R.strings.button,
          appButtonType: AppButtonType.danger,
          appButtonSize: AppButtonSize.large,
          onPressed: () => controller.toast(),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextButtonWidget(
          buttonText: R.strings.button,
          appButtonType: AppButtonType.danger,
          appButtonSize: AppButtonSize.medium,
          onPressed: () => controller.toast(),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextButtonWidget(
          buttonText: R.strings.button,
          appButtonSize: AppButtonSize.small,
          appButtonType: AppButtonType.danger,
          onPressed: () => controller.toast(),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextButtonWidget(
          buttonText: R.strings.button,
          appButtonType: AppButtonType.danger,
          isDisabled: true,
          onPressed: () => controller.toast(),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextButtonWidget.icon(
          buttonText: R.strings.button,
          appButtonType: AppButtonType.danger,
          prefixIcon: const Icon(Icons.close),
          onPressed: () => controller.toast(),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextButtonWidget.icon(
          buttonText: R.strings.button,
          appButtonType: AppButtonType.danger,
          isDisabled: true,
          prefixIcon: const Icon(Icons.close),
          onPressed: () => controller.toast(),
        ),
      ],
    );
  }
}
