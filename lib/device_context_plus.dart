
import 'device_context_plus_platform_interface.dart';

class DeviceContextPlus {
  Future<String?> getPlatformVersion() {
    return DeviceContextPlusPlatform.instance.getPlatformVersion();
  }
}
