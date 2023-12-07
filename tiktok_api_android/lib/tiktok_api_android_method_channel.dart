import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'tiktok_api_android_platform_interface.dart';

/// An implementation of [TiktokApiAndroidPlatform] that uses method channels.
class MethodChannelTiktokApiAndroid extends TiktokApiAndroidPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('tiktok_api_android');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
