
import 'tiktok_api_android_platform_interface.dart';

class TiktokApiAndroid {
  Future<String?> getPlatformVersion() {
    return TiktokApiAndroidPlatform.instance.getPlatformVersion();
  }
}
