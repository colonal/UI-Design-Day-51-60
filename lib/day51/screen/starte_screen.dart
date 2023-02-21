import 'package:flutter/material.dart';
import '../widget/background_widget.dart';
import 'dart:math' as math;

import '../widget/custom_painting.dart';
import 'home_screen.dart';

class Day51StareScreen extends StatelessWidget {
  const Day51StareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          child: SizedBox(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * .45,
                  width: size.width,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          child: Transform.translate(
                            offset: Offset(size.width * .15, size.height * .05),
                            child: Transform.rotate(
                              angle: 20 * (math.pi / 180),
                              child: Image.asset(
                                "assets/images/day51/1.1.png",
                                width: size.width * 0.5,
                                height: size.width * 0.40,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          child: Image.asset(
                            "assets/images/day51/1.2.png",
                            width: size.width * 0.5,
                            height: size.width * 0.40,
                          ),
                        ),
                        Positioned(
                          child: Transform.translate(
                            offset:
                                Offset(-size.width * .15, size.height * .05),
                            child: Transform.rotate(
                                angle: -20 * (math.pi / 180),
                                child: Image.asset(
                                  "assets/images/day51/1.3.png",
                                  width: size.width * 0.5,
                                  height: size.width * 0.40,
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.3,
                  width: size.width,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.1),
                      child: const Text(
                        "Find your\nBest NFT\nMarket",
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 55,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (_) => const HomeScreen()));
                    },
                    child: Center(
                      child: SizedBox(
                        width: 90,
                        height: 100,
                        child: CustomPaint(
                          painter: ImageProfilePainter(
                            color1: const Color(0xffB1AFB4),
                            color2: const Color(0xffAFAEC0),
                            strokeWidth: 3,
                          ),
                          child: const Center(
                            child: Text(
                              "Start",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
