
import 'package:package_info_plus/package_info_plus.dart';

class SPUtil {
  static SPUtil _util = new SPUtil._();
  factory SPUtil() => _util;
  static late PackageInfo packageInfo;
  SPUtil._();

  static Future<void> init() async {
    packageInfo = await PackageInfo.fromPlatform();
  }
}