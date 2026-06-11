import 'package:flutter_test/flutter_test.dart';
import 'package:device_context_plus/device_context_plus.dart';
import 'package:device_context_plus/device_context_plus_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDeviceContextPlusPlatform
    with MockPlatformInterfaceMixin
    implements DeviceContextPlusPlatform {
  @override
  Future<Map<String, dynamic>> getAll() async {
    return {
      'app': {'version': '1.0.0'},
      'device': {'platform': 'android'}
    };
  }

  @override
  Future<Map<String, dynamic>> getApp() async {
    return {'version': '1.0.0'};
  }

  @override
  Future<Map<String, dynamic>> getDevice() async {
    return {'platform': 'android'};
  }
}

void main() {
  final initialPlatform = DeviceContextPlusPlatform.instance;

  test('Default instance is set', () {
    expect(initialPlatform, isNotNull);
  });

  test('getAll returns DeviceContext model', () async {
    DeviceContextPlusPlatform.instance = MockDeviceContextPlusPlatform();

    final context = await DeviceContextPlus.getAll();

    expect(context.app['version'], '1.0.0');
    expect(context.device['platform'], 'android');
  });

  test('getApp returns expected data', () async {
    DeviceContextPlusPlatform.instance = MockDeviceContextPlusPlatform();

    final result = await DeviceContextPlus.getApp();

    expect(result['version'], '1.0.0');
  });

  test('getDevice returns expected data', () async {
    DeviceContextPlusPlatform.instance = MockDeviceContextPlusPlatform();

    final result = await DeviceContextPlus.getDevice();

    expect(result['platform'], 'android');
  });
}
