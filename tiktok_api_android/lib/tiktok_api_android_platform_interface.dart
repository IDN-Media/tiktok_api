import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'tiktok_api_android_method_channel.dart';

abstract class TiktokApiAndroidPlatform extends PlatformInterface {
  /// Constructs a TiktokApiAndroidPlatform.
  TiktokApiAndroidPlatform() : super(token: _token);

  static final Object _token = Object();

  static TiktokApiAndroidPlatform _instance = MethodChannelTiktokApiAndroid();

  /// The default instance of [TiktokApiAndroidPlatform] to use.
  ///
  /// Defaults to [MethodChannelTiktokApiAndroid].
  static TiktokApiAndroidPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TiktokApiAndroidPlatform] when
  /// they register themselves.
  static set instance(TiktokApiAndroidPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
