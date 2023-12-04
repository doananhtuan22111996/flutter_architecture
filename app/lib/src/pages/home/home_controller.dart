import 'package:app/src/components/main/appBar/app_bar_base_builder.dart';
import 'package:app/src/components/main/page/app_main_page_base_builder.dart';
import 'package:app/src/components/main/tabBar/app_tab_bar_widget.dart';
import 'package:app/src/components/main/tabBar/app_tab_base_builder.dart';
import 'package:app/src/pages/home/view/doctor/doctor_controller.dart';
import 'package:app/src/pages/home/view/hospital/hospital_controller.dart';
import 'package:app/src/pages/home/view/sickType/sick_type_controller.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part 'home_binding.dart';

part 'home_page.dart';

class HomeController extends GetxController {
  final RxList<AppTabWithNumberWidget> numberTabs = [
    const AppTabWithNumberWidget(
      label: 'Label 1',
      appTabSize: AppTabSize.large,
    ),
    const AppTabWithNumberWidget(
      label: 'Label 2',
      appTabSize: AppTabSize.large,
    ),
    const AppTabWithNumberWidget(
      label: 'Label 3',
      appTabSize: AppTabSize.large,
    ),
  ].obs;
  RxInt numberIndex = 0.obs;

  void onNumberChanged({required int index, required int number}) {
    numberTabs.value = [
      ...numberTabs.map((element) {
        final indexOf = numberTabs.indexOf(element);
        return indexOf == index ? element.copyWith(number: number) : element;
      }).toList()
    ];
  }
}
