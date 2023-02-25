import 'package:flutter/material.dart';
import 'dart:math' as math;

class BeamCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    canvas.drawLine(
      Offset(0, size.height * .4),
      Offset(size.width * .25, size.height * 0.8),
      paint,
    );

    canvas.drawLine(Offset(size.width * .5, size.height * .8),
        Offset(size.width * .5, 0), paint);

    canvas.drawLine(Offset(size.width * .7, size.height * 0.7),
        Offset(size.width, size.height * .3), paint);
  }

  @override
  bool shouldRepaint(covariant BeamCustomPainter oldDelegate) {
    return false;
  }
}

class ArrowCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color.fromARGB(255, 20, 20, 20)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      height: size.height,
      width: size.width,
    );
    double startAngle = -math.pi / 2;
    double sweepAngle = math.pi;
    bool useCenter = false;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);

    canvas.drawLine(Offset(size.width * .5, size.height),
        Offset(size.width * .65, size.height * .8), paint);

    canvas.drawLine(Offset(size.width * .5, size.height),
        Offset(size.width * .65, size.height * 1.2), paint);
  }

  @override
  bool shouldRepaint(covariant ArrowCustomPainter oldDelegate) {
    return false;
  }
}

class SignatureCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color.fromARGB(200, 45, 45, 45)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final Path path = Path();

    path.arcToPoint(
      Offset(size.width * .7, 0),
      clockwise: false,
      radius: const Radius.elliptical(1.5, .5),
    );

    path.arcToPoint(
      Offset(size.width * .6, 1),
      clockwise: false,
      radius: const Radius.elliptical(0.2, .10),
    );

    path.arcToPoint(
      Offset(size.width, 0),
      clockwise: false,
      radius: const Radius.elliptical(1, .2),
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
