import 'package:flutter/material.dart';

class LevelInfoDialog extends StatelessWidget {
  final String levelTitle;
  final String levelDescription;
  final int requiredScore;
  final bool isLocked;

  const LevelInfoDialog({
    required this.levelTitle,
    required this.levelDescription,
    required this.requiredScore,
    required this.isLocked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(levelTitle),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Text(levelDescription),
            SizedBox(height: 10),
            Text("Required Score: $requiredScore"),
            if (isLocked) Text("This level is locked!"),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
