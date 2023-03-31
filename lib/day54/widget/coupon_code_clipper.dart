import 'package:flutter/material.dart';

class CouponCodeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);

      path.lineTo(
      0,
      size.height*.2,
    );
    path.quadraticBezierTo(15, size.height*.5, 0,
      size.height*.7,);

    path.lineTo(
      0,
      size.height*.7,
    );
    path.lineTo(
      0,
      size.height,
    );

    path.lineTo(
      size.width,
      size.height,
    );
    path.lineTo(
      size.width,
      size.height*.7,
    );

    path.quadraticBezierTo(size.width -15, size.height*.5, size.width,
      size.height*.2,);

    path.lineTo(
      size.width,
      size.height*.2,
    );

    path.lineTo(
      size.width,
      0,
    );

    path.close();


    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}