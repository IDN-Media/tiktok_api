import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'tiktok_api_ios_platform_interface.dart';

/// An implementation of [TiktokApiIosPlatform] that uses method channels.
class MethodChannelTiktokApiIos extends TiktokApiIosPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('tiktok_api_ios');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
