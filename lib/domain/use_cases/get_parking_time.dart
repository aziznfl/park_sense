import 'package:park_sense/data/repository_implementations/parking.dart';
import 'package:park_sense/domain/repositories/parking.dart';

class GetParkingTimeUseCase {
  final ParkingRepository _repo;

  GetParkingTimeUseCase({ParkingRepository? repo})
    : _repo = repo ?? ParkingRepositoryImpl.shared;

  Future<int?> call() async {
    final timestamp = await _repo.getStartTime();

    if (timestamp == null) return null;

    return (timestamp * 1000).toInt();
  }
}
