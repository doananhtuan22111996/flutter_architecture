import 'package:get/get.dart';

import '../pages/controllers/home_controller.dart';
import '../pages/controllers/user_controller.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.users,
      page: () => const UserView(),
      binding: UserBinding(),
    ),
    GetPage(
      name: Routes.dbUsers,
      page: () => const DbUserView(),
      binding: UserBinding(),
    ),
  ];
}
