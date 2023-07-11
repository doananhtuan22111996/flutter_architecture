import 'package:app/src/pages/avatar/avatar_controller.dart';
import 'package:app/src/pages/button/button_controller.dart';
import 'package:app/src/pages/datePicker/date_picker_controller.dart';
import 'package:app/src/pages/dialog/dialog_controller.dart';
import 'package:app/src/pages/home/home_controller.dart';
import 'package:app/src/pages/main/main_controller.dart';
import 'package:app/src/pages/progress/progress_controller.dart';
import 'package:app/src/pages/selectionControl/selection_control_controller.dart';
import 'package:app/src/pages/textField/text_field_controller.dart';
import 'package:app/src/pages/user/user_controller.dart';
import 'package:app/src/pages/usercopy/user_copy_controller.dart';
import 'package:app/src/pages/userdb/db_user_controller.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

part 'app_binding.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.main,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.users,
      page: () => const UserPage(),
      binding: UserBinding(),
    ),
    GetPage(
      name: Routes.usersCopy,
      page: () => const UserCopyPage(),
      binding: UserCopyBinding(),
    ),
    GetPage(
      name: Routes.dbUsers,
      page: () => const DbUserPage(),
      binding: DbUserBinding(),
    ),
    GetPage(
      name: Routes.button,
      page: () => const ButtonPage(),
      binding: ButtonBinding(),
    ),
    GetPage(
      name: Routes.avatar,
      page: () => const AvatarPage(),
      binding: AvatarBinding(),
    ),
    GetPage(
      name: Routes.datePicker,
      page: () => const DatePickerPage(),
      binding: DatePickerBinding(),
    ),
    GetPage(
      name: Routes.dialog,
      page: () => const DialogPage(),
      binding: DialogBinding(),
    ),
    GetPage(
      name: Routes.progress,
      page: () => const ProgressPage(),
      binding: ProgressBinding(),
    ),
    GetPage(
      name: Routes.selectionControl,
      page: () => const SelectionControlPage(),
      binding: SelectionControlBinding(),
    ),
    GetPage(
      name: Routes.textField,
      page: () => const TextFieldPage(),
      binding: TextFieldBinding(),
    ),
  ];
}
