part of 'app_pages.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() async {
    await DataProvider.inject();
    DomainProvider.inject();
  }
}
