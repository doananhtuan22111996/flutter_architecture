import 'package:app/src/components/main/appBar/app_bar_base_builder.dart';
import 'package:app/src/components/main/datePicker/app_date_picker_base_builder.dart';
import 'package:app/src/components/main/page/app_main_page_base_builder.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/main/toast/app_toast_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:utilities/utilities.dart';

import '../../exts/R.dart';

part 'date_picker_binding.dart';

part 'date_picker_page.dart';

class DatePickerController extends GetxController {
  void toastDateRange(DateTimeRange? dateRangePicker) {
    AppToastWidget(title: '$dateRangePicker', appToastType: AppToastType.info)
        .show();
  }

  void toastDate(DateTime? datePicker) {
    AppToastWidget(title: '$datePicker', appToastType: AppToastType.info)
        .show();
  }

  void toastTime(TimeOfDay? timePicker) {
    AppToastWidget(title: '$timePicker', appToastType: AppToastType.info)
        .show();
  }
}
