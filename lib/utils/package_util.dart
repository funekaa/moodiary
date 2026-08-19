import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PackageUtil {
  //获取版本信息
  static Future<PackageInfo> getPackageInfo() async {
    return await PackageInfo.fromPlatform();
  }

  static Future<BaseDeviceInfo> getInfo() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      return await deviceInfoPlugin.androidInfo;
    }
    if (Platform.isIOS) {
      return await deviceInfoPlugin.iosInfo;
    }
    if (Platform.isMacOS) {
      return await deviceInfoPlugin.macOsInfo;
    }
    if (Platform.isWindows) {
      return await deviceInfoPlugin.windowsInfo;
    }
    if (Platform.isLinux) {
      return await deviceInfoPlugin.linuxInfo;
    }
    return await deviceInfoPlugin.deviceInfo;
  }

  /// 比较两个版本号字符串（如 "2.4.10" 与 "2.4.8"）
  /// v1 < v2 返回负数，v1 == v2 返回 0，v1 > v2 返回正数
  static int compareVersion(String v1, String v2) {
    String clean(String v) {
      var s = v.trim();
      if (s.startsWith('v') || s.startsWith('V')) s = s.substring(1);
      s = s.split('+')[0];
      s = s.split('-')[0];
      return s;
    }

    final parts1 = clean(v1).split('.').map((e) => int.tryParse(e) ?? 0).toList();
    final parts2 = clean(v2).split('.').map((e) => int.tryParse(e) ?? 0).toList();
    final maxLen = parts1.length > parts2.length ? parts1.length : parts2.length;

    for (int i = 0; i < maxLen; i++) {
      final num1 = i < parts1.length ? parts1[i] : 0;
      final num2 = i < parts2.length ? parts2[i] : 0;
      if (num1 != num2) {
        return num1.compareTo(num2);
      }
    }
    return 0;
  }
}
