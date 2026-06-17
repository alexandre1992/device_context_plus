import 'info_app.dart';
import 'info_device.dart';

class InfoAll {
  final InfoApp app;
  final InfoDevice device;

  InfoAll({
    required this.app,
    required this.device,
  });

  factory InfoAll.fromMap(Map<String, dynamic> map) {
    return InfoAll(
      app: InfoApp.fromMap(Map<String, dynamic>.from(map['app'] ?? {})),
      device:
          InfoDevice.fromMap(Map<String, dynamic>.from(map['device'] ?? {})),
    );
  }
}
