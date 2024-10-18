import 'package:flutter/material.dart';  
import '../../models/question.dart';
class QuestionCard extends StatefulWidget {
  final Question question;
  final ValueChanged<bool> onAnswered;

  const QuestionCard({
    required this.question,
    required this.onAnswered,
    Key? key,
  }) : super(key: key);

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  bool hasAnswered = false;

  void _checkAnswer(int selectedAnswer) {
    if (!hasAnswered) {
      setState(() {
        hasAnswered = true;
        widget.question.isAnswered = true;
        widget.question.isCorrect = selectedAnswer == widget.question.correctAnswer;
      });

      // Notify parent widget whether the answer was correct
      widget.onAnswered(widget.question.isCorrect);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              '${widget.question.firstNumber} + ${widget.question.secondNumber} = ?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 10,
              children: _buildAnswerOptions(),
            ),
            if (hasAnswered)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  widget.question.isCorrect ? 'Correct! 🎉' : 'Wrong! 😔',
                  style: TextStyle(
                    fontSize: 18,
                    color: widget.question.isCorrect ? Colors.green : Colors.red,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildAnswerOptions() {
    final List<int> options = _generateOptions(widget.question.correctAnswer);
    return options.map((answer) {
      return ElevatedButton(
        onPressed: () => _checkAnswer(answer),
        child: Text(
          answer.toString(),
          style: TextStyle(fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: hasAnswered
              ? (answer == widget.question.correctAnswer ? Colors.green : Colors.red)
              : Colors.blueAccent,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        ),
      );
    }).toList();
  }

  // Generate multiple answer options (one correct and some random incorrect options)
  List<int> _generateOptions(int correctAnswer) {
    List<int> options = [correctAnswer];
    while (options.length < 4) {
      int randomOption = correctAnswer + (options.length * 2 - 1);
      if (!options.contains(randomOption)) {
        options.add(randomOption);
      }
    }
    options.shuffle();
    return options;
  }
}
