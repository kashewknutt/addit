import 'package:flutter/material.dart';

class ResultDialog extends StatelessWidget {
  final int score;
  final String feedbackMessage;

  const ResultDialog({
    required this.score,
    required this.feedbackMessage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Your Result'),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Text('Score: $score'),
            SizedBox(height: 10),
            Text(feedbackMessage),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Try Again'),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
            // Add any logic to restart the level or game here
          },
        ),
        TextButton(
          child: Text('Continue'),
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
            // Add any logic to navigate to the next level or main menu
          },
        ),
      ],
    );
  }
}
