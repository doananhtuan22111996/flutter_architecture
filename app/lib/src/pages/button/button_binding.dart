part of 'button_controller.dart';

class ButtonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ButtonController>(() => ButtonController());
  }
}
