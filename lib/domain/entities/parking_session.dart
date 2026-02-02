class ParkingSession {
  final DateTime enterTime;
  final double firstHourRate;
  final double perHourRate;

  ParkingSession({
    required this.enterTime,
    required this.firstHourRate,
    required this.perHourRate,
  });

  int get _durationSeconds => DateTime.now().difference(enterTime).inSeconds;

  double calculateCost() {
    final hours = _durationSeconds / 3600;
    if (hours <= 1) return firstHourRate;
    return firstHourRate + ((hours - 1).ceil() * perHourRate);
  }

  String counterText() {
    return "${_durationSeconds ~/ 3600}h ${_durationSeconds ~/ 60}m ${_durationSeconds % 60}s";
  }
}
