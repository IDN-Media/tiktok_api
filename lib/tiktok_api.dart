
import 'tiktok_api_platform_interface.dart';

class TiktokApi {
  Future<String?> getPlatformVersion() {
    return TiktokApiPlatform.instance.getPlatformVersion();
  }
}
