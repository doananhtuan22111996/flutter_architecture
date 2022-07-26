import 'package:flutter_dotenv/flutter_dotenv.dart';
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
    _logger = Logger(printer: PrettyPrinter());
    await loadEnvironment();
    await loadFlavor();
    _logger
        .d('FLAVOR: ${dotenv.env['ENV']} - APP_URL: ${dotenv.env['APP_URL']}');
    super.onInit();
  }

  Future<String> apiDomain() async {
    if (!dotenv.isInitialized) return '';
    return dotenv.env['APP_URL'] ?? '';
  }

  Future<void> loadEnvironment() async {
    final packageInfo = await PackageInfo.fromPlatform();
    await dotenv.load(
        fileName: packageInfo.packageName.contains('.prod')
            ? '.env.prod'
            : '.env.dev');
  }

  Future<void> loadFlavor() async {
    if (!dotenv.isInitialized) return;
    if (dotenv.env['ENV'] == EnvironmentType.prod.env) {
      current = EnvironmentType.prod;
    } else {
      current = EnvironmentType.dev;
    }
  }
}
