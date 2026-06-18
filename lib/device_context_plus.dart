import 'models/info_all.dart';
import 'models/info_app.dart';
import 'models/info_device.dart';
import 'device_context_plus_platform_interface.dart';

/// Main entry point for the DeviceContextPlus plugin.
///
/// Provides access to application and device information
/// from native platforms (Android and iOS).
///
/// All data is returned using strongly typed models:
/// - [InfoAll]
/// - [InfoApp]
/// - [InfoDevice]
class DeviceContextPlus {
  /// Private constructor to prevent instantiation.
  DeviceContextPlus._();

  /// Returns full device context information.
  ///
  /// This includes:
  /// - Application data ([InfoApp])
  /// - Device data ([InfoDevice])
  ///
  /// Example:
  /// ```dart
  /// final info = await DeviceContextPlus.getAll();
  /// print(info.app.version);
  /// print(info.device.model);
  /// ```
  static Future<InfoAll> getAll() async {
    final result = await DeviceContextPlusPlatform.instance.getAll();
    return InfoAll.fromMap(result);
  }

  /// Returns only application information.
  ///
  /// Includes platform-specific fields such as:
  /// - iOS: bundleId, teamId
  /// - Android: packageName, versionCode
  ///
  /// Example:
  /// ```dart
  /// final app = await DeviceContextPlus.getApp();
  /// print(app.version);
  /// ```
  static Future<InfoApp> getApp() async {
    final result = await DeviceContextPlusPlatform.instance.getApp();
    return InfoApp.fromMap(result);
  }

  /// Returns only device information.
  ///
  /// Includes:
  /// - OS version
  /// - Manufacturer (Android)
  /// - System name (iOS)
  /// - Locale and timezone
  ///
  /// Example:
  /// ```dart
  /// final device = await DeviceContextPlus.getDevice();
  /// print(device.platform);
  /// ```
  static Future<InfoDevice> getDevice() async {
    final result = await DeviceContextPlusPlatform.instance.getDevice();
    return InfoDevice.fromMap(result);
  }
}
