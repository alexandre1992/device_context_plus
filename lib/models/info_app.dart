class InfoApp {
  final String? bundleId; // iOS
  final String? version;
  final String? build; // iOS

  final String? packageName; // Android
  final int? versionCode;
  final int? firstInstallTime;
  final int? lastUpdateTime;
  final String? installerStore;

  final String? teamId; // iOS

  InfoApp({
    this.bundleId,
    this.version,
    this.build,
    this.packageName,
    this.versionCode,
    this.firstInstallTime,
    this.lastUpdateTime,
    this.installerStore,
    this.teamId,
  });

  factory InfoApp.fromMap(Map<String, dynamic> map) {
    return InfoApp(
      bundleId: map['bundle_id'],
      version: map['version'] ?? map['version_name'],
      build: map['build']?.toString(),
      packageName: map['package_name'],
      versionCode: map['version_code'],
      firstInstallTime: map['first_install_time'],
      lastUpdateTime: map['last_update_time'],
      installerStore: map['installer_store'],
      teamId: map['team_id'],
    );
  }
}
