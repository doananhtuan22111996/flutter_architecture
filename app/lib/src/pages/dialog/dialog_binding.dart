part of 'dialog_controller.dart';

class DialogBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DialogController>(() => DialogController());
  }
}
