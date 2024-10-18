import 'package:flutter/material.dart';
import 'dart:async';

class TimerWidget extends StatefulWidget {
  final int totalTime; // Total time in seconds
  final VoidCallback onTimeUp; // Callback when time is up

  const TimerWidget({
    required this.totalTime,
    required this.onTimeUp,
    Key? key,
  }) : super(key: key);

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late int remainingTime;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    remainingTime = widget.totalTime;
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        timer.cancel();
        widget.onTimeUp(); // Trigger the callback when the timer ends
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Background circle
        SizedBox(
          width: 80,
          height: 80,
          child: CircularProgressIndicator(
            value: remainingTime / widget.totalTime,
            strokeWidth: 6,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
            backgroundColor: Colors.grey[300],
          ),
        ),
        // Time display
        Text(
          remainingTime.toString(),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: remainingTime <= 10 ? Colors.red : Colors.black,
          ),
        ),
      ],
    );
  }
}
