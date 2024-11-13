import 'package:flutter/material.dart';

class LevelsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Choose a Level')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[300]!, Colors.purple[300]!],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              LevelButton(
                label: 'Easy',
                color: Colors.green,
                onPressed: () => Navigator.pushNamed(context, '/game', arguments: 'easy'),
              ),
              SizedBox(height: 20),
              LevelButton(
                label: 'Medium',
                color: Colors.orange,
                onPressed: () => Navigator.pushNamed(context, '/game', arguments: 'medium'),
              ),
              SizedBox(height: 20),
              LevelButton(
                label: 'Hard',
                color: Colors.red,
                onPressed: () => Navigator.pushNamed(context, '/game', arguments: 'hard'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LevelButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const LevelButton({
    Key? key,
    required this.label,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(label),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        textStyle: TextStyle(fontSize: 24),
      ),
    );
  }
}