// import 'dart:ui';

// import 'package:get/get.dart';
// import 'package:resources/resources.dart';

// class LocalizationService extends Translations {
// // locale sẽ được get mỗi khi mới mở app (phụ thuộc vào locale hệ thống hoặc bạn có thể cache lại locale mà người dùng đã setting và set nó ở đây)
//   static final locale = _getLocaleFromLanguage();

// // fallbackLocale là locale default nếu locale được set không nằm trong những Locale support
//   static final fallbackLocale = Locale('en', 'US');

// // language code của những locale được support
//   static final langCodes = [
//     'en',
//     'vi',
//   ];

// // các Locale được support
//   static final locales = [
//     const Locale('en', 'US'),
//     const Locale('vi', 'VN'),
//   ];

// // function change language nếu bạn không muốn phụ thuộc vào ngôn ngữ hệ thống
//   static void changeLocale(String langCode) {
//     final locale = _getLocaleFromLanguage(langCode: langCode);
//     Get.updateLocale(locale);
//   }


//   static Locale _getLocaleFromLanguage({String? langCode}) {
//     var lang = langCode ?? Get.deviceLocale!.languageCode;
//     for (int i = 0; i < langCodes.length; i++) {
//       if (lang == langCodes[i]) return locales[i];
//     }
//     return Get.locale;
//   }
  
//   @override
//   Map<String, Map<String, String>> get keys => {
//         'en_US': ,
//         'vi_VN': vi,
//       };
// }
