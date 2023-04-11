import 'package:flutter/material.dart';

class CustomTrackShape extends SliderTrackShape {
  final double trackHeight;
  final Color trackColor;

  const CustomTrackShape({
    this.trackHeight = 2.0,
    this.trackColor = Colors.grey,
  });

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackLeft = offset.dx;
    final double trackTop = offset.dy + 10;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }

  @override
  void paint(PaintingContext context, Offset offset,
      {required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required Animation<double> enableAnimation,
      required Offset thumbCenter,
      Offset? secondaryOffset,
      bool isEnabled = false,
      bool isDiscrete = false,
      required TextDirection textDirection}) {
        
    final Canvas canvas = context.canvas;
    

    final paint = Paint()
      ..color = sliderTheme.activeTrackColor!
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;

    final path = Path();
    


    final width = parentBox.size.width;

    final height = parentBox.size.height;

    
    path.moveTo(0, height*.5);
    path.lineTo(0, height*.5);
    path.quadraticBezierTo(width/2, height, width, height*.5);
    path.lineTo(width, height*.5);


    canvas.drawPath(path, paint);


    const size = Size(20, 20);
    final newHeight = height*.5+1;
    final newWidth = width + 10;

    final specific1Paint = Paint()..color = const Color(0xFF37C7AA);
    final specific1Path = Path();

    
    specific1Path.moveTo(-5, newHeight-2);
    specific1Path.lineTo(size.width / 2-3, newHeight -size.height / 2);
    specific1Path.lineTo(size.width-5, newHeight+2);
    specific1Path.lineTo(size.width / 2-7, newHeight+size.height/2);
    specific1Path.close();
    canvas.drawPath(specific1Path, specific1Paint);


    final specific2Paint = Paint()..color = const Color(0xFF37C7AA);
    final specific2Path = Path();

    
    specific2Path.moveTo(newWidth, newHeight-2);
    specific2Path.lineTo(newWidth - size.width / 2 -2, newHeight -size.height / 2);
    specific2Path.lineTo(newWidth - size.width, newHeight+2);
    specific2Path.lineTo(newWidth - size.width / 2+2, newHeight+size.height/2);
    specific2Path.close();
    canvas.drawPath(specific2Path, specific2Paint);
  }
}
