import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';
import 'package:utilities/utilities.dart';

part 'app_date_picker_widget.dart';
part 'app_date_range_picker_widget.dart';
part 'app_time_picker_widget.dart';

enum AppDatePickerSize {
  small(size: 'small', value: 24),
  medium(size: 'medium', value: 32),
  large(size: 'large', value: 40);

  final String size;
  final double value;
  const AppDatePickerSize({required this.size, required this.value});
}

abstract class AppDatePickerBaseBuilder {
  static const Duration _durationYears = Duration(days: 10 * 365); /* 10 yrs*/
  final DateTime _limitFirstDate = DateTime.now().subtract(_durationYears);
  final DateTime _limitLastDate = DateTime.now().add(_durationYears);

  /// [_fieldKey] for FormBuilderField
  @protected
  late final String _fieldKey;

  /// [_initialDate] for Date picker
  @protected
  DateTime? _initialDate;

  /// [_initialDateRange] for Date range picker
  @protected
  DateTimeRange? _initialDateRange;

  /// [_initialTime] for Time picker
  @protected
  TimeOfDay? _initialTime;

  @protected
  DateTime? _firstDate;
  @protected
  DateTime? _lastDate;
  @protected
  bool? _isDisabled;
  @protected
  String? _hintText;
  @protected
  AppDatePickerSize? _appDatePickerSize;
  @protected
  void Function(DateTime? datePicked)? _onDatePicked;
  @protected
  void Function(DateTimeRange? dateRangePicked)? _onDateRangePicked;
  @protected
  void Function(TimeOfDay? timePicker)? _onTimePicked;

  AppDatePickerBaseBuilder setFieldKey(String fieldKey);

  AppDatePickerBaseBuilder setInitialDate(DateTime? initialDate) {
    return this;
  }

  AppDatePickerBaseBuilder setInitialDateRange(
      DateTimeRange? initialDateRange) {
    return this;
  }

  AppDatePickerBaseBuilder setInitialTime(TimeOfDay? initialTime) {
    return this;
  }

  AppDatePickerBaseBuilder setFirstDate(DateTime? firstDate) {
    return this;
  }

  AppDatePickerBaseBuilder setLastDate(DateTime? lastDate) {
    return this;
  }

  AppDatePickerBaseBuilder setIsDisabled(bool? isDisabled) {
    return this;
  }

  AppDatePickerBaseBuilder setAppDatePickerSize(
      AppDatePickerSize? appDatePickerSize) {
    return this;
  }

  AppDatePickerBaseBuilder setHintText(String? hintText) {
    return this;
  }

  AppDatePickerBaseBuilder setOnDatePicked(
      void Function(DateTime? datePicked)? onDatePicked) {
    return this;
  }

  AppDatePickerBaseBuilder setOnDateRangePicked(
      void Function(DateTimeRange? dateRangePicked)? onDateRangePicked) {
    return this;
  }

  AppDatePickerBaseBuilder setOnTimePicked(
      void Function(TimeOfDay? timePicked)? onTimePicked) {
    return this;
  }

  Widget build(BuildContext context);
}
