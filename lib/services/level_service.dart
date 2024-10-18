import '../models/level.dart';

class LevelService {
  List<Level> _levels = [];

  LevelService() {
    _initializeLevels();
  }

  void _initializeLevels() {
    _levels = [
      Level(levelNumber: 1, requiredScore: 100, isLocked: false),
      Level(levelNumber: 2, requiredScore: 150),
      Level(levelNumber: 3, requiredScore: 200),
      // Add more levels as needed
    ];
  }

  List<Level> getLevels() {
    return _levels;
  }

  void unlockNextLevel(int currentLevel) {
    if (currentLevel < _levels.length - 1) {
      _levels[currentLevel].isLocked = false; // This will now work
    }
  }

  bool isLevelLocked(int levelNumber) {
    return _levels[levelNumber - 1].isLocked;
  }
}
