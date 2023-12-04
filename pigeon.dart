import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(PigeonOptions(  
   dartOut: 'lib/messages.g.dart',
  dartOptions: DartOptions(),
  kotlinOut:
      'android/src/main/kotlin/id/ice/Messages.g.kt',
  kotlinOptions: KotlinOptions(),
  swiftOut: 'ios/Classes/Messages.g.swift',
  swiftOptions: SwiftOptions(),
  // Set this to a unique prefix for your plugin or application, per Objective-C naming conventions.
  objcOptions: ObjcOptions(prefix: 'PGN'),
  // copyrightHeader: 'pigeons/copyright.txt',
  dartPackageName: 'tiktok_api',
))

enum Code { one, two }

class MessageData {
  MessageData({required this.code, required this.data});
  String? name;
  String? description;
  Code code;
  Map<String?, String?> data;
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

  // @override
  // String toString() {
  //   return 'TikTokLoginResult{status: $status, authCode: $authCode, codeVerifier: $codeVerifier state: $state, grantedPermissions: $grantedPermissions, errorCode: $errorCode, errorMessage: $errorMessage}';
  // }
}

enum TikTokLoginStatus {
  success,
  cancelled,
  error
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