part of 'selection_control_controller.dart';

class SelectionControlPage extends GetWidget<SelectionControlController> {
  const SelectionControlPage({super.key});

  static void open() {
    Get.toNamed(Routes.selectionControl);
  }

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      appBar:
          AppBarWidget(headerPage: R.strings.selectionControl).build(context),
      body: _body(context),
    );
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
        const AppTextHeading4Widget(text: 'CheckBox'),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        const AppCheckBoxWidget(
          fieldKey: 'checkBox1',
          label: 'Label',
          value: true,
        ),
        const AppCheckBoxWidget(
            fieldKey: 'checkBox2', label: 'Label', value: false),
        const AppCheckBoxWidget(
          fieldKey: 'checkBox3',
          label: 'Label',
          value: false,
          isDisabled: true,
        ),
      ],
    );
  }

  Widget _checkBoxNoLabel(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextHeading4Widget(text: 'Checkbox No Label'),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        const AppCheckBoxWidget.noLabel(fieldKey: 'checkBox4', value: true),
        const AppCheckBoxWidget.noLabel(fieldKey: 'checkBox5', value: false),
        const AppCheckBoxWidget.noLabel(
          fieldKey: 'checkBox6',
          value: false,
          isDisabled: true,
        ),
      ],
    );
  }

  Widget _radio(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextHeading4Widget(text: 'Radio'),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        const AppBasicRadioWidget(
            fieldKey: 'radio1', label: 'Radio', value: true),
        const AppBasicRadioWidget(
            fieldKey: 'radio2', label: 'Radio', value: false),
        const AppBasicRadioWidget(
          fieldKey: 'radio3',
          label: 'Radio',
          value: false,
          isDisabled: true,
        ),
      ],
    );
  }

  Widget _radioNoLabel(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextHeading4Widget(text: 'Radio No Label'),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        const AppBasicRadioWidget.noLabel(fieldKey: 'radio1', value: true),
        const AppBasicRadioWidget.noLabel(fieldKey: 'radio2', value: false),
        const AppBasicRadioWidget.noLabel(
            fieldKey: 'radio3', value: false, isDisabled: true),
      ],
    );
  }
}
