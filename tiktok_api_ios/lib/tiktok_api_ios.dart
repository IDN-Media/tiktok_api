
import 'package:tiktok_api_ios/messages.dart' as pigeon_definition;
import 'package:tiktok_api_platform_interface/tiktok_api_platform_interface.dart';

/// This is the iOS implementation of the TiktokApiPlatform
///
class TiktokApiIos extends TiktokApiPlatform {
  
  /// Instantiate the Pigeon's wrapper
  final pigeon_definition.TiktokSDKApi _tiktokSDKApi = pigeon_definition.TiktokSDKApi();


  /// Assign the interface instance to this implementation
  /// 
  static void registerWith() {
    TiktokApiPlatform.instance = TiktokApiIos();
  }


  /// Override the setup to call the iOS implementation
  ///
  @override
  Future<void> setup(String clientKey) {
    return _tiktokSDKApi.setup(clientKey);
  }

  /// Override the login to call the iOS implementation
  ///  
  @override
  Future<TikTokLoginResult> login(List<String> scopes, String redirectUri, bool? browserAuthEnabled) async {
    final result = await _tiktokSDKApi.login(scopes, redirectUri, browserAuthEnabled);

    TikTokLoginStatus loginStatus;
    switch(result.status){
      case pigeon_definition.TikTokLoginStatus.success:
        loginStatus = TikTokLoginStatus.success;
        break;
      case pigeon_definition.TikTokLoginStatus.cancelled: 
        loginStatus = TikTokLoginStatus.cancelled;
        break;
      case pigeon_definition.TikTokLoginStatus.error:
        loginStatus = TikTokLoginStatus.error;
        break;
      default:
        loginStatus = TikTokLoginStatus.error;
    }
    return TikTokLoginResult(
      status: loginStatus,
      authCode: result.errorCode,
      codeVerifier: result.codeVerifier,
      errorCode:  result.errorCode,
      errorMessage: result.errorMessage,
      state: result.state);
  }

}