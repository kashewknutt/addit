class Level {
  final int levelNumber;
  final int requiredScore;
  bool isLocked; // Change to regular mutable field
  final int? previousScore;
  
  Level({
    required this.levelNumber,
    required this.requiredScore,
    this.isLocked = true,
    this.previousScore,
  });
}
