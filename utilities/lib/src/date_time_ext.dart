import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeExt {
  const DateTimeExt._();

  static const String ddMMyyy = 'dd/MM/yyy';

  static String dateTimeToDisplay(
      {required DateTime? dateTime, String pattern = ddMMyyy}) {
    return dateTime != null
        ? DateFormat(pattern).format(dateTime)
        : '--/--/----';
  }

  static String timeToDisplay(
      {required DateTime? dateTime, String pattern = ddMMyyy}) {
    return dateTime != null
        ? DateFormat(pattern).format(dateTime)
        : '--/--/----';
  }

  static String dateTimeRangeToDisplay(
      {required DateTimeRange? dateTimeRange, String pattern = ddMMyyy}) {
    return dateTimeRange != null
        ? '${dateTimeToDisplay(dateTime: dateTimeRange.start, pattern: pattern)} - ${dateTimeToDisplay(dateTime: dateTimeRange.end, pattern: pattern)}'
        : '--/--/---- - --/--/----';
  }

  static DateTime? stringToDate({required String? date}) {
    return date != null ? DateTime.tryParse(date) : null;
  }
}

extension AppDateTime on DateTime {
  DateTime addExt(int days) => add(Duration(days: days));

  DateTime subtractExt(int days) => subtract(Duration(days: days));
}
