import 'package:flutter/material.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:tiktok_api_platform_interface/src/tiktok_login_result.dart';



///
/// Defines the common interface for each platform implementation.
/// 
/// Each platforms implementation must extend this class and
/// then set the instance property with the real implementation.
///
abstract class TiktokApiPlatform extends PlatformInterface {
  TiktokApiPlatform({required super.token});

  static final Object _token = Object();
  static TiktokApiPlatform? _instance;

  /// Return the specific platform implementation
  ///
  static TiktokApiPlatform get instance {
    if(_instance == null){
      throw ErrorDescription("Please set the instance first!");
    }

    return _instance!;
  }

  ///Must be set by each platform implementation
  ///
  static set instance(TiktokApiPlatform instance) {    
    PlatformInterface.verify(instance, _token);
    TiktokApiPlatform._instance = instance;    
  }

  /// Setup the Tiktok SDK to use the client key from the Tiktok's app.
  ///
  Future<void> setup(String clientKey);

  ///Login to Tiktok. 
  ///The scopes and redirect Uri must be the same as the one on Tiktok's app.
  ///
  Future<TikTokLoginResult> login(
    List<String> scopes,
    String redirectUri,
    bool? browserAuthEnabled    
  );

}