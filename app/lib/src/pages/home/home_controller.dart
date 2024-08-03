import 'package:app/src/components/main/appBar/app_bar_base_builder.dart';
import 'package:app/src/components/main/page/app_main_page_base_builder.dart';
import 'package:app/src/components/main/tabBar/app_tab_bar_widget.dart';
import 'package:app/src/components/main/tabBar/app_tab_base_builder.dart';
import 'package:app/src/pages/home/view/paging/paging_controller.dart';
import 'package:app/src/pages/home/view/pagingLocal/paging_local_controller.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/main/toast/app_toast_base_builder.dart';
import '../../exts/R.dart';

part 'home_binding.dart';

part 'home_page.dart';

class HomeController extends GetxController {
  late final AppUseCase _appUseCase;

  HomeController(this._appUseCase);

  final RxList<AppTabWithNumberWidget> numberTabs = [
    const AppTabWithNumberWidget(
      label: 'Label 1',
      appTabSize: AppTabSize.large,
    ),
    const AppTabWithNumberWidget(
      label: 'Label 2',
      appTabSize: AppTabSize.large,
    ),
  ].obs;
  RxString langCode = RxString(AppLanguageKey.en.langCode);
  RxInt numberIndex = 0.obs;

  void onNumberChanged({required int index, required int number}) {
    numberTabs.value = [
      ...numberTabs.map((element) {
        final indexOf = numberTabs.indexOf(element);
        return indexOf == index ? element.copyWith(number: number) : element;
      })
    ];
  }

  Future<void> executeGetLangCode() async {
    try {
      final lang = await _appUseCase.getLanguageCode();
      final deviceLangCode = Get.deviceLocale!.languageCode;
      langCode.value = lang.isEmpty ? deviceLangCode : lang;
    } on AppException catch (e) {
      AppToastWidget(
              title: 'Multiple Languages',
              message: e.message,
              appToastType: AppToastType.error)
          .show();
    }
  }
}
