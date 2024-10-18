import 'package:flutter/material.dart';
import '../services/level_service.dart';
import '../models/level.dart';

class LevelProvider with ChangeNotifier {
  final LevelService _levelService = LevelService();
  List<Level> _levels = [];

  List<Level> get levels => _levels;

  LevelProvider() {
    _loadLevels();
  }

  void _loadLevels() {
    _levels = _levelService.getLevels();
    notifyListeners();
  }

  // Unlock the next level
  void unlockNextLevel(int currentLevel) {
    _levelService.unlockNextLevel(currentLevel);
    _loadLevels(); // Reload levels to reflect the change
  }

  // Check if a specific level is locked
  bool isLevelLocked(int levelNumber) {
    return _levelService.isLevelLocked(levelNumber);
  }
}
