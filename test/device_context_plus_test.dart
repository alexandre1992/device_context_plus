import 'package:flutter_test/flutter_test.dart';
import 'package:device_context_plus/device_context_plus.dart';
import 'package:device_context_plus/device_context_plus_platform_interface.dart';
import 'package:device_context_plus/device_context_plus_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDeviceContextPlusPlatform
    with MockPlatformInterfaceMixin
    implements DeviceContextPlusPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DeviceContextPlusPlatform initialPlatform = DeviceContextPlusPlatform.instance;

  test('$MethodChannelDeviceContextPlus is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDeviceContextPlus>());
  });

  test('getPlatformVersion', () async {
    DeviceContextPlus deviceContextPlusPlugin = DeviceContextPlus();
    MockDeviceContextPlusPlatform fakePlatform = MockDeviceContextPlusPlatform();
    DeviceContextPlusPlatform.instance = fakePlatform;

    expect(await deviceContextPlusPlugin.getPlatformVersion(), '42');
  });
}
