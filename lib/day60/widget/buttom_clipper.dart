import 'package:flutter/material.dart';

class ButtonClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
       var path =  Path();
    path.lineTo(0, 0);


    
    
    path.quadraticBezierTo(size.width *.1, size.height*.1,
        size.width *.5, size.height*.25);

    path.quadraticBezierTo(size.width*1  , size.height*.35,
        size.width, size.height*.5);


    path.quadraticBezierTo(size.width  , size.height*.65,
        size.width *.5, size.height*.75);

    path.quadraticBezierTo(size.width *.1, size.height*.9,
        0, size.height);
     path.lineTo(0, size.height);
     path.lineTo(0, 0);


    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
