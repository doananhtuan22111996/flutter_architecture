import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:utilities/utilities.dart';

import '../../../exts/R.dart';

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

abstract class AppDatePickerBaseBuilder extends StatelessWidget {
  static const Duration _durationYears = Duration(days: 10 * 365);

  /* 10 yrs*/
  final DateTime _limitFirstDate = DateTime.now().subtract(_durationYears);
  final DateTime _limitLastDate = DateTime.now().add(_durationYears);

  /// [_fieldKey] for FormBuilderField
  @protected
  final String fieldKey;

  /// [initialDate] for Date picker
  @protected
  final DateTime? initialDate;

  /// [initialDateRange] for Date range picker
  @protected
  final DateTimeRange? initialDateRange;

  /// [initialTime] for Time picker
  @protected
  final TimeOfDay? initialTime;

  @protected
  final DateTime? firstDate;
  @protected
  final DateTime? lastDate;
  @protected
  final bool? isDisabled;
  @protected
  final String? hintText;
  @protected
  final AppDatePickerSize? appDatePickerSize;
  @protected
  final void Function(DateTime? datePicked)? onDatePicked;
  @protected
  final void Function(DateTimeRange? dateRangePicked)? onDateRangePicked;
  @protected
  final void Function(TimeOfDay? timePicker)? onTimePicked;

  AppDatePickerBaseBuilder({
    super.key,
    required this.fieldKey,
    this.initialDate,
    this.initialDateRange,
    this.initialTime,
    this.firstDate,
    this.lastDate,
    this.isDisabled,
    this.hintText,
    this.appDatePickerSize,
    this.onDatePicked,
    this.onDateRangePicked,
    this.onTimePicked,
  });
}
