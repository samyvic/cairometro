import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.black;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(size.width*0.2, size.height * 0.8);

    path.quadraticBezierTo(size.width * 0.3, size.height * 0.6,
        size.width * 0.5, size.height * 0.7);

    path.quadraticBezierTo(size.width * 0.65, size.height * 0.8,
        size.width * 0.8, size.height * 0.8);

    path.lineTo(size.width*0.8, 0);

    path.lineTo(size.width*0.2, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}