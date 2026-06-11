import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'device_context_plus_platform_interface.dart';

/// Default implementation using MethodChannel
class MethodChannelDeviceContextPlus extends DeviceContextPlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('device_context_plus');

  @override
  Future<Map<String, dynamic>> getAll() async {
    final result = await methodChannel.invokeMethod<Map>('getAll');
    return Map<String, dynamic>.from(result ?? {});
  }

  @override
  Future<Map<String, dynamic>> getApp() async {
    final result = await methodChannel.invokeMethod<Map>('app');
    return Map<String, dynamic>.from(result ?? {});
  }

  @override
  Future<Map<String, dynamic>> getDevice() async {
    final result = await methodChannel.invokeMethod<Map>('device');
    return Map<String, dynamic>.from(result ?? {});
  }
}
