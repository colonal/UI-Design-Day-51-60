import 'dart:math' as math;

import 'package:flutter/material.dart';

class ImageProfilePainter extends CustomPainter {
  Color? color1;
  Color? color2;
  double? strokeWidth;
  ImageProfilePainter({
    this.color1,
    this.color2,
    this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color1 ?? Colors.teal.shade100
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth ?? 6;

    var paint2 = Paint()
      ..color = color2 ?? Colors.teal.shade200
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth ?? 6;

    canvas.drawLine(
        Offset(0, size.height * .25), Offset(size.width / 2, 0), paint);

    canvas.drawLine(
        Offset(0, size.height * .25), Offset(0, size.height * .75), paint);

    canvas.drawLine(Offset(0, size.height * .75),
        Offset(size.width / 2, size.height), paint);

    canvas.drawLine(Offset(size.width / 2, 0),
        Offset(size.width, size.height * .25), paint2);

    canvas.drawLine(Offset(size.width, size.height * .25),
        Offset(size.width, size.height * .75), paint2);

    canvas.drawLine(Offset((size.width / 2), size.height),
        Offset(size.width, size.height * .75), paint2);
    canvas.drawLine(
        Offset(0, size.height * .25), Offset(size.width / 2, 0), paint);

    final path = Path();
    path.moveTo(size.width / 2, 0.0);
    path.lineTo(size.width, size.height * .25);
    path.lineTo(size.width, size.height * .75);
    path.lineTo(size.width / 2, size.height);

    path.lineTo(0, size.height * .75);
    path.lineTo(0, size.height * .25);
    path.close();

    canvas.drawShadow(path, Colors.black, 20, true);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0.0);
    path.lineTo(size.width, size.height * .25);
    path.lineTo(size.width, size.height * .75);
    path.lineTo(size.width / 2, size.height);

    path.lineTo(0, size.height * .75);
    path.lineTo(0, size.height * .25);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
