import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'home_screen.dart';

class StartScreenDay59 extends StatelessWidget {
  const StartScreenDay59({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Transform.scale(
                scale: 2,
                child: Transform.translate(
                  offset: Offset(-size.width*.05, size.width*.1),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: size.width*.5,
                        width: size.width*.5,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFE3D3),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ),
              ),
              Transform.scale(
                scale: 1.5,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: size.height*.5,
                    width: size.width,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE7F6FF),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: size.height * .2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/images/day59/logo.svg",
                                width: 18,
                                height: 18,
                              ),
                              const SizedBox(width: 7),
                              const Text(
                                "CalmMind",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFACB8C2),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Flexible(
                            child: Text(
                              "Stress Less and\nLaugh Louder",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF191D21),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * .4,
                      child: Image.asset(
                        "assets/images/day59/1.png",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    SizedBox(
                      height: size.height * .12,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomeScreen(),));
                          },
                          shape: const CircleBorder(),
                          color: const Color(0xFF393939),
                          child: const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
