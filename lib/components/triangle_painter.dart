import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  TrianglePainter({required this.fillColor});
  Color fillColor;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
                  ..color = fillColor;
    final path = Path()
                  ..moveTo(size.width / 2.0, 0)
                  ..lineTo(0, size.height)
                  ..lineTo(size.width, size.height)
                  ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
