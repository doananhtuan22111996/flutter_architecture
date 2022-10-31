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

abstract class EnvironmentService extends GetxService {
  String apiDomain();
}

class EnvironmentServiceImpl extends EnvironmentService {
  late final Logger _logger;

  late EnvironmentType current = EnvironmentType.dev;

  @override
  void onInit() async {
    super.onInit();
    _logger = Logger(printer: PrettyPrinter(methodCount: 0));
    _loadEnvironment();
    _logger.d('Environment: ${current.env} - APP_URL: ${apiDomain()}');
  }

  // TODO change PROD domain
  @override
  String apiDomain() => current == EnvironmentType.prod
      ? 'https://alia-backend.alia-dev.geekup.io/'
      : 'https://alia-backend.alia-dev.geekup.io/';

  void _loadEnvironment() async {
    final packageInfo = await PackageInfo.fromPlatform();
    if (packageInfo.packageName.contains('.prod')) {
      current = EnvironmentType.prod;
    } else {
      current = EnvironmentType.dev;
    }
  }
}
