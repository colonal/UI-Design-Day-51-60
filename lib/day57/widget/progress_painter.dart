import 'dart:math';

import 'package:flutter/material.dart';

class ProgressPainter extends CustomPainter {
  final double percentage;

  ProgressPainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = Colors.white.withOpacity(.40)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 11.0;
      
    Paint progressPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 11.0;

    Paint shadowPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 11.0
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10.0);

    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2),
      -pi / 2,
      size.width,
      false,
      backgroundPaint,
    );
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2),
      3 * pi / 2,
      percentageToRadians(percentage),
      false,
      progressPaint,
    );
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: size.width / 2),
      3 * pi / 2,
      percentageToRadians(percentage),
      false,
      shadowPaint,
    );
  }

  double percentageToRadians(double percentage) {
    return (percentage / 100) * 2 * pi;
  }

  @override
  bool shouldRepaint(ProgressPainter oldDelegate) {
    return oldDelegate.percentage != percentage;
  }
}
