import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceInfo {
  DeviceInfo._();

  static Future<Map<String, String>> getDeviceInfo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    Map<String, String> deviceInfo = {};
    deviceInfo.putIfAbsent('appVersion',
        () => "${packageInfo.version}(${packageInfo.buildNumber})");
    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfoPlugin.iosInfo;
      deviceInfo.putIfAbsent('OS', () => "iOS");
      deviceInfo.putIfAbsent(
          'isPhysicalDevice', () => "${iosDeviceInfo.isPhysicalDevice}");
      deviceInfo.putIfAbsent('model', () => iosDeviceInfo.model);
      deviceInfo.putIfAbsent('OSVersion', () => iosDeviceInfo.systemVersion);
      deviceInfo.putIfAbsent('machine', () => iosDeviceInfo.utsname.machine);
      deviceInfo.putIfAbsent(
          'deviceID', () => iosDeviceInfo.identifierForVendor ?? '');
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
      String androidDeviceId = await const AndroidId().getId() ?? '';
      deviceInfo.putIfAbsent('OS', () => "Android");
      deviceInfo.putIfAbsent(
          'isPhysicalDevice', () => "${androidDeviceInfo.isPhysicalDevice}");
      deviceInfo.putIfAbsent('model', () => androidDeviceInfo.model);
      deviceInfo.putIfAbsent(
          'OSVersion', () => "${androidDeviceInfo.version.sdkInt}");
      deviceInfo.putIfAbsent('machine', () => androidDeviceInfo.device);
      deviceInfo.putIfAbsent('deviceID', () => androidDeviceId);
    }
    return deviceInfo;
  }
}
