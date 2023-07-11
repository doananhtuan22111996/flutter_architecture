part of 'app_exts.dart';

class AppExceptionExt {
  late final AppException? appException;
  final Function(AppException appException)? onError;

  AppExceptionExt({required this.appException, this.onError});

  void detected() {
    if (appException == null) {
      return AppDefaultDialogWidget()
          .setTitle('Dialog Error')
          .setContent('Application Error')
          .setAppDialogType(AppDialogType.error)
          .setPositiveText(R.strings.confirm)
          .setNegativeText(R.strings.close)
          .buildDialog(Get.context!)
          .show();
    }
    if (appException is NetworkException) {
      // General Code
      switch (appException?.code) {
        case HttpStatus.unauthorized:
          // Force Logout
          return AppDefaultDialogWidget()
              .setTitle('Dialog Error: ${HttpStatus.unauthorized}')
              .setContent(appException?.message)
              .setPositiveText(R.strings.confirm)
              .setAppDialogType(AppDialogType.error)
              .setNegativeText(R.strings.close)
              .setOnPositive(() => Get.offAllNamed(Routes.home))
              .setOnNegative(() => Get.offAllNamed(Routes.home))
              .buildDialog(Get.context!)
              .show();
        case HttpStatus.badRequest:
        case HttpStatus.internalServerError:
        case HttpStatus.serviceUnavailable:
        case HttpStatus.gatewayTimeout:
        case HttpStatus.badGateway:
          return AppDefaultDialogWidget()
              .setTitle('Dialog Error: ${appException?.code}')
              .setContent(appException?.message)
              .setAppDialogType(AppDialogType.error)
              .setPositiveText(R.strings.confirm)
              .setNegativeText(R.strings.close)
              .buildDialog(Get.context!)
              .show();
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
