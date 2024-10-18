import 'package:flutter/material.dart';
import '../../widgets/dialogs/result_dialog.dart';

class ResultScreen extends StatelessWidget {
  final int score;

  ResultScreen({required this.score});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ResultDialog(score: score, feedbackMessage: 'NOICE!',),
      ),
    );
  }
}
