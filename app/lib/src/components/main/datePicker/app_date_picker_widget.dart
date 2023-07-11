part of 'app_date_picker_base_builder.dart';

class AppDatePickerWidget extends AppDatePickerBaseBuilder {
  @override
  AppDatePickerBaseBuilder setFieldKey(String fieldKey) {
    _fieldKey = fieldKey;
    return this;
  }

  @override
  AppDatePickerBaseBuilder setInitialDate(DateTime? initialDate) {
    _initialDate = initialDate;
    return super.setInitialDate(initialDate);
  }

  @override
  AppDatePickerBaseBuilder setOnDatePicked(
      void Function(DateTime? datePicked)? onDatePicked) {
    _onDatePicked = onDatePicked;
    return super.setOnDatePicked(onDatePicked);
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
    return FormBuilderField<DateTime?>(
      name: _fieldKey,
      initialValue: _initialDate,
      builder: (field) => InkWell(
        onTap: _isDisabled == true
            ? null
            : () async {
                final datePicked = await open(context, field.value);
                if (datePicked != null) {
                  field.didChange(datePicked);
                  _onDatePicked?.call(datePicked);
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
              borderSide: BorderSide(color: AppColors.of.neutralColor[5]!),
            ),
            contentPadding: contentPadding,
            suffixIconConstraints: suffixIconConstraints,
            suffixIcon: Icon(
              Icons.calendar_today,
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

  Widget _text(BuildContext context, DateTime? initialDate) {
    final textColor = _isDisabled == true
        ? AppColors.of.neutralColor[5]
        : AppColors.of.neutralColor;
    if (_appDatePickerSize == AppDatePickerSize.large) {
      return AppTextBody1Widget()
          .setText(DateTimeExt.dateTimeToDisplay(dateTime: initialDate))
          .setTextStyle(
              AppTextStyleExt.of.textBody1r?.copyWith(color: textColor))
          .build(context);
    }
    return AppTextBody2Widget()
        .setText(DateTimeExt.dateTimeToDisplay(dateTime: initialDate))
        .setTextStyle(AppTextStyleExt.of.textBody2r?.copyWith(color: textColor))
        .build(context);
  }

  Widget _hint(BuildContext context) {
    if (_appDatePickerSize == AppDatePickerSize.large) {
      return AppTextBody1Widget()
          .setText(_hintText ?? R.strings.datePickerHint)
          .setTextStyle(
            AppTextStyleExt.of.textBody1r
                ?.copyWith(color: AppColors.of.neutralColor[5]),
          )
          .build(context);
    }
    return AppTextBody2Widget()
        .setText(_hintText ?? R.strings.datePickerHint)
        .setTextStyle(
          AppTextStyleExt.of.textBody2r
              ?.copyWith(color: AppColors.of.neutralColor[5]),
        )
        .build(context);
  }

  Future<DateTime?> open(BuildContext context, DateTime? initialDate) async {
    return await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: _firstDate ?? _limitFirstDate,
      lastDate: _lastDate ?? _limitLastDate,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      builder: (context, child) {
        return Theme(
          data: context.theme.copyWith(
            // TODO
            datePickerTheme: context.theme.datePickerTheme.copyWith(
              backgroundColor: AppColors.of.neutralColor[1],
              surfaceTintColor: AppColors.of.neutralColor[1],
            ),
            textButtonTheme: TextButtonThemeData(
              style: AppButtonStyle.textButtonStyle,
            ),
            colorScheme: context.theme.colorScheme.copyWith(
              brightness: AppColors.of.brightness,
              primary: AppColors.of.primaryColor,
            ),
            textTheme: context.textTheme.copyWith(
              bodySmall: AppTextStyleExt.of.textBody2r,
            ),
          ),
          child: child!,
        );
      },
    );
  }
}
