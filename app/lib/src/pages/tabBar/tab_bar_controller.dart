import 'package:app/src/components/main/appBar/app_bar_base_builder.dart';
import 'package:app/src/components/main/page/app_main_page_base_builder.dart';
import 'package:app/src/components/main/tabBar/app_tab_bar_widget.dart';
import 'package:app/src/components/main/tabBar/app_tab_base_builder.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part 'tab_bar_binding.dart';

part 'tab_bar_page.dart';

class TabBarController extends GetxController {
  final List<AppTabOnlyTextWidget> mediumTabs = [
    AppTabOnlyTextWidget().setLabel('Label 1').setAppTabSize(AppTabSize.medium),
    AppTabOnlyTextWidget().setLabel('Label 2').setAppTabSize(AppTabSize.medium),
    AppTabOnlyTextWidget().setLabel('Label 3').setAppTabSize(AppTabSize.medium),
  ];
  final List<AppTabOnlyTextWidget> largeTabs = [
    AppTabOnlyTextWidget().setLabel('Label 1').setAppTabSize(AppTabSize.large),
    AppTabOnlyTextWidget().setLabel('Label 2').setAppTabSize(AppTabSize.large),
    AppTabOnlyTextWidget().setLabel('Label 3').setAppTabSize(AppTabSize.large),
  ];
  final List<AppTabWithIconWidget> iconTabs = [
    AppTabWithIconWidget()
        .setLabel('Label 1')
        .setIconSelected(R.svgs.filled.tab.bulb.svg())
        .setIconUnselected(R.svgs.outline.tab.bulb.svg())
        .setAppTabSize(AppTabSize.large),
    AppTabWithIconWidget()
        .setLabel('Label 2')
        .setIconSelected(R.svgs.filled.tab.bulb.svg())
        .setIconUnselected(R.svgs.outline.tab.bulb.svg())
        .setAppTabSize(AppTabSize.large),
    AppTabWithIconWidget()
        .setLabel('Label 3')
        .setIconSelected(R.svgs.filled.tab.bulb.svg())
        .setIconUnselected(R.svgs.outline.tab.bulb.svg())
        .setAppTabSize(AppTabSize.large),
  ];
  final List<AppTabWithNumberWidget> numberTabs = [
    AppTabWithNumberWidget()
        .setLabel('Label 1')
        .setNumber(10)
        .setAppTabSize(AppTabSize.large),
    AppTabWithNumberWidget()
        .setLabel('Label 2')
        .setNumber(20)
        .setAppTabSize(AppTabSize.large),
    AppTabWithNumberWidget()
        .setLabel('Label 3')
        .setNumber(40)
        .setAppTabSize(AppTabSize.large),
  ];
  RxInt mediumIndex = 0.obs;
  RxInt largeIndex = 0.obs;
  RxInt iconIndex = 0.obs;
  RxInt numberIndex = 0.obs;
}
