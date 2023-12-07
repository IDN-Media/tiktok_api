import 'package:flutter_test/flutter_test.dart';
import 'package:tiktok_api_android/tiktok_api_android.dart';
import 'package:tiktok_api_android/tiktok_api_android_platform_interface.dart';
import 'package:tiktok_api_android/tiktok_api_android_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTiktokApiAndroidPlatform
    with MockPlatformInterfaceMixin
    implements TiktokApiAndroidPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TiktokApiAndroidPlatform initialPlatform = TiktokApiAndroidPlatform.instance;

  test('$MethodChannelTiktokApiAndroid is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTiktokApiAndroid>());
  });

  test('getPlatformVersion', () async {
    TiktokApiAndroid tiktokApiAndroidPlugin = TiktokApiAndroid();
    MockTiktokApiAndroidPlatform fakePlatform = MockTiktokApiAndroidPlatform();
    TiktokApiAndroidPlatform.instance = fakePlatform;

    expect(await tiktokApiAndroidPlugin.getPlatformVersion(), '42');
  });
}
