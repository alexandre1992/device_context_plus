import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:device_context_plus/device_context_plus_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final platform = MethodChannelDeviceContextPlus();
  const MethodChannel channel = MethodChannel('device_context_plus');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'getAll':
          return {
            'app': {'version': '1.0.0'},
            'device': {'platform': 'android'}
          };
        case 'app':
          return {'version': '1.0.0'};
        case 'device':
          return {'platform': 'android'};
        default:
          return null;
      }
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getAll returns map', () async {
    final result = await platform.getAll();

    expect(result, isA<Map<String, dynamic>>());
    expect(result['app'], isNotNull);
    expect(result['device'], isNotNull);
  });

  test('getApp returns map', () async {
    final result = await platform.getApp();

    expect(result['version'], '1.0.0');
  });

  test('getDevice returns map', () async {
    final result = await platform.getDevice();

    expect(result['platform'], 'android');
  });
}
