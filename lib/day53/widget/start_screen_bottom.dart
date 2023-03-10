import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_design_day_51_60/day53/screen/home_screen.dart';
import 'package:ui_design_day_51_60/day53/data/data.dart';

class StartScreenBottom extends StatelessWidget {
  final int selectIndex;
  const StartScreenBottom({
    Key? key,
    required this.selectIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
      flex: 1,
      child: buildBackground(
        size,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: Text(
                "Grow your\nbusiness with Zomo",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  "You will get more selling order and will be benefitted, 500 million daily active users.",
                  style: TextStyle(
                    color: Color.fromARGB(255, 191, 191, 193),
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            buildStartedButton(context)
          ],
        ),
      ),
    );
  }

  Expanded buildStartedButton(context) {
    return Expanded(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
                (route) => false);
          },
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Container(
                width: 100,
                height: 40,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff87A4C6),
                      Color(0x8887A4C6),
                      Color(0x6687A4C6),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: const Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        generateImageCount()
      ],
    ));
  }

  FittedBox generateImageCount() {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: SizedBox(
        height: 7,
        width: imageStartScreen.length * 13 + 20,
        child: ListView.builder(
          itemCount: imageStartScreen.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(
              horizontal: 3,
            ),
            decoration: BoxDecoration(
              color: index == selectIndex
                  ? const Color(0xffEDA39E)
                  : const Color(0xff809EC3),
              borderRadius: BorderRadius.circular(8),
            ),
            width: index == selectIndex ? 20 : 7,
            height: 7,
            child: const Center(),
          ),
        ),
      ),
    );
  }

  Container buildBackground(Size size, {required Widget child}) {
    return Container(
      width: size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        gradient: LinearGradient(
          begin: Alignment(0, -1),
          end: Alignment(0, 0),
          colors: [
            Color(0xff4487a4),
            Color(0xff474C72),
          ],
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          gradient: RadialGradient(
            radius: 2,
            center: Alignment.topLeft,
            colors: [
              Color(0xff87A4C6),
              Color(0x5587A4C6),
              Color(0x55474C72),
              Color(0xff474C72),
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
