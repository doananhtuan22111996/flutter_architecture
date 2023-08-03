part of 'text_field_controller.dart';

class TextFieldPage extends GetView<TextFieldController> {
  const TextFieldPage({Key? key}) : super(key: key);

  static void open() {
    Get.toNamed(Routes.textField);
  }

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget()
        .setAppBar(
            AppBarWidget().setHeaderPage(R.strings.textField).build(context))
        .setBody(_body(context))
        .build(context);
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(AppThemeExt.of.majorScale(4)),
        child: FormBuilder(
          key: controller.formKey,
          initialValue: const {
            'textField2': 'Text Field Medium',
            'textField1': 'Text Field Medium',
            'textField99': 'Text Field Medium Disabled',
            'textField3': 'Text Field Large',
            'textField4': 'Text Field Large Disabled',
            'textField5': 'Text Field Small',
            'textField6': 'Text Field Small Disabled',
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _small(context),
              SizedBox(height: AppThemeExt.of.majorScale(4)),
              _medium(context),
              SizedBox(height: AppThemeExt.of.majorScale(4)),
              _large(context),
              SizedBox(height: AppThemeExt.of.majorScale(4)),
              _search(context),
              SizedBox(height: AppThemeExt.of.majorScale(4)),
              SizedBox(
                width: double.infinity,
                child: AppFilledButtonWidget()
                    .setButtonText('buttonText')
                    .setOnPressed(() {
                  controller.formKey.currentState?.saveAndValidate();
                }).build(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _medium(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextHeading4Widget().setText('Text Field Medium').build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextFieldWithClearWidget(
                textNotifier:
                    ValueNotifier<String?>('Text Field Medium Disabled'))
            .setFieldKey('textField1')
            .setValidator(
                FormBuilderValidators.required(errorText: 'Required Text'))
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextFieldWithClearWidget()
            .setFieldKey('textField77')
            .setValidator(
                FormBuilderValidators.required(errorText: 'Required Text'))
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextFieldPasswordWidget().setFieldKey('textField99').build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextFieldWidget()
            .setFieldKey('textField2')
            // .setValue('Text Field Medium Disabled')
            .setIsDisabled(true)
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextFieldWidget().setFieldKey('textField98').build(context),
      ],
    );
  }

  Widget _large(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextHeading4Widget().setText('Text Field Large').build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextFieldWidget()
            .setFieldKey('textField3')
            .setAppTextFieldSize(AppTextFieldSize.large)
            .setValidator(
                FormBuilderValidators.required(errorText: 'Required Text'))
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextFieldWidget()
            .setFieldKey('textField4')
            .setAppTextFieldSize(AppTextFieldSize.large)
            .setIsDisabled(true)
            .build(context),
      ],
    );
  }

  Widget _small(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextHeading4Widget().setText('Text Field Small').build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextFieldWidget()
            .setFieldKey('textField5')
            .setAppTextFieldSize(AppTextFieldSize.small)
            .setValidator(
                FormBuilderValidators.required(errorText: 'Required Text'))
            .build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextFieldWidget()
            .setFieldKey('textField6')
            .setAppTextFieldSize(AppTextFieldSize.small)
            .setIsDisabled(true)
            .build(context),
      ],
    );
  }

  Widget _search(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextHeading4Widget().setText('Text Field Search').build(context),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextFieldSearchWidget()
            .setFieldKey('textField88')
            .setValidator(
                FormBuilderValidators.required(errorText: 'Required Text'))
            .build(context),
      ],
    );
  }
}
