import 'package:flutter_test/flutter_test.dart';
import 'package:tiktok_api/tiktok_api.dart';
import 'package:tiktok_api/tiktok_api_platform_interface.dart';
import 'package:tiktok_api/tiktok_api_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTiktokApiPlatform
    with MockPlatformInterfaceMixin
    implements TiktokApiPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TiktokApiPlatform initialPlatform = TiktokApiPlatform.instance;

  test('$MethodChannelTiktokApi is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTiktokApi>());
  });

  test('getPlatformVersion', () async {
    TiktokApi tiktokApiPlugin = TiktokApi();
    MockTiktokApiPlatform fakePlatform = MockTiktokApiPlatform();
    TiktokApiPlatform.instance = fakePlatform;

    expect(await tiktokApiPlugin.getPlatformVersion(), '42');
  });
}
