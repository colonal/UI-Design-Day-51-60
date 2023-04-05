import 'package:flutter/material.dart';

class BakgroundWidget extends StatelessWidget {
  final Widget child;
  const BakgroundWidget({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Transform.translate(
              offset: Offset(size.width * .5, -size.height * .25),
              child: Transform.scale(
                scale: 1.8,
                child: SizedBox(
                  height: size.height * .5,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      ...List.generate(
                          10,
                          (index) => Container(
                                height: 40.0 * (10 - index),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: index % 2 == 0
                                      ? const Color(0xFF0F111E)
                                      : const Color(0xff191B26),
                                ),
                              )).toList(),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: size.width,
              height: size.height,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
