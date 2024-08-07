import 'package:app/src/components/main/appBar/app_bar_base_builder.dart';
import 'package:app/src/components/main/button/app_button_base_builder.dart';
import 'package:app/src/components/main/page/app_main_page_base_builder.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/components/main/toast/app_toast_base_builder.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/app_theme_ext.dart';
import '../../exts/R.dart';

part 'button_binding.dart';

part 'button_page.dart';

class ButtonController extends GetxController {
  void toast() {
    const AppToastWidget(title: 'Clicked', appToastType: AppToastType.info)
        .show();
  }
}
