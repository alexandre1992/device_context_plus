/// Represents device and system information.
///
/// Includes hardware, OS, and locale details.
class InfoDevice {
  /// Platform name (`android` or `ios`).
  final String? platform;

  /// Device model.
  final String? model;

  /// Device name (iOS).
  final String? name; // iOS
  /// Manufacturer (Android).
  final String? manufacturer; // Android
  /// Brand (Android).
  final String? brand; // Android
  /// Device identifier (Android)
  final String? device; // Android
  /// Hardware identifier (Android).
  final String? hardware; // Android
  /// System name (iOS).
  final String? systemName; // iOS
  /// System version (iOS).
  final String? systemVersion; // iOS
  /// OS version (Android).
  final String? osVersion; // Android
  /// Android SDK version.
  final int? sdkInt; // Android
  /// Device locale.
  final String? locale;

  /// Device timezone.
  final String? timezone;

  /// Indicates if the app is running in an emulator/simulator (`android` or `ios`).
  final bool isEmulator;

  /// Creates a new [InfoDevice] instance.
  InfoDevice({
    this.platform,
    this.model,
    this.name,
    this.manufacturer,
    this.brand,
    this.device,
    this.hardware,
    this.systemName,
    this.systemVersion,
    this.osVersion,
    this.sdkInt,
    this.locale,
    this.timezone,
    this.isEmulator = false,
  });

  /// Creates an instance from native map data.
  factory InfoDevice.fromMap(Map<String, dynamic> map) {
    return InfoDevice(
      platform: map['platform'],
      model: map['model'],
      name: map['name'],
      manufacturer: map['manufacturer'],
      brand: map['brand'],
      device: map['device'],
      hardware: map['hardware'],
      systemName: map['system_name'],
      systemVersion: map['system_version'],
      osVersion: map['os_version'],
      sdkInt: map['sdk_int'],
      locale: map['locale'],
      timezone: map['timezone'],
      isEmulator: map['isEmulator'] ?? false,
    );
  }
}
