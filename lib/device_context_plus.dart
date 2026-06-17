import 'models/info_all.dart';
import 'models/info_app.dart';
import 'models/info_device.dart';
import 'device_context_plus_platform_interface.dart';

/// Main entry point for the DeviceContextPlus plugin
class DeviceContextPlus {
  static Future<InfoAll> getAll() async {
    final result = await DeviceContextPlusPlatform.instance.getAll();
    return InfoAll.fromMap(result);
  }

  static Future<InfoApp> getApp() async {
    final result = await DeviceContextPlusPlatform.instance.getApp();
    return InfoApp.fromMap(result);
  }

  static Future<InfoDevice> getDevice() async {
    final result = await DeviceContextPlusPlatform.instance.getDevice();
    return InfoDevice.fromMap(result);
  }
}
