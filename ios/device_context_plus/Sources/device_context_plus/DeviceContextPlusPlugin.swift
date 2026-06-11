import Flutter
import UIKit
import Security

/**
 * DeviceContextPlusPlugin
 *
 * iOS implementation of the Device Context Plus plugin.
 *
 * This plugin exposes application and device system information
 * to Flutter via MethodChannel.
 *
 * Returned structure:
 * - app: application-level metadata
 * - device: device and OS information
 *
 * Channel: "device_context_plus"
 */
public class DeviceContextPlusPlugin: NSObject, FlutterPlugin {

  /**
   * Registers the plugin with the Flutter engine.
   */
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "device_context_plus", binaryMessenger: registrar.messenger())
    let instance = DeviceContextPlusPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  /**
   * Handles incoming method calls from Flutter.
   */
  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {

    case "getAll":
      result(getAll())

    case "app":
      result(getApp())

    case "device":
      result(getDevice())

    default:
      result(FlutterMethodNotImplemented)
    }
  }

  /**
   * Returns the complete device context.
   */
  private func getAll() -> [String: Any] {
    return [
      "app": getApp(),
      "device": getDevice()
    ]
  }

  /**
   * Returns application-level information.
   *
   * Includes:
   * - bundle_id
   * - version
   * - build
   * - team_id (Apple Developer Team ID via Keychain - reliable)
   */
  private func getApp() -> [String: Any] {
    let bundle = Bundle.main
    let info = bundle.infoDictionary ?? [:]

    return [
      "bundle_id": bundle.bundleIdentifier ?? "",
      "version": info["CFBundleShortVersionString"] ?? "",
      "build": info["CFBundleVersion"] ?? "",
      "team_id": getTeamId() ?? ""
    ]
  }

  /**
   * Returns device and operating system information.
   */
  private func getDevice() -> [String: Any] {
    let device = UIDevice.current

    return [
      "platform": "ios",
      "model": device.model,
      "name": device.name,
      "system_name": device.systemName,
      "system_version": device.systemVersion,
      "locale": Locale.current.identifier,
      "timezone": TimeZone.current.identifier
    ]
  }

  // MARK: - Team ID (Keychain - robust approach)

  /**
   * Retrieves Apple Team ID using Keychain (bundleSeedID).
   *
   * This is the most reliable way to obtain the Team ID in runtime.
   */
  private func getTeamId() -> String? {
    let query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrAccount as String: "bundleSeedID",
      kSecAttrService as String: "",
      kSecReturnAttributes as String: kCFBooleanTrue as Any
    ]

    var result: CFTypeRef?
    let status = SecItemCopyMatching(query as CFDictionary, &result)

    if status == errSecItemNotFound {
      var newResult: CFTypeRef?
      let addStatus = SecItemAdd(query as CFDictionary, &newResult)

      if addStatus == errSecSuccess {
        return extractTeamId(from: newResult)
      }
      return nil
    }

    if status == errSecSuccess {
      return extractTeamId(from: result)
    }

    return nil
  }

  /**
   * Extracts Team ID from Keychain access group
   */
  private func extractTeamId(from result: CFTypeRef?) -> String? {
    guard let dict = result as? [String: Any],
          let accessGroup = dict[kSecAttrAccessGroup as String] as? String else {
      return nil
    }

    return accessGroup.components(separatedBy: ".").first
  }
}
