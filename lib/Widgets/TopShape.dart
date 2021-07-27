import 'package:flutter/material.dart';
import 'package:mr_mart/app_components/ThemesColor.dart';

class TopShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Themes.primary
      ..style = PaintingStyle.fill
      ..strokeWidth = 5.0;

    Path path_0 = Path();
    path_0.moveTo(0, size.height);
    path_0.lineTo(0, 0);
    path_0.lineTo(size.width, 0);
    path_0.lineTo(
      size.width,
      size.height * 0.50,
    );
    path_0.quadraticBezierTo(
      size.width * 1.00,
      size.height * 0.75,
      size.width * 0.90,
      size.height * 0.75,
    );
    path_0.cubicTo(
      size.width * 0.70,
      size.height * 0.75,
      size.width * 0.30,
      size.height * 0.75,
      size.width * 0.10,
      size.height * 0.75,
    );
    path_0.quadraticBezierTo(
      size.width * 0.00,
      size.height * 0.75,
      0,
      size.height,
    );
    path_0.close();

    canvas.drawPath(path_0, paint_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
