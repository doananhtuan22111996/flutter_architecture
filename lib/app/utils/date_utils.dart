import 'package:intl/intl.dart';

import '../constants/app_constants.dart';

class DateUtil {
  const DateUtil._();

  static String? formatDateRequest(DateTime? value) {
    return value != null
        ? DateFormat(AppConstants.dateTimeRequestFormat).format(value)
        : null;
  }
}
