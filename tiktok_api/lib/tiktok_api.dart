
import 'package:tiktok_api_platform_interface/tiktok_api_platform_interface.dart';

/// This is the Facade that must be called by the client of this package
///
///
class TiktokApi extends TiktokApiPlatform {

  /// Login to Tiktok
  ///
  @override
  Future<TikTokLoginResult> login(List<String> scopes, String redirectUri, bool? browserAuthEnabled) {
    return TiktokApiPlatform.instance.login(scopes, redirectUri, browserAuthEnabled);
  }

  /// Setup the Tiktok SDK
  ///
  @override
  Future<void> setup(String clientKey) {
    return TiktokApiPlatform.instance.setup(clientKey);
  }
}
