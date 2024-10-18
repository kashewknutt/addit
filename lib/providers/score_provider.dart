import 'package:flutter/material.dart';
import '../services/score_service.dart';
import '../models/score.dart';

class ScoreProvider with ChangeNotifier {
  final ScoreService _scoreService = ScoreService();
  Score? _currentScore;

  Score? get currentScore => _currentScore;

  // Load the score for a specific user and level
  void loadScore(String userId, int level) {
    _currentScore = _scoreService.getUserScore(userId, level);
    notifyListeners();
  }

  // Update the score for a specific user
  void updateScore(String userId, int points) {
    _scoreService.updateUserScore(userId, points);
    notifyListeners();
  }
}
