import 'package:app/src/components/main/appBar/app_bar_base_builder.dart';
import 'package:app/src/components/main/app_toast_widget.dart';
import 'package:app/src/components/main/avatar/app_avatar_base_builder.dart';
import 'package:app/src/components/main/page/app_main_page_base_builder.dart';
import 'package:app/src/components/main/text/app_text_base_builder.dart';
import 'package:app/src/config/app_theme.dart';
import 'package:app/src/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resources/resources.dart';

part 'avatar_binding.dart';

part 'avatar_page.dart';

class AvatarController extends GetxController {
  void toast() {
    AppToastWidget.showSuccessToast(Get.context, message: 'Clicked');
  }
}
