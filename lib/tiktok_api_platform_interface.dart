import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'tiktok_api_method_channel.dart';

abstract class TiktokApiPlatform extends PlatformInterface {
  /// Constructs a TiktokApiPlatform.
  TiktokApiPlatform() : super(token: _token);

  static final Object _token = Object();

  static TiktokApiPlatform _instance = MethodChannelTiktokApi();

  /// The default instance of [TiktokApiPlatform] to use.
  ///
  /// Defaults to [MethodChannelTiktokApi].
  static TiktokApiPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TiktokApiPlatform] when
  /// they register themselves.
  static set instance(TiktokApiPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
