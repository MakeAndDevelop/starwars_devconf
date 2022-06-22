import 'package:flutter/services.dart';

const platform = MethodChannel('samples.flutter.dev/battery');

/// Invokes getBatteryLevel on the native platform
Future<String?> getBatteryLevel() async {
  try {
    final int result = await platform.invokeMethod('getBatteryLevel');
    return 'Battery level at $result % .';
  } on PlatformException catch (e) {
    return "Failed to get battery level: '${e.message}'.";
  }
}
