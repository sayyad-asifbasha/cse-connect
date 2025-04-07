import 'package:flutter/material.dart';

class RguktFigurePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFF801313) // Dark red from image
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);

    // Draw head
    canvas.drawCircle(Offset(center.dx, center.dy - 40), 15, paint);

    // Create figure body shape (arms + legs in X shape)
    final path = Path();
    path.moveTo(center.dx, center.dy - 40); // Neck base

    // Left arm
    path.quadraticBezierTo(
      center.dx - 40, center.dy - 60,
      center.dx - 50, center.dy - 100,
    );

    // Left leg
    path.quadraticBezierTo(
      center.dx - 10, center.dy + 20,
      center.dx - 40, center.dy + 70,
    );

    // Move back to center
    path.moveTo(center.dx, center.dy - 20);

    // Right arm
    path.quadraticBezierTo(
      center.dx + 40, center.dy - 60,
      center.dx + 50, center.dy - 100,
    );

    // Right leg
    path.quadraticBezierTo(
      center.dx + 10, center.dy + 20,
      center.dx + 40, center.dy + 70,
    );

    // Recreate X-figure using connecting path
    final fullPath = Path();
    fullPath.moveTo(center.dx - 40, center.dy + 70);
    fullPath.quadraticBezierTo(
      center.dx, center.dy + 10,
      center.dx + 40, center.dy + 70,
    );
    fullPath.quadraticBezierTo(
      center.dx, center.dy,
      center.dx - 50, center.dy - 100,
    );
    fullPath.quadraticBezierTo(
      center.dx, center.dy - 40,
      center.dx + 50, center.dy - 100,
    );
    fullPath.close();

    canvas.drawPath(fullPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}