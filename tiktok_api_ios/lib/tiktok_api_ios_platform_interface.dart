import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'tiktok_api_ios_method_channel.dart';

abstract class TiktokApiIosPlatform extends PlatformInterface {
  /// Constructs a TiktokApiIosPlatform.
  TiktokApiIosPlatform() : super(token: _token);

  static final Object _token = Object();

  static TiktokApiIosPlatform _instance = MethodChannelTiktokApiIos();

  /// The default instance of [TiktokApiIosPlatform] to use.
  ///
  /// Defaults to [MethodChannelTiktokApiIos].
  static TiktokApiIosPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TiktokApiIosPlatform] when
  /// they register themselves.
  static set instance(TiktokApiIosPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
