class DeviceContext {
  final Map<String, dynamic> app;
  final Map<String, dynamic> device;

  DeviceContext({
    required this.app,
    required this.device,
  });

  factory DeviceContext.fromMap(Map<String, dynamic> map) {
    return DeviceContext(
      app: Map<String, dynamic>.from(map['app'] ?? {}),
      device: Map<String, dynamic>.from(map['device'] ?? {}),
    );
  }

  void operator [](String other) {}
}
