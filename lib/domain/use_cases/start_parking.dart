import 'package:park_sense/data/repository_implementations/parking.dart';
import 'package:park_sense/domain/repositories/parking.dart';

class StartParkingUseCase {
  final ParkingRepository _repo;

  StartParkingUseCase({ParkingRepository? repo})
    : _repo = repo ?? ParkingRepositoryImpl.shared;

  Future<void> call() => _repo.start(DateTime.now());
}
