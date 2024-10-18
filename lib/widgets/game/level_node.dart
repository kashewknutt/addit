import 'package:flutter/material.dart';

class LevelNode extends StatelessWidget {
  final int level;
  final bool isLocked;
  final int stars;

  const LevelNode({
    required this.level,
    required this.isLocked,
    this.stars = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isLocked) {
          Navigator.pushNamed(context, '/game_level_$level');
        }
      },
      child: Column(
        children: [
          Icon(
            isLocked ? Icons.lock : Icons.star,
            color: isLocked ? Colors.grey : Colors.yellow[700],
            size: 50,
          ),
          Text(
            'Level $level',
            style: TextStyle(fontSize: 18, color: isLocked ? Colors.grey : Colors.black),
          ),
          Row(
            children: List.generate(3, (index) {
              return Icon(
                index < stars ? Icons.star : Icons.star_border,
                color: Colors.yellow[700],
                size: 20,
              );
            }),
          )
        ],
      ),
    );
  }
}
