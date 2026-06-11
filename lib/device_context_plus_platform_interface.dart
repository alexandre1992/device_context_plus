import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'device_context_plus_method_channel.dart';

abstract class DeviceContextPlusPlatform extends PlatformInterface {
  /// Constructs a DeviceContextPlusPlatform.
  DeviceContextPlusPlatform() : super(token: _token);

  static final Object _token = Object();

  static DeviceContextPlusPlatform _instance = MethodChannelDeviceContextPlus();

  /// The default instance of [DeviceContextPlusPlatform] to use.
  ///
  /// Defaults to [MethodChannelDeviceContextPlus].
  static DeviceContextPlusPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DeviceContextPlusPlatform] when
  /// they register themselves.
  static set instance(DeviceContextPlusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
