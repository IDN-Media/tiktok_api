import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(
  kotlinOptions: KotlinOptions(),
  kotlinOut: 'android/src/main/kotlin/id/ice/tiktok_api_android/Messages.kt',
  dartOut: 'lib/messages.dart',
  dartOptions: DartOptions(),
  dartPackageName: 'tiktok_api_android',
))

enum TikTokLoginStatus {
  success,
  cancelled,
  error
}

class TikTokLoginResult {
  const TikTokLoginResult({
    required this.status,
    this.authCode,
    this.state,
    this.codeVerifier,
    this.errorCode,
    this.errorMessage,
  });
  final TikTokLoginStatus status;
  final String? authCode;
  final String? state;
  final String? codeVerifier;
  final String? errorCode;
  final String? errorMessage;

}

@HostApi()
abstract class TiktokSDKApi {
  @async
  void setup(String clientKey);

  @async
  TikTokLoginResult login(
    List<String> scopes,
    String redirectUri,
    bool? browserAuthEnabled    
  );
}