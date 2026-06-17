class InfoDevice {
  final String? platform;
  final String? model;
  final String? name; // iOS
  final String? manufacturer; // Android
  final String? brand; // Android
  final String? device; // Android
  final String? hardware; // Android
  final String? systemName; // iOS
  final String? systemVersion; // iOS
  final String? osVersion; // Android
  final int? sdkInt; // Android
  final String? locale;
  final String? timezone;

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
  });

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
    );
  }
}
