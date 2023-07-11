part of 'selection_control_controller.dart';

class SelectionControlBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectionControlController>(() => SelectionControlController());
  }
}
