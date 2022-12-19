import 'package:flutter/material.dart';

class Box extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const radius = 5.0;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = Colors.amber[900]!;

    final fullRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height,
      ),
      const Radius.circular(radius),
    );

    canvas.drawRRect(
      fullRect,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
