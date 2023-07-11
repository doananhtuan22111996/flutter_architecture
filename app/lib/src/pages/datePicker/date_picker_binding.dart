part of 'date_picker_controller.dart';

class DatePickerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DatePickerController>(() => DatePickerController());
  }
}
