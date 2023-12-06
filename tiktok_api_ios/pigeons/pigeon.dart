import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(  
  dartOut: 'lib/messages.dart',
  dartOptions: DartOptions(),
  swiftOut: 'ios/Classes/messages.g.swift',
  swiftOptions: SwiftOptions(),
  // Set this to a unique prefix for your plugin or application, per Objective-C naming conventions.
  objcOptions: ObjcOptions(prefix: 'PGN'),
  dartPackageName: 'tiktok_api_ios',
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