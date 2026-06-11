# Changelog

All notable changes to this project will be documented in this file.

---

## [1.0.0] - 2026-06-11

### ✨ Initial Release

First stable release of `device_context_plus`.

### 🚀 Features

- 📱 Application information:
  - bundle_id (iOS)
  - package_name (Android)
  - version
  - build number

- 🍎 iOS:
  - Apple Developer **Team ID** (retrieved via Keychain for reliability)

- 🤖 Android:
  - installer source (Play Store, APK, etc.)

- 🧠 Device information:
  - platform (android / ios)
  - model
  - device name
  - system name
  - OS version

- 🌍 Context information:
  - locale
  - timezone

- 🧩 Structured response:
  - separated into `app` and `device`

- 🧱 Typed API:
  - `DeviceContext` model for better developer experience

### 🔧 API

- `getContext()` → returns typed `DeviceContext`
- `getApp()` → returns app information
- `getDevice()` → returns device information

---

### ✅ Platform Support

- ✅ Android
- ✅ iOS

---

### 🎯 Highlights

- 🔥 Unique support for **iOS Team ID**
- 📊 Designed for analytics and runtime insights
- 🧠 Clean and structured API
