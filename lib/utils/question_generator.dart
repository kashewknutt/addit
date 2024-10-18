import '../models/question.dart';

class QuestionGenerator {
  // Generates a list of questions based on the level of the game.
  static List<Question> generateQuestions({required int level}) {
    List<Question> questions = [];
    for (int i = 0; i < 10; i++) {
      questions.add(_generateQuestion(level));
    }
    return questions;
  }

  // Internal helper function to generate a single question.
  static Question _generateQuestion(int level) {
    // Adjust difficulty based on the level
    int maxNumber = 10 + (level * 10);
    int num1 = _randomNumber(maxNumber);
    int num2 = _randomNumber(maxNumber);
    String operation = _randomOperation();

    int answer;
    if (operation == '+') {
      answer = num1 + num2;
    } else if (operation == '-') {
      answer = num1 - num2;
    } else if (operation == '*') {
      answer = num1 * num2;
    } else {
      answer = num1 ~/ num2;  // Integer division
    }

    return Question(
      firstNumber: num1,
      secondNumber: num2,
    );
  }

  static int _randomNumber(int max) {
    return (max * 0.8 + (max * 0.2 * (1 - 2 * (DateTime.now().second % 2)))).toInt();  // Simulates random
  }

  static String _randomOperation() {
    List<String> operations = ['+', '-', '*', '/'];
    return operations[DateTime.now().second % 4];
  }
}
