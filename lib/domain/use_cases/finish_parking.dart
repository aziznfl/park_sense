import 'package:park_sense/data/repository_implementations/parking.dart';
import 'package:park_sense/domain/repositories/parking.dart';

class FinishParkingUseCase {
  final ParkingRepository _repo;

  FinishParkingUseCase({ParkingRepository? repo})
    : _repo = repo ?? ParkingRepositoryImpl.shared;

  Future<void> call() => _repo.stop();
}
