import 'info_app.dart';
import 'info_device.dart';

/// Aggregated device context information.
///
/// Combines:
/// - [InfoApp] (application data)
/// - [InfoDevice] (device data)
class InfoAll {
  /// Application-related information.
  final InfoApp app;

  /// Device-related information.
  final InfoDevice device;

  /// Constructs an [InfoAll] instance.
  InfoAll({
    required this.app,
    required this.device,
  });

  /// Creates an instance from a Map returned by the native layer.
  factory InfoAll.fromMap(Map<String, dynamic> map) {
    return InfoAll(
      app: InfoApp.fromMap(Map<String, dynamic>.from(map['app'] ?? {})),
      device:
          InfoDevice.fromMap(Map<String, dynamic>.from(map['device'] ?? {})),
    );
  }
}
