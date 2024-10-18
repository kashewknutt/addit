import 'package:flutter/material.dart';
import '../../models/question.dart';
import '../../utils/question_generator.dart';
import '../../widgets/game/qustion_card.dart';
import '../../widgets/game/timer_widget.dart';

class GameScreen extends StatefulWidget {
  final int level;

  GameScreen({required this.level});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late List<Question> _questions;
  late int _currentQuestionIndex;
  late int _score;

  @override
  void initState() {
    super.initState();
    _questions = QuestionGenerator.generateQuestions(level: widget.level);
    _currentQuestionIndex = 0;
    _score = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TimerWidget(
            totalTime: 60, // or any appropriate value
            onTimeUp: () {
              // Handle the time up event
              setState(() {
                _currentQuestionIndex++;
              });
            },
          ),
          QuestionCard(
            question: _questions[_currentQuestionIndex],
            onAnswered: (bool isCorrect) {
              if (isCorrect) {
                setState(() {
                  _score += 10;
                });
              }
              setState(() {
                _currentQuestionIndex++;
              });
            },
          ),
        ],
      ),
    );
  }
}
