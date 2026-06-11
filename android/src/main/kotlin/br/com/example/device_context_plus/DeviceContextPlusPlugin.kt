package br.com.example.device_context_plus

import android.content.Context
import android.os.Build
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.util.Locale
import java.util.TimeZone

/**
 * DeviceContextPlusPlugin
 *
 * Android implementation of the Device Context Plus plugin.
 *
 * This plugin exposes application and device system information
 * to Flutter through a MethodChannel.
 *
 * Returned structure:
 * - app: application-level metadata
 * - device: device and OS information
 *
 * Channel: "device_context_plus"
 */
class DeviceContextPlusPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {

    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    /**
     * Called when the plugin is attached to the Flutter engine.
     */
    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        context = binding.applicationContext

        channel = MethodChannel(binding.binaryMessenger, "device_context_plus")
        channel.setMethodCallHandler(this)
    }

    /**
     * Handles incoming method calls from Flutter.
     */
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {

            "getAll" -> result.success(getAll())

            "app" -> result.success(getApp())

            "device" -> result.success(getDevice())

            else -> result.notImplemented()
        }
    }

    /**
     * Returns the complete device context.
     *
     * Includes:
     * - app information
     * - device information
     */
    private fun getAll(): Map<String, Any> {
        return mapOf(
            "app" to getApp(),
            "device" to getDevice()
        )
    }

    /**
     * Returns application-level information.
     *
     * Includes:
     * - package_name
     * - version_name
     * - version_code
     * - first_install_time (timestamp)
     * - last_update_time (timestamp)
     * - installer_store (Play Store, etc.)
     */
    private fun getApp(): Map<String, Any> {
        val packageName = context.packageName
        val pm = context.packageManager
        val info = pm.getPackageInfo(packageName, 0)

        return mapOf(
            "package_name" to packageName,
            "version_name" to (info.versionName ?: ""),
            "version_code" to info.longVersionCode,
            "first_install_time" to info.firstInstallTime,
            "last_update_time" to info.lastUpdateTime,
            "installer_store" to (pm.getInstallerPackageName(packageName) ?: "unknown")
        )
    }

    /**
     * Returns device and operating system information.
     *
     * Includes:
     * - platform (android)
     * - model
     * - manufacturer
     * - brand
     * - device
     * - hardware
     * - os_version
     * - sdk_int
     * - locale
     * - timezone
     */
    private fun getDevice(): Map<String, Any> {
        return mapOf(
            "platform" to "android",
            "model" to Build.MODEL,
            "manufacturer" to Build.MANUFACTURER,
            "brand" to Build.BRAND,
            "device" to Build.DEVICE,
            "hardware" to Build.HARDWARE,
            "os_version" to Build.VERSION.RELEASE,
            "sdk_int" to Build.VERSION.SDK_INT,
            "locale" to Locale.getDefault().toString(),
            "timezone" to TimeZone.getDefault().id
        )
    }

    /**
     * Called when the plugin is detached from the Flutter engine.
     */
    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}