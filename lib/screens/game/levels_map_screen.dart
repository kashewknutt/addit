import 'package:flutter/material.dart';
import '../../widgets/game/level_node.dart';
import '../../widgets/game/curvy_path.dart';

class LevelsMapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomPaint(
              painter: CurvyPath(),
            ),
          ),
          // Example level nodes
          Positioned(
            top: 200,
            left: 50,
            child: LevelNode(level: 1, isLocked: false, stars: 3),
          ),
          Positioned(
            top: 300,
            right: 50,
            child: LevelNode(level: 2, isLocked: true),
          ),
        ],
      ),
    );
  }
}
