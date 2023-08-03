import 'package:app/src/components/main/appBar/app_bar_base_builder.dart';
import 'package:app/src/components/main/app_toast_widget.dart';
import 'package:app/src/components/main/datePicker/app_date_picker_base_builder.dart';
import 'package:app/src/components/main/page/app_main_page_base_builder.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';
import 'package:utilities/utilities.dart';

part 'date_picker_binding.dart';

part 'date_picker_page.dart';

class DatePickerController extends GetxController {
  void toastDateRange(DateTimeRange? dateRangePicker) {
    AppToastWidget.showSuccessToast(Get.context, message: '$dateRangePicker');
  }

  void toastDate(DateTime? datePicker) {
    AppToastWidget.showSuccessToast(Get.context, message: '$datePicker');
  }

  void toastTime(TimeOfDay? timePicker) {
    AppToastWidget.showSuccessToast(Get.context, message: '$timePicker');
  }
}
