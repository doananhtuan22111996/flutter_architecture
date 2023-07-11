part of 'text_field_controller.dart';

class TextFieldBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TextFieldController>(() => TextFieldController());
  }
}
