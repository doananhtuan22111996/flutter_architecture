part of 'app_pages.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    DataProvider.inject();
    DomainProvider.inject();
  }
}
