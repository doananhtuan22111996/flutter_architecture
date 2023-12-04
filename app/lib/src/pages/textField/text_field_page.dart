part of 'text_field_controller.dart';

class TextFieldPage extends GetView<TextFieldController> {
  const TextFieldPage({Key? key}) : super(key: key);

  static void open() {
    Get.toNamed(Routes.textField);
  }

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      appBar: AppBarWidget(headerPage: R.strings.textField).build(context),
      body: _body(context),
    );
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
                child: AppFilledButtonWidget(
                  buttonText: 'buttonText',
                  onPressed: () {
                    controller.formKey.currentState?.saveAndValidate();
                  },
                ).build(context),
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
        const AppTextHeading4Widget(text: 'Text Field Medium'),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextFieldWithClearWidget(
          fieldKey: 'textField1',
          validator: FormBuilderValidators.required(errorText: 'Required Text'),
          textNotifier: ValueNotifier<String?>('Text Field Medium Disabled'),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextFieldWithClearWidget(
          fieldKey: 'textField77',
          validator: FormBuilderValidators.required(errorText: 'Required Text'),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextFieldPasswordWidget(fieldKey: 'textField99'),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextFieldWidget(
          fieldKey: 'textField2',
          isDisabled: true,
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextFieldWidget(fieldKey: 'textField98'),
      ],
    );
  }

  Widget _large(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextHeading4Widget(text: 'Text Field Large'),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextFieldWidget(
          fieldKey: 'textField3',
          appTextFieldSize: AppTextFieldSize.large,
          validator: FormBuilderValidators.required(errorText: 'Required Text'),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextFieldWidget(
          fieldKey: 'textField04',
          appTextFieldSize: AppTextFieldSize.large,
          isDisabled: true,
        ),
      ],
    );
  }

  Widget _small(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextHeading4Widget(text: 'Text Field Small'),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextFieldWidget(
          fieldKey: 'textField5',
          appTextFieldSize: AppTextFieldSize.small,
          validator: FormBuilderValidators.required(errorText: 'Required Text'),
        ),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextFieldWidget(
          fieldKey: 'textField6',
          appTextFieldSize: AppTextFieldSize.small,
          isDisabled: true,
        )
      ],
    );
  }

  Widget _search(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppTextHeading4Widget(text: 'Text Field Search'),
        SizedBox(height: AppThemeExt.of.majorScale(2)),
        AppTextFieldSearchWidget(
          fieldKey: 'textField88',
          validator: FormBuilderValidators.required(errorText: 'Required Text'),
        ),
      ],
    );
  }
}
