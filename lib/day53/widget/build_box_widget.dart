import 'dart:ui';

import 'package:flutter/material.dart';

class BuildBoxWidget extends StatelessWidget {
  final double height;
  final double width;
  final List<Color> colors;
  final AlignmentGeometry alignment;
  final Widget? child;
  final void Function()? onTap;
  const BuildBoxWidget(
      {required this.height,
      required this.width,
      required this.colors,
      this.child,
      this.alignment = Alignment.topLeft,
      this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Align(
        alignment: Alignment.center,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: colors,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: FittedBox(
                  fit: BoxFit.scaleDown, alignment: alignment, child: child),
            ),
          ),
        ),
      ),
    );
  }
}
