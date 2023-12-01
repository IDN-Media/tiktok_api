import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'tiktok_api_platform_interface.dart';

/// An implementation of [TiktokApiPlatform] that uses method channels.
class MethodChannelTiktokApi extends TiktokApiPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('tiktok_api');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
