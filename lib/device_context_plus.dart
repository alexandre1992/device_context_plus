import 'device_context_plus_platform_interface.dart';
import 'models/device_context.dart';

/// Main entry point for the DeviceContextPlus plugin
class DeviceContextPlus {
  /// Returns full device context (strongly typed)
  static Future<DeviceContext> getAll() async {
    final result = await DeviceContextPlusPlatform.instance.getAll();
    return DeviceContext.fromMap(result);
  }

  /// Returns application info only
  static Future<Map<String, dynamic>> getApp() {
    return DeviceContextPlusPlatform.instance.getApp();
  }

  /// Returns device info only
  static Future<Map<String, dynamic>> getDevice() {
    return DeviceContextPlusPlatform.instance.getDevice();
  }
}
