import 'package:flutter/material.dart';
import 'package:ui_design_day_51_60/day52/widget/beam_custom_painter.dart';

class ImageStartWidget extends StatefulWidget {
  const ImageStartWidget({super.key});

  @override
  State<ImageStartWidget> createState() => _ImageStartWidgetState();
}

class _ImageStartWidgetState extends State<ImageStartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
    lowerBound: 0.6,
    upperBound: 1.0,
  );

  late Animation<Offset> animation =
      Tween<Offset>(begin: Offset.zero, end: const Offset(-.72, -.33)).animate(
          animationController..duration = const Duration(milliseconds: 500));

  late Animation<double> animation1 =
      CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn);

  @override
  void initState() {
    super.initState();
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Container(
          width: size.width * .8,
          height: size.height * .45,
          alignment: AlignmentDirectional.center,
          child: Stack(
            children: [
              Transform.translate(
                offset: const Offset(-0, -0),
                child: SlideTransition(
                  position: animation,
                  child: Transform.rotate(
                    angle: 370,
                    child: Padding(
                      padding: EdgeInsets.only(left: size.width * .05),
                      child: SizedBox(
                        width: 60,
                        height: 50,
                        child: CustomPaint(
                          painter: BeamCustomPainter(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: RotationTransition(
                  turns: animation1,
                  child: SizedBox(
                      width: 150,
                      height: 90,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Transform.translate(
                            offset: const Offset(50, 30),
                            child: Align(
                              alignment: AlignmentDirectional.bottomEnd,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(right: size.width * .05),
                                child: SizedBox(
                                  width: 170,
                                  height: 90,
                                  child: CustomPaint(
                                    painter: ArrowCustomPainter(),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )),
                ),
              ),
              LayoutBuilder(builder: (context, BoxConstraints constraint) {
                return Opacity(
                  opacity: 1,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: buildImage(
                                      "assets/images/day52/1.jpg",
                                      const BorderRadius.only(
                                        topLeft: Radius.circular(35),
                                        bottomRight: Radius.circular(35),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: constraint.maxHeight * .05),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: buildImage(
                                      "assets/images/day52/3.png",
                                      const BorderRadius.only(
                                        topLeft: Radius.circular(35),
                                        bottomRight: Radius.circular(35),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      width: constraint.maxWidth * .5 * .1),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: size.width * .05),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  SizedBox(
                                      width: constraint.maxWidth * .5 * .1),
                                  Expanded(
                                    child: buildImage(
                                      "assets/images/day52/2.jpg",
                                      const BorderRadius.only(
                                        topLeft: Radius.circular(35),
                                        bottomRight: Radius.circular(35),
                                        topRight: Radius.circular(35),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  SizedBox(height: constraint.maxHeight * .05),
                                  Expanded(
                                    child: buildImage(
                                      "assets/images/day52/4.jpg",
                                      const BorderRadius.only(
                                        topLeft: Radius.circular(35),
                                        bottomRight: Radius.circular(35),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Container buildImage(String iamge, BorderRadiusGeometry borderRadius) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 22, 22, 23),
        border: Border.all(
          color: const Color.fromARGB(255, 22, 22, 23),
          width: 2,
        ),
        borderRadius: borderRadius,
        image: DecorationImage(
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          image: AssetImage(iamge),
        ),
      ),
    );
  }
}
