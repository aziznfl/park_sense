import 'package:park_sense/data/services/method_channel.dart';
import 'package:park_sense/domain/repositories/parking.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ParkingRepositoryImpl implements ParkingRepository {
  static final shared = ParkingRepositoryImpl();

  late final SiriChannelService _service;

  ParkingRepositoryImpl({SiriChannelService? service}) {
    _service = service ?? SiriChannelService();
  }

  @override
  Future<void> start(DateTime date) async {
    await _service.setParkingTime();
  }

  @override
  Future<void> stop() async {
    await _service.endParkingTime();
  }

  @override
  Future<double?> getStartTime() async {
    final time = await _service.getParkingTime();
    return time;
  }
}
