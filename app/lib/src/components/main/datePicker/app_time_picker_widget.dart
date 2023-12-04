part of 'app_date_picker_base_builder.dart';

class AppTimePickerWidget extends AppDatePickerBaseBuilder {
  AppTimePickerWidget({
    super.key,
    required super.fieldKey,
    super.initialTime,
    super.onTimePicked,
    super.appDatePickerSize,
    super.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    EdgeInsets contentPadding =
        EdgeInsets.only(left: AppThemeExt.of.majorScale(3));
    BoxConstraints suffixIconConstraints = BoxConstraints.expand(
      width: AppThemeExt.of.majorScale(10),
      height: AppDatePickerSize.medium.value,
    );
    double iconSize = AppThemeExt.of.majorScale(3);
    if (appDatePickerSize == AppDatePickerSize.small) {
      contentPadding = EdgeInsets.only(left: AppThemeExt.of.majorScale(2));
      suffixIconConstraints = BoxConstraints.expand(
        width: AppThemeExt.of.majorScale(8),
        height: appDatePickerSize!.value,
      );
    }
    if (appDatePickerSize == AppDatePickerSize.large) {
      contentPadding = EdgeInsets.only(left: AppThemeExt.of.majorScale(4));
      iconSize = AppThemeExt.of.majorScale(4);
      suffixIconConstraints = BoxConstraints.expand(
        width: AppThemeExt.of.majorScale(13),
        height: appDatePickerSize!.value,
      );
    }
    return FormBuilderField<TimeOfDay?>(
      name: fieldKey,
      initialValue: initialTime,
      builder: (field) => InkWell(
        onTap: isDisabled == true
            ? null
            : () async {
                final timePicked = await open(context, field.value);
                if (timePicked != null) {
                  field.didChange(timePicked);
                  onTimePicked?.call(timePicked);
                }
              },
        borderRadius: BorderRadius.circular(AppThemeExt.of.majorScale(1)),
        child: InputDecorator(
          decoration: InputDecoration(
            constraints: BoxConstraints.expand(
                height:
                    appDatePickerSize?.value ?? AppDatePickerSize.medium.value),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppThemeExt.of.majorScale(1)),
              borderSide: BorderSide(color: AppColors.of.neutralColor[5]!),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppThemeExt.of.majorScale(1)),
              borderSide: BorderSide(color: AppColors.of.neutralColor[2]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppThemeExt.of.majorScale(1)),
              borderSide: BorderSide(color: AppColors.of.neutralColor[5]!),
            ),
            contentPadding: contentPadding,
            suffixIconConstraints: suffixIconConstraints,
            suffixIcon: Icon(
              Icons.timelapse_outlined,
              size: iconSize,
              color: isDisabled == true
                  ? AppColors.of.neutralColor[5]
                  : AppColors.of.neutralColor,
            ),
          ),
          child: field.value == null
              ? _hint(context)
              : _text(context, field.value),
        ),
      ),
    );
  }

  Widget _text(BuildContext context, TimeOfDay? initialTime) {
    final textColor = isDisabled == true
        ? AppColors.of.neutralColor[5]
        : AppColors.of.neutralColor;
    if (appDatePickerSize == AppDatePickerSize.large) {
      return AppTextBody1Widget(
        text: initialTime?.format(context),
        textStyle: AppTextStyleExt.of.textBody1r?.copyWith(color: textColor),
      );
    }
    return AppTextBody2Widget(
      text: initialTime?.format(context),
      textStyle: AppTextStyleExt.of.textBody2r?.copyWith(color: textColor),
    );
  }

  Widget _hint(BuildContext context) {
    if (appDatePickerSize == AppDatePickerSize.large) {
      return AppTextBody1Widget(
          text: hintText ?? R.strings.timePickerHint,
          textStyle: AppTextStyleExt.of.textBody1r
              ?.copyWith(color: AppColors.of.neutralColor[5]));
    }
    return AppTextBody2Widget(
      text: hintText ?? R.strings.timePickerHint,
      textStyle: AppTextStyleExt.of.textBody2r
          ?.copyWith(color: AppColors.of.neutralColor[5]),
    );
  }

  Future<TimeOfDay?> open(BuildContext context, TimeOfDay? initialValue) async {
    return await showTimePicker(
      context: context,
      initialTime: initialValue ?? TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
      builder: (context, child) {
        return Theme(
          data: context.theme.copyWith(
            dialogTheme: context.theme.dialogTheme.copyWith(
              surfaceTintColor: AppColors.of.neutralColor[1],
            ),
            // TODO update theme follow syntax document flutter
            // timePickerTheme: context.theme.timePickerTheme.copyWith(
            //   surfaceTintColor: AppColors.of.neutralColor[1],
            // ),
            textButtonTheme:
                TextButtonThemeData(style: AppButtonStyle.textButtonStyle),
            colorScheme: context.theme.colorScheme.copyWith(
              brightness: AppColors.of.brightness,
              primary: AppColors.of.primaryColor,
            ),
            textTheme: context.textTheme.copyWith(
              bodyMedium: AppTextStyleExt.of.textBody3r,
            ),
          ),
          child: child!,
        );
      },
    );
  }
}
