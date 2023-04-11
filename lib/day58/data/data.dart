import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:image/image.dart' as image;

List nike = [
  [
    "assets/images/day58/nike/nike1_back.png",
    "assets/images/day58/nike/nike1_left.png",
    "assets/images/day58/nike/nike1.png",
    "assets/images/day58/nike/nike1_right.png",
    "assets/images/day58/nike/nike1_up.png",
  ],
  [
    "assets/images/day58/nike/nike2_back.png",
    "assets/images/day58/nike/nike2_left.png",
    "assets/images/day58/nike/nike2.png",
    "assets/images/day58/nike/nike2_right.png",
    "assets/images/day58/nike/nike2_up.png",
  ],
  [
    "assets/images/day58/nike/nike3_back.png",
    "assets/images/day58/nike/nike3_left.png",
    "assets/images/day58/nike/nike3.png",
    "assets/images/day58/nike/nike3_right.png",
    "assets/images/day58/nike/nike3_up.png",
  ],
];

Future<ui.Image> getUiImage(
      String imageAssetPath, int height, int width) async {
    final ByteData assetImageByteData = await rootBundle.load(imageAssetPath);
    image.Image? baseSizeImage =
        image.decodeImage(assetImageByteData.buffer.asUint8List());
    // final resizeImage =image.copyResize(baseSizeImage!, width: width,height: height);
    ui.Codec codec =
        await ui.instantiateImageCodec(image.encodePng(baseSizeImage!));
    ui.FrameInfo frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }