import 'package:flutter/services.dart';

class SiriChannelService {
  static const MethodChannel _channel = MethodChannel('siri_channel');

  Future<double?> getParkingTime() async {
    return await _channel.invokeMethod<double>('get_parking_start_time');
  }

  Future<double?> setParkingTime() async {
    return await _channel.invokeMethod<double?>('set_parking_start_time');
  }

  Future<double?> endParkingTime() async {
    return await _channel.invokeMethod<double?>('end_parking_start_time');
  }
}
