import 'package:flutter/material.dart';
import 'dart:math';
import '../main.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late String level;
  late List<Question> questions;
  int currentQuestionIndex = 0;
  int score = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    level = ModalRoute.of(context)!.settings.arguments as String;
    questions = generateQuestions(level);
  }

  List<Question> generateQuestions(String level) {
    Random random = Random();
    int maxNumber;
    switch (level) {
      case 'easy':
        maxNumber = 10;
        break;
      case 'medium':
        maxNumber = 50;
        break;
      case 'hard':
        maxNumber = 100;
        break;
      default:
        maxNumber = 10;
    }

    return List.generate(5, (index) {
      int a = random.nextInt(maxNumber) + 1;
      int b = random.nextInt(maxNumber) + 1;
      int correctAnswer = a + b;
      List<int> options = [correctAnswer];
      while (options.length < 3) {
        int option = random.nextInt(maxNumber * 2) + 1;
        if (!options.contains(option)) {
          options.add(option);
        }
      }
      options.shuffle();
      return Question('$a + $b = ?', options, correctAnswer);
    });
  }

  void checkAnswer(int selectedAnswer) {
    if (selectedAnswer == questions[currentQuestionIndex].correctAnswer) {
      setState(() {
        score++;
      });
      AudioManager().playSfx('correct');
    } else {
      AudioManager().playSfx('incorrect');
    }

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      Navigator.pushReplacementNamed(context, '/result', arguments: score);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Math Magic - $level')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[300]!, Colors.purple[300]!],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      questions[currentQuestionIndex].question,
                      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    ...questions[currentQuestionIndex].options.map((option) => 
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            child: Text('$option'),
                            onPressed: () => checkAnswer(option),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              textStyle: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                      )
                    ).toList(),
                    SizedBox(height: 20),
                    Text(
                      'Question ${currentQuestionIndex + 1} of ${questions.length}',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Question {
  final String question;
  final List<int> options;
  final int correctAnswer;

  Question(this.question, this.options, this.correctAnswer);
}