class Question {
  final int firstNumber;
  final int secondNumber;
  final int correctAnswer;
  bool isAnswered;
  bool isCorrect;
  
  Question({
    required this.firstNumber,
    required this.secondNumber,
  }) : 
    correctAnswer = firstNumber + secondNumber,
    isAnswered = false,
    isCorrect = false;
}
