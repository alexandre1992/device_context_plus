/// Represents application-level information.
///
/// Contains platform-specific fields for both Android and iOS.
class InfoApp {
  /// iOS bundle identifier.
  final String? bundleId;

  /// App version (iOS: version | Android: versionName).
  final String? version;

  /// iOS build number.
  final String? build;

  /// Android package name.
  final String? packageName;

  /// Android version code.
  final int? versionCode;

  /// First installation timestamp (Android).
  final int? firstInstallTime;

  /// Last update timestamp (Android).
  final int? lastUpdateTime;

  /// Installer source (Play Store, APK, etc.).
  final String? installerStore;

  /// Apple Developer Team ID (iOS).
  final String? teamId;

  /// Creates a new [InfoApp] instance.
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

  /// Creates an instance from native map data.
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
