import 'package:flutter/services.dart';

class SiriChannelService {
  static const MethodChannel _channel = MethodChannel('siri_channel');

  Future<double?> getParkingTime() async {
    return await _channel.invokeMethod<double>('get_parking_start_time');
  }

  Future<void> setParkingTime(DateTime? date) async {
    final args = date != null
        ? {'timestamp': date.millisecondsSinceEpoch}
        : null;
    return await _channel.invokeMethod<void>('set_parking_start_time', args);
  }
}
