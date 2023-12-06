import 'package:tiktok_api_platform_interface/src/tiktok_login_status.dart';

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