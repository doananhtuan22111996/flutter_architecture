import 'package:email_validator/email_validator.dart';

class ValidatorExt {
  const ValidatorExt._();
  /*
  * true: have value
  * false: not have value
  * */
  static bool isRequireValidator(String? value) {
    return value != null && value.trim().isNotEmpty;
  }

  /*
  * min is number chars limit
  * true: limited -> show error
  * false: not limited -> success and by pass
  * */
  static bool isLimitedValidator(String? value, {required int min}) {
    if (value == null) return true;
    return value.length > min;
  }

  /*
  * true: email -> success and by pass
  * false: not email -> show error
  * */
  static bool isEmailValidator(String? value) {
    if (value == null) return false;
    return EmailValidator.validate(value);
  }
}
