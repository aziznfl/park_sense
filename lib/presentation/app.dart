import 'dart:async';
import 'package:flutter/material.dart';
import 'package:park_sense/domain/use_cases/finish_parking.dart';
import 'package:park_sense/domain/use_cases/get_parking_time.dart';
import 'package:park_sense/domain/use_cases/start_parking.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  int? enterTime;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _load();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == .resumed) {
      _load();
    }
  }

  Future<void> _load() async {
    enterTime = await GetParkingTimeUseCase().call();

    timer ??= Timer.periodic(
      const Duration(seconds: 1),
      (_) => setState(() {}),
    );
  }

  Future<void> _start() async {
    await StartParkingUseCase().call();
    _load();
  }

  Future<void> _clear() async {
    await FinishParkingUseCase().call();
    enterTime = null;
    timer?.cancel();
    timer = null;
    setState(() {});
  }

  String _durationText() {
    if (enterTime == null) return '--';
    final diff = DateTime.now().difference(
      DateTime.fromMillisecondsSinceEpoch(enterTime!),
    );
    return '${diff.inHours}h ${diff.inMinutes % 60}m ${diff.inSeconds % 60}s';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ParkSense')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_durationText(), style: const TextStyle(fontSize: 40)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _start,
              child: const Text('Start Parking'),
            ),
            ElevatedButton(
              onPressed: _clear,
              child: const Text('Clear Parking'),
            ),
          ],
        ),
      ),
    );
  }
}
