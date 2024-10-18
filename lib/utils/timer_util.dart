import 'dart:async';

class TimerUtil {
  late Timer _timer;
  int _seconds = 60;
  final Function onTimerTick;
  final Function onTimerEnd;

  TimerUtil({required this.onTimerTick, required this.onTimerEnd});

  void startTimer() {
    _seconds = 60;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        _seconds--;
        onTimerTick(_seconds);
      } else {
        _timer.cancel();
        onTimerEnd();
      }
    });
  }

  void stopTimer() {
    if (_timer.isActive) {
      _timer.cancel();
    }
  }

  int get remainingTime => _seconds;
}
