import 'dart:io';

import 'package:app/src/exts/app_exts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBottomSheetWidget {
  const AppBottomSheetWidget._();

  static Future<void> _showBaseBottomSheetWidget(BuildContext context,
      {required String label, required Widget child}) async {
    await showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              // AppTextWidget(label, textStyle: context.textTheme.headline6),
              const SizedBox(height: 24),
              child,
              if (Platform.isAndroid)
                SizedBox(
                    height: Get.bottomBarHeight > kBottomNavigationBarHeight
                        ? (Get.bottomBarHeight - kBottomNavigationBarHeight)
                        : 32)
              else
                SizedBox(height: AppUIConstants.defaultPadding)
            ]),
      ),
    );
  }
}
