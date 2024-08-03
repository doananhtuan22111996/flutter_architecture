import 'dart:io';

import 'package:domain/domain.dart';
import 'package:get/get.dart';
import 'package:utilities/utilities.dart';

import '../components/main/dialog/app_dialog_base_builder.dart';
import '../routes/app_pages.dart';
import 'R.dart';

class AppExceptionExt {
  late final AppException? appException;
  final Function(AppException appException)? onError;

  AppExceptionExt({required this.appException, this.onError});

  void detected() {
    if (appException == null) {
      return AppDefaultDialogWidget(
        title: 'Dialog Error',
        content: 'Application Error',
        appDialogType: AppDialogType.error,
        positiveText: R.strings.confirm,
        negativeText: R.strings.close,
      ).show();
    }
    if (appException is NetworkException) {
      // General Code
      switch (appException?.code) {
        case HttpStatus.unauthorized:
          // Force Logout
          return AppDefaultDialogWidget(
            title: 'Dialog Error: ${HttpStatus.unauthorized}',
            content: appException?.message,
            positiveText: R.strings.confirm,
            appDialogType: AppDialogType.error,
            negativeText: R.strings.close,
            onPositive: () => Get.offAllNamed(Routes.home),
            onNegative: () => Get.offAllNamed(Routes.home),
          ).show();
        case HttpStatus.badRequest:
        case HttpStatus.internalServerError:
        case HttpStatus.serviceUnavailable:
        case HttpStatus.gatewayTimeout:
        case HttpStatus.badGateway:
          return AppDefaultDialogWidget(
            title: 'Dialog Error: ${appException?.code}',
            content: appException?.message,
            appDialogType: AppDialogType.error,
            positiveText: R.strings.confirm,
            negativeText: R.strings.close,
          ).show();
        default:
          onError?.call(appException!);
          return;
      }
    }

    if (appException is LocalException) {
      Logs.d('LocalException: ${appException?.message}');
      onError?.call(appException!);
    }
  }
}
