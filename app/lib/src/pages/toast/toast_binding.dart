part of 'toast_controller.dart';

class ToastBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ToastController>(() => ToastController());
  }
}
