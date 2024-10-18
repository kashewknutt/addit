class ScoreCalculator {
  static int calculateScore(int correctAnswers, int timeRemaining) {
    int score = correctAnswers * 10;
    score += timeRemaining;  // Bonus for finishing early
    return score;
  }
}
