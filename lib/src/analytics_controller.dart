import 'dart:async';

class AnalyticsController {
  Timer? _timer;
  double _lastPosition = 0.0;
  double _lastSpeed = 1.0;

  void onPlay() {
    print('vplay');
    _startPeriodicLog();
  }

  void onPause() {
    _stopPeriodicLog();
  }

  void onSpeedChange(double speed) {
    _lastSpeed = speed;
  }

  void onSeek(double from, double to) {
    print('User seeked from $from to $to');
    _lastPosition = to;
  }

  void onPositionUpdate(double position) {
    _lastPosition = position;
  }

  void _startPeriodicLog() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 30), (_) {
      print('30s log: position=$_lastPosition, speed=$_lastSpeed');
    });
  }

  void _stopPeriodicLog() {
    _timer?.cancel();
    _timer = null;
  }

  void dispose() {
    _stopPeriodicLog();
  }

  double get lastSpeed => _lastSpeed;
} 