import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'device_context_plus_platform_interface.dart';

/// An implementation of [DeviceContextPlusPlatform] that uses method channels.
class MethodChannelDeviceContextPlus extends DeviceContextPlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('device_context_plus');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
