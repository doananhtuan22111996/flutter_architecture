part of 'app_date_picker_base_builder.dart';

class AppTimePickerWidget extends AppDatePickerBaseBuilder {
  @override
  AppDatePickerBaseBuilder setFieldKey(String fieldKey) {
    _fieldKey = fieldKey;
    return this;
  }

  @override
  AppDatePickerBaseBuilder setInitialTime(TimeOfDay? initialTime) {
    _initialTime = initialTime;
    return super.setInitialTime(initialTime);
  }

  @override
  AppDatePickerBaseBuilder setOnTimePicked(
      void Function(TimeOfDay? timePicked)? onTimePicked) {
    _onTimePicked = onTimePicked;
    return super.setOnTimePicked(onTimePicked);
  }

  @override
  AppDatePickerBaseBuilder setAppDatePickerSize(
      AppDatePickerSize? appDatePickerSize) {
    _appDatePickerSize = appDatePickerSize;
    return super.setAppDatePickerSize(appDatePickerSize);
  }

  @override
  AppDatePickerBaseBuilder setIsDisabled(bool? isDisabled) {
    _isDisabled = isDisabled;
    return super.setIsDisabled(isDisabled);
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets contentPadding =
        EdgeInsets.only(left: AppThemeExt.of.majorScale(3));
    BoxConstraints suffixIconConstraints = BoxConstraints.expand(
      width: AppThemeExt.of.majorScale(10),
      height: AppDatePickerSize.medium.value,
    );
    double iconSize = AppThemeExt.of.majorScale(3);
    if (_appDatePickerSize == AppDatePickerSize.small) {
      contentPadding = EdgeInsets.only(left: AppThemeExt.of.majorScale(2));
      suffixIconConstraints = BoxConstraints.expand(
        width: AppThemeExt.of.majorScale(8),
        height: _appDatePickerSize!.value,
      );
    }
    if (_appDatePickerSize == AppDatePickerSize.large) {
      contentPadding = EdgeInsets.only(left: AppThemeExt.of.majorScale(4));
      iconSize = AppThemeExt.of.majorScale(4);
      suffixIconConstraints = BoxConstraints.expand(
        width: AppThemeExt.of.majorScale(13),
        height: _appDatePickerSize!.value,
      );
    }
    return FormBuilderField<TimeOfDay?>(
      name: _fieldKey,
      initialValue: _initialTime,
      builder: (field) => InkWell(
        onTap: _isDisabled == true
            ? null
            : () async {
                final timePicked = await open(context, field.value);
                if (timePicked != null) {
                  field.didChange(timePicked);
                  _onTimePicked?.call(timePicked);
                }
              },
        borderRadius: BorderRadius.circular(AppThemeExt.of.majorScale(1)),
        child: InputDecorator(
          decoration: InputDecoration(
            constraints: BoxConstraints.expand(
                height: _appDatePickerSize?.value ??
                    AppDatePickerSize.medium.value),
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
              color: _isDisabled == true
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
    final textColor = _isDisabled == true
        ? AppColors.of.neutralColor[5]
        : AppColors.of.neutralColor;
    if (_appDatePickerSize == AppDatePickerSize.large) {
      return AppTextBody1Widget()
          .setText(initialTime?.format(context))
          .setTextStyle(
              AppTextStyleExt.of.textBody1r?.copyWith(color: textColor))
          .build(context);
    }
    return AppTextBody2Widget()
        .setText(initialTime?.format(context))
        .setTextStyle(AppTextStyleExt.of.textBody2r?.copyWith(color: textColor))
        .build(context);
  }

  Widget _hint(BuildContext context) {
    if (_appDatePickerSize == AppDatePickerSize.large) {
      return AppTextBody1Widget()
          .setText(_hintText ?? R.strings.timePickerHint)
          .setTextStyle(
            AppTextStyleExt.of.textBody1r
                ?.copyWith(color: AppColors.of.neutralColor[5]),
          )
          .build(context);
    }
    return AppTextBody2Widget()
        .setText(_hintText ?? R.strings.timePickerHint)
        .setTextStyle(
          AppTextStyleExt.of.textBody2r
              ?.copyWith(color: AppColors.of.neutralColor[5]),
        )
        .build(context);
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
            // TODO
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
