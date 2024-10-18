import 'package:flutter/material.dart';

class CurvyPath extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.blueAccent
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    var path = Path();
    path.moveTo(50, 100);
    path.quadraticBezierTo(100, 150, 150, 200);
    path.quadraticBezierTo(200, 250, 250, 300);
    path.quadraticBezierTo(300, 350, 350, 400);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
