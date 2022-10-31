import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';

import '../config/translations/strings_enum.dart';

class ValidatorUtil {
  static String? requireValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return Strings.requiredMessage.tr;
    }
    return null;
  }

  static String? limitValidator(String? value, {required int min}) {
    if (requireValidator(value) != null) {
      return requireValidator(value);
    }
    if ((value?.length ?? 0) < min) {
      return '${Strings.limitMessage.tr}. $min ký tự';
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }
    if (!EmailValidator.validate(value)) {
      return Strings.emailInvalidMessage.tr;
    }
    return null;
  }
}
