import 'package:device_context_plus/device_context_plus.dart';
import 'package:device_context_plus/models/device_context.dart';
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
  DeviceContext? data;

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
                  const Text(
                    '📱 App Information',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...data!.app.entries.map((e) => _buildItem(e.key, e.value)),
                  const SizedBox(height: 20),
                  const Text(
                    '🧠 Device Information',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...data!.device.entries.map(
                    (e) => _buildItem(e.key, e.value),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildItem(String key, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$key: ', style: const TextStyle(fontWeight: FontWeight.w600)),
          Expanded(child: Text(value.toString())),
        ],
      ),
    );
  }
}
