part of 'toast_controller.dart';

class ToastPage extends GetWidget<ToastController> {
  const ToastPage({super.key});

  static void open() {
    Get.toNamed(Routes.toast);
  }

  @override
  Widget build(BuildContext context) {
    return AppMainPageWidget(
      appBar: const AppBarWidget(headerPage: 'Toast').build(context),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppThemeExt.of.majorScale(4)),
      child: Column(children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_success(), _info()]),
        SizedBox(height: AppThemeExt.of.majorScale(4)),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_warning(), _error()])
      ]),
    );
  }

  Widget _success() {
    return AppFilledButtonWidget(
      buttonText: 'Toast Success',
      onPressed: () {
        AppToastWidget(
            appToastType: AppToastType.success,
            title: "Toast Success",
            message: 'Please contact us for booking and more details',
            buttonText: 'Got it',
            onButtonPress: () {
              const AppToastWidget(
                appToastType: AppToastType.success,
                title: "Button Action",
                message: 'Please contact us for booking and more details',
              ).show();
            }).show();
      },
    );
  }

  Widget _info() {
    return AppFilledButtonWidget(
      buttonText: 'Toast Info',
      onPressed: () {
        const AppToastWidget(
          appToastType: AppToastType.info,
          title: "Toast Info",
          message: 'Please contact us for booking and more details',
          buttonText: 'Got it',
        ).show();
      },
    );
  }

  Widget _warning() {
    return AppFilledButtonWidget(
      buttonText: 'Warning Info',
      onPressed: () {
        const AppToastWidget(
          appToastType: AppToastType.warning,
          title: "Warning Info",
          message: 'Please contact us for booking and more details',
          buttonText: 'Got it',
        ).show();
      },
    );
  }

  Widget _error() {
    return AppFilledButtonWidget(
      buttonText: 'Error Info',
      onPressed: () {
        const AppToastWidget(
          appToastType: AppToastType.error,
          title: "Error Info",
          message: 'Please contact us for booking and more details',
          buttonText: 'Got it',
        ).show();
      },
    );
  }
}
