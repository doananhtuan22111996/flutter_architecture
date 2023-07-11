part of 'selection_control_controller.dart';

class SelectionControlPage extends GetWidget<SelectionControlController> {
  const SelectionControlPage({super.key});

  static void open() {
    Get.toNamed(Routes.selectionControl);
  }

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget()
        .setAppBar(AppBarWidget()
            .setHeaderPage(R.strings.selectionControl)
            .build(context))
        .setBody(_body(context))
        .build(context);
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppThemeExt.of.majorScale(4)),
      child: Column(
        children: [
          Row(
            children: [
              _checkBox(context),
              _checkBoxNoLabel(context),
            ],
          ),
          Row(
            children: [
              _radio(context),
              _radioNoLabel(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _checkBox(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextHeading4Widget().setText('CheckBox').build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppCheckBoxWidget()
            .setFieldKey('checkBox1')
            .setLabel('Label')
            .setValue(true)
            .build(context),
        AppCheckBoxWidget()
            .setFieldKey('checkBox2')
            .setLabel('Label')
            .setValue(false)
            .build(context),
        AppCheckBoxWidget()
            .setFieldKey('checkBox3')
            .setLabel('Label')
            .setValue(false)
            .setIsDisabled(true)
            .build(context),
      ],
    );
  }

  Widget _checkBoxNoLabel(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextHeading4Widget().setText('CheckBox No Label').build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppCheckBoxWidget()
            .setFieldKey('checkBox4')
            .setValue(true)
            .build(context),
        AppCheckBoxWidget()
            .setFieldKey('checkBox5')
            .setValue(false)
            .build(context),
        AppCheckBoxWidget()
            .setFieldKey('checkBox6')
            .setValue(false)
            .setIsDisabled(true)
            .build(context),
      ],
    );
  }

  Widget _radio(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextHeading4Widget().setText('Radio').build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppBasicRadioWidget()
            .setFieldKey('radio1')
            .setLabel('Radio')
            .setValue(true)
            .build(context),
        AppBasicRadioWidget()
            .setFieldKey('radio2')
            .setLabel('Radio')
            .setValue(false)
            .build(context),
        AppBasicRadioWidget()
            .setFieldKey('radio3')
            .setLabel('Radio')
            .setValue(false)
            .setIsDisabled(true)
            .build(context),
      ],
    );
  }

  Widget _radioNoLabel(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextHeading4Widget().setText('Radio No Label').build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppBasicRadioWidget()
            .setFieldKey('radio1')
            .setValue(true)
            .build(context),
        AppBasicRadioWidget()
            .setFieldKey('radio2')
            .setValue(false)
            .build(context),
        AppBasicRadioWidget()
            .setFieldKey('radio3')
            .setValue(false)
            .setIsDisabled(true)
            .build(context),
      ],
    );
  }
}
