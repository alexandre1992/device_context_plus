# Changelog

All notable changes to this project will be documented in this file.

---

## [1.0.5] - Stable

### 📚 Documentation Improvements

- ✅ Adicionados comentários DartDoc em:
  - `DeviceContextPlus`
  - `getAll()`
  - `getApp()`
  - `getDevice()`

- ✅ Documentação dos models:
  - `InfoApp`
  - `InfoDevice`
  - `InfoAll`

- ✅ Inclusão de exemplos práticos nos métodos públicos

- ✅ Melhor descrição dos campos cross-platform (iOS e Android)

- ✅ Cobertura de documentação da API aumentada significativamente
  _(corrigindo aviso de baixa documentação pública)_

---

## [1.0.4] - Stable

### 🧱 Refatoração de Models (Breaking Change)

- 🔥 Substituição do model `DeviceContext` por models tipados:
  - `InfoApp`
  - `InfoDevice`
  - `InfoAll` (agregador)

- ✅ Separação clara entre:
  - Dados da aplicação (`InfoApp`)
  - Dados do dispositivo (`InfoDevice`)

- ✅ Mapeamento unificado entre Android e iOS

---

### 🚀 Melhorias na API

- `getAll()` agora retorna `InfoAll`  
  _(antes: `DeviceContext`)_

- `getApp()` agora retorna `InfoApp`  
  _(antes: `Map<String, dynamic>`)_

- `getDevice()` agora retorna `InfoDevice`  
  _(antes: `Map<String, dynamic>`)_

---

### 🧠 Tipagem forte (Strongly Typed API)

- ✅ Removido uso direto de `Map<String, dynamic>`
- ✅ Melhor autocomplete
- ✅ Mais segurança em tempo de compilação

---

### 🔄 Compatibilidade Cross-platform

- Campos unificados:
  - `version` → (iOS: `version`, Android: `version_name`)

- Campos específicos por plataforma:

**iOS**

- `bundleId`
- `build`
- `teamId`
- `systemName`
- `systemVersion`

**Android**

- `packageName`
- `versionCode`
- `firstInstallTime`
- `lastUpdateTime`
- `installerStore`
- `manufacturer`
- `brand`
- `device`
- `hardware`
- `sdkInt`

---

### 🧪 Testes

- ✅ Atualizados para suportar novos models:
  - `InfoAll`
  - `InfoApp`
  - `InfoDevice`

- ✅ Cobertura ajustada para:
  - parsing (`fromMap`)
  - validação de propriedades tipadas

---

## [1.0.3] - Stable

### 🛠 Melhoria de arquitetura

- Alterações de pacote

---

## [1.0.2]

### 🛠 Melhoria de arquitetura

- Mudança no pacote do MainActivity

---

## [1.0.1]

### 🛠 Melhorias na documentação

- Nome do método mudou de `getContext` para `getAll`

---

## [1.0.0] - Beta

### ✨ Initial Release

First stable release of `device_context_plus`.

---

### 🚀 Features

- 📱 Application information:
  - bundle_id (iOS)
  - package_name (Android)
  - version
  - build number

- 🍎 iOS:
  - Apple Developer **Team ID** (via Keychain)

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
  - `app`
  - `device`

- 🧱 Typed API:
  - `DeviceContext`

---

### 🔧 API

- `getAll()` → returns `DeviceContext`
- `getApp()` → returns app information
- `getDevice()` → returns device information

---

### ✅ Platform Support

- ✅ Android
- ✅ iOS

---

### 🎯 Highlights

- 🔥 iOS Team ID support
- 📊 Ideal for analytics
- 🧠 Clean API
