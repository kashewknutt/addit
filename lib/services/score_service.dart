import '../models/score.dart';

class ScoreService {
  final Map<String, Score> _userScores = {}; // Map to store user scores by user ID

  // Retrieve score for a specific user and level
  Score getUserScore(String userId, int level) {
    if (_userScores.containsKey(userId)) {
      return _userScores[userId]!;
    } else {
      Score newScore = Score(userId: userId, level: level);
      _userScores[userId] = newScore;
      return newScore;
    }
  }

  // Update the score for a specific user
  void updateUserScore(String userId, int points) {
    if (_userScores.containsKey(userId)) {
      _userScores[userId]!.updateScore(points);
    }
  }
}
