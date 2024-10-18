import 'package:flutter/material.dart';

class StarDisplay extends StatelessWidget {
  final int stars;

  const StarDisplay({
    required this.stars,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return Icon(
          index < stars ? Icons.star : Icons.star_border,
          color: Colors.yellow[700],
        );
      }),
    );
  }
}
