import 'package:flutter/material.dart';

class Up extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);

    path.lineTo(size.width * .7 - 35, size.height);

    path.quadraticBezierTo(
        size.width * .7, size.height, size.width * .7, size.height * .95);

    path.lineTo(size.width * .7, size.height * .9);

    path.quadraticBezierTo(size.width * .69, size.height * .72,
        size.width * .78, size.height * .7);

    path.lineTo(size.width * .78, size.height * .7);

    path.lineTo(size.width - 15, size.height * .7);

    path.quadraticBezierTo(
        size.width + 2, size.height * .7, size.width, size.height * .6);

    path.lineTo(size.width, size.height * .6);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class Botton extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height);

    path.lineTo(
      0,
      60,
    );

    path.quadraticBezierTo(5, 46, 5.1, 50.2);

    path.lineTo(
      10,
      50.2,
    );

    path.lineTo(
      40,
      50,
    );

    path.quadraticBezierTo(52, 52, 50, 40);

    path.lineTo(
      50,
      20,
    );
    path.quadraticBezierTo(50, 5, 65, 0);
    path.lineTo(
      70,
      0,
    );

    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
