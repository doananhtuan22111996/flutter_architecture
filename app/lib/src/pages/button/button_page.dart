part of 'button_controller.dart';

class ButtonPage extends GetView<ButtonController> {
  const ButtonPage({Key? key}) : super(key: key);

  static void open() {
    Get.toNamed(Routes.button);
  }

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget()
        .setAppBar(
            AppBarWidget().setHeaderPage(R.strings.button).build(context))
        .setBody(_body(context))
        .build(context);
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
        AppTextBody1Widget().setText('Filled Button').build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppFilledButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonSize(AppButtonSize.large)
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppFilledButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonSize(AppButtonSize.medium)
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppFilledButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonSize(AppButtonSize.small)
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppFilledButtonWidget()
            .setButtonText(R.strings.button)
            .setIsDisabled(true)
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppFilledButtonWidget()
            .setButtonText(R.strings.button)
            .setPrefixIcon(const Icon(Icons.close))
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppFilledButtonWidget()
            .setButtonText(R.strings.button)
            .setIsDisabled(true)
            .setPrefixIcon(const Icon(Icons.close))
            .setOnPressed(() => controller.toast())
            .build(context),
      ],
    );
  }

  Widget _outlined(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextBody1Widget().setText('Outlined Button').build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppOutlinedButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonSize(AppButtonSize.large)
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppOutlinedButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonSize(AppButtonSize.medium)
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppOutlinedButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonSize(AppButtonSize.small)
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppOutlinedButtonWidget()
            .setButtonText(R.strings.button)
            .setIsDisabled(true)
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppOutlinedButtonWidget()
            .setButtonText(R.strings.button)
            .setPrefixIcon(const Icon(Icons.close))
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppOutlinedButtonWidget()
            .setButtonText(R.strings.button)
            .setIsDisabled(true)
            .setPrefixIcon(const Icon(Icons.close))
            .setOnPressed(() => controller.toast())
            .build(context),
      ],
    );
  }

  Widget _text(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextBody1Widget().setText('Text Button').build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonSize(AppButtonSize.large)
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonSize(AppButtonSize.medium)
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonSize(AppButtonSize.small)
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextButtonWidget()
            .setButtonText(R.strings.button)
            .setIsDisabled(true)
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextButtonWidget()
            .setButtonText(R.strings.button)
            .setPrefixIcon(const Icon(Icons.close))
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextButtonWidget()
            .setButtonText(R.strings.button)
            .setTextStyle(AppTextStyleExt.of.textBody1rUnderline)
            .setOnPressed(() => controller.toast())
            .build(context),
      ],
    );
  }

  Widget _circle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextBody1Widget().setText('Circle Button').build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppFilledButtonWidget()
                    .setButtonText('A')
                    .setAppButtonType(AppButtonType.circle)
                    .setAppButtonSize(AppButtonSize.large)
                    .setOnPressed(() => controller.toast())
                    .build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget()
                    .setButtonText('A')
                    .setAppButtonType(AppButtonType.circle)
                    .setAppButtonSize(AppButtonSize.medium)
                    .setOnPressed(() => controller.toast())
                    .build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget()
                    .setButtonText('A')
                    .setAppButtonType(AppButtonType.circle)
                    .setAppButtonSize(AppButtonSize.small)
                    .setOnPressed(() => controller.toast())
                    .build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget()
                    .setButtonText('A')
                    .setAppButtonType(AppButtonType.circle)
                    .setIsDisabled(true)
                    .setOnPressed(() => controller.toast())
                    .build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget()
                    .setAppButtonType(AppButtonType.circle)
                    .setPrefixIcon(const Icon(Icons.close))
                    .setOnPressed(() => controller.toast())
                    .build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget()
                    .setAppButtonType(AppButtonType.circle)
                    .setIsDisabled(true)
                    .setPrefixIcon(const Icon(Icons.close))
                    .setOnPressed(() => controller.toast())
                    .build(context),
              ],
            ),
            SizedBox(width: AppThemeExt.of.majorScale(2)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppOutlinedButtonWidget()
                    .setButtonText('A')
                    .setAppButtonType(AppButtonType.circle)
                    .setAppButtonSize(AppButtonSize.large)
                    .setOnPressed(() => controller.toast())
                    .build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppOutlinedButtonWidget()
                    .setButtonText('A')
                    .setAppButtonType(AppButtonType.circle)
                    .setAppButtonSize(AppButtonSize.medium)
                    .setOnPressed(() => controller.toast())
                    .build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppOutlinedButtonWidget()
                    .setButtonText('A')
                    .setAppButtonType(AppButtonType.circle)
                    .setAppButtonSize(AppButtonSize.small)
                    .setOnPressed(() => controller.toast())
                    .build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppOutlinedButtonWidget()
                    .setButtonText('A')
                    .setAppButtonType(AppButtonType.circle)
                    .setIsDisabled(true)
                    .setOnPressed(() => controller.toast())
                    .build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppOutlinedButtonWidget()
                    .setAppButtonType(AppButtonType.circle)
                    .setPrefixIcon(const Icon(Icons.close))
                    .setOnPressed(() => controller.toast())
                    .build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppOutlinedButtonWidget()
                    .setAppButtonType(AppButtonType.circle)
                    .setPrefixIcon(const Icon(Icons.close))
                    .setIsDisabled(true)
                    .setOnPressed(() => controller.toast())
                    .build(context),
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
        AppTextBody1Widget().setText('Square Button').build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppFilledButtonWidget()
                    .setButtonText('A')
                    .setAppButtonType(AppButtonType.square)
                    .setAppButtonSize(AppButtonSize.large)
                    .setOnPressed(() => controller.toast())
                    .build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget()
                    .setButtonText('A')
                    .setAppButtonType(AppButtonType.square)
                    .setAppButtonSize(AppButtonSize.medium)
                    .setOnPressed(() => controller.toast())
                    .build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget()
                    .setButtonText('A')
                    .setAppButtonType(AppButtonType.square)
                    .setAppButtonSize(AppButtonSize.small)
                    .setOnPressed(() => controller.toast())
                    .build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget()
                    .setButtonText('A')
                    .setAppButtonType(AppButtonType.square)
                    .setIsDisabled(true)
                    .setOnPressed(() => controller.toast())
                    .build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget()
                    .setAppButtonType(AppButtonType.square)
                    .setPrefixIcon(const Icon(Icons.close))
                    .setOnPressed(() => controller.toast())
                    .build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppFilledButtonWidget()
                    .setAppButtonType(AppButtonType.square)
                    .setIsDisabled(true)
                    .setPrefixIcon(const Icon(Icons.close))
                    .setOnPressed(() => controller.toast())
                    .build(context),
              ],
            ),
            SizedBox(width: AppThemeExt.of.majorScale(2)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppOutlinedButtonWidget()
                    .setButtonText('A')
                    .setAppButtonType(AppButtonType.square)
                    .setAppButtonSize(AppButtonSize.large)
                    .setOnPressed(() => controller.toast())
                    .build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppOutlinedButtonWidget()
                    .setButtonText('A')
                    .setAppButtonType(AppButtonType.square)
                    .setAppButtonSize(AppButtonSize.medium)
                    .setOnPressed(() => controller.toast())
                    .build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppOutlinedButtonWidget()
                    .setButtonText('A')
                    .setAppButtonType(AppButtonType.square)
                    .setAppButtonSize(AppButtonSize.small)
                    .setOnPressed(() => controller.toast())
                    .build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppOutlinedButtonWidget()
                    .setButtonText('A')
                    .setAppButtonType(AppButtonType.square)
                    .setIsDisabled(true)
                    .setOnPressed(() => controller.toast())
                    .build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppOutlinedButtonWidget()
                    .setAppButtonType(AppButtonType.square)
                    .setPrefixIcon(const Icon(Icons.close))
                    .setOnPressed(() => controller.toast())
                    .build(context),
                SizedBox(height: AppThemeExt.of.majorScale(2)),
                AppOutlinedButtonWidget()
                    .setAppButtonType(AppButtonType.square)
                    .setIsDisabled(true)
                    .setPrefixIcon(const Icon(Icons.close))
                    .setOnPressed(() => controller.toast())
                    .build(context),
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
        AppTextBody1Widget().setText('Danger Button').build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppFilledButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonType(AppButtonType.danger)
            .setAppButtonSize(AppButtonSize.large)
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppFilledButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonType(AppButtonType.danger)
            .setAppButtonSize(AppButtonSize.medium)
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppFilledButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonType(AppButtonType.danger)
            .setAppButtonSize(AppButtonSize.small)
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppFilledButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonType(AppButtonType.danger)
            .setIsDisabled(true)
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppFilledButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonType(AppButtonType.danger)
            .setPrefixIcon(const Icon(Icons.close))
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppFilledButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonType(AppButtonType.danger)
            .setIsDisabled(true)
            .setPrefixIcon(const Icon(Icons.close))
            .setOnPressed(() => controller.toast())
            .build(context),
      ],
    );
  }

  Widget _outlinedDanger(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextBody1Widget()
            .setText('Outlined Danger Button')
            .setMaxLines(1)
            .setTextOverFlow(TextOverflow.ellipsis)
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppOutlinedButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonType(AppButtonType.danger)
            .setAppButtonSize(AppButtonSize.large)
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppOutlinedButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonType(AppButtonType.danger)
            .setAppButtonSize(AppButtonSize.medium)
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppOutlinedButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonType(AppButtonType.danger)
            .setAppButtonSize(AppButtonSize.small)
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppOutlinedButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonType(AppButtonType.danger)
            .setIsDisabled(true)
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppOutlinedButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonType(AppButtonType.danger)
            .setPrefixIcon(const Icon(Icons.close))
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppOutlinedButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonType(AppButtonType.danger)
            .setIsDisabled(true)
            .setPrefixIcon(const Icon(Icons.close))
            .setOnPressed(() => controller.toast())
            .build(context),
      ],
    );
  }

  Widget _textDanger(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextBody1Widget().setText('Text Danger Button').build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonType(AppButtonType.danger)
            .setAppButtonSize(AppButtonSize.large)
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonType(AppButtonType.danger)
            .setAppButtonSize(AppButtonSize.medium)
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonType(AppButtonType.danger)
            .setAppButtonSize(AppButtonSize.small)
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonType(AppButtonType.danger)
            .setIsDisabled(true)
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonType(AppButtonType.danger)
            .setPrefixIcon(const Icon(Icons.close))
            .setOnPressed(() => controller.toast())
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextButtonWidget()
            .setButtonText(R.strings.button)
            .setAppButtonType(AppButtonType.danger)
            .setIsDisabled(true)
            .setPrefixIcon(const Icon(Icons.close))
            .setOnPressed(() => controller.toast())
            .build(context),
      ],
    );
  }
}
