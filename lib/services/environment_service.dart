import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';

enum EnvironmentType { dev, prod }

extension EnvironmentTypeExtension on EnvironmentType {
  String get env {
    if (this == EnvironmentType.prod) {
      return 'prod';
    }
    return 'dev';
  }
}

class EnvironmentService extends GetxService {
  late final Logger _logger;

  late EnvironmentType current = EnvironmentType.dev;

  @override
  void onInit() async {
    super.onInit();
    _logger = Logger(printer: PrettyPrinter(methodCount: 0));
    await loadEnvironment();
    _logger.d('Environment: ${current.env} - APP_URL: ${await apiDomain()}');
  }

  Future<String> apiDomain() async {
    return current == EnvironmentType.prod
        ? 'http://string-api.vinova.sg/api/'
        : 'http://string-api.vinova.sg/api/';
  }

  Future<void> loadEnvironment() async {
    final packageInfo = await PackageInfo.fromPlatform();
    if (packageInfo.packageName.contains('.prod')) {
      current = EnvironmentType.prod;
    } else {
      current = EnvironmentType.dev;
    }
  }
}
