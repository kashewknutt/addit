class Score {
  final String userId;
  final int level;
  int totalScore;
  
  Score({
    required this.userId,
    required this.level,
    this.totalScore = 0,
  });
  
  void updateScore(int points) {
    totalScore += points;
  }
}
