import 'package:flutter/services.dart';

class BatteryService {
  static const MethodChannel _channel = MethodChannel('com.example/battery_channel');

  Future<int?> getBatteryLevel() async {
    try {
      final int? batteryLevel = await _channel.invokeMethod('getBatteryLevel');
      return batteryLevel;
    } on PlatformException catch (e) {
      return 0;
    }
  }
}
