import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'device_context_plus_method_channel.dart';

/// Platform interface for DeviceContextPlus
///
/// Defines the contract that platform-specific implementations must follow.
abstract class DeviceContextPlusPlatform extends PlatformInterface {
  /// Constructs a [DeviceContextPlusPlatform].
  DeviceContextPlusPlatform() : super(token: _token);

  static final Object _token = Object();

  static DeviceContextPlusPlatform _instance = MethodChannelDeviceContextPlus();

  /// The default instance of [DeviceContextPlusPlatform]
  static DeviceContextPlusPlatform get instance => _instance;

  /// Sets a custom platform implementation
  static set instance(DeviceContextPlusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Returns full device context (app + device)
  Future<Map<String, dynamic>> getAll();

  /// Returns application info
  Future<Map<String, dynamic>> getApp();

  /// Returns device info
  Future<Map<String, dynamic>> getDevice();
}
