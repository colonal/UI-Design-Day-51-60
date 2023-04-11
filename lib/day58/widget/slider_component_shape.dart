import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ImageSliderThumbCircle extends SliderComponentShape {
  final ui.Image image;

  const ImageSliderThumbCircle({
    required this.image,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    const radius = 20.0; // Radius of the thumb circle
    const diameter = radius * 2;
    return const Size.square(diameter * 2);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) async {
    final canvas = context.canvas;

    final imageWidth = image.width;
    final imageHeight = image.height-3;

    final height = parentBox.size.height;

    final v = (1 - .5 - value).abs();
    Offset imageOffset = Offset(
      center.dx - (imageWidth / 2),
      (height - imageHeight) - (height -imageHeight) * v,
    );



    Paint paint = Paint()..filterQuality = FilterQuality.high;


    canvas.drawImage(image, imageOffset, paint);

    
  }
}
