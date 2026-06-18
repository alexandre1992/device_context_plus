import 'package:device_context_plus/device_context_plus.dart';
import 'package:device_context_plus/models/info_all.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  InfoAll? data;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final result = await DeviceContextPlus.getAll();
    setState(() => data = result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Device Context Example')),
        body: data == null
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // 📱 APP
                  const Text(
                    '📱 App Information',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  _buildItem('bundleId', data!.app.bundleId),
                  _buildItem('version', data!.app.version),
                  _buildItem('build', data!.app.build),
                  _buildItem('teamId', data!.app.teamId),

                  _buildItem('packageName', data!.app.packageName),
                  _buildItem('versionCode', data!.app.versionCode),
                  _buildItem('firstInstallTime', data!.app.firstInstallTime),
                  _buildItem('lastUpdateTime', data!.app.lastUpdateTime),
                  _buildItem('installerStore', data!.app.installerStore),

                  const SizedBox(height: 20),

                  // 📟 DEVICE
                  const Text(
                    '🧠 Device Information',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  _buildItem('platform', data!.device.platform),
                  _buildItem('model', data!.device.model),
                  _buildItem('name', data!.device.name),

                  _buildItem('manufacturer', data!.device.manufacturer),
                  _buildItem('brand', data!.device.brand),
                  _buildItem('device', data!.device.device),
                  _buildItem('hardware', data!.device.hardware),

                  _buildItem('systemName', data!.device.systemName),
                  _buildItem('systemVersion', data!.device.systemVersion),

                  _buildItem('osVersion', data!.device.osVersion),
                  _buildItem('sdkInt', data!.device.sdkInt),

                  _buildItem('locale', data!.device.locale),
                  _buildItem('timezone', data!.device.timezone),
                  _buildItem('isEmulator', data!.device.isEmulator),
                ],
              ),
      ),
    );
  }

  Widget _buildItem(String key, dynamic value) {
    if (value == null || value.toString().isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$key: ',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: Text(value.toString()),
          ),
        ],
      ),
    );
  }
}
