abstract class ParkingRepository {
  Future<void> start(DateTime date);
  Future<void> stop();
  Future<double?> getStartTime();
}
