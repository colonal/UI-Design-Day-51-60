// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'collections_screen.dart';

class StartScreenDay58 extends StatelessWidget {
  const StartScreenDay58({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF3AAD96),
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF3AAD96),
              Color(0xFF3AAD96),
              Color(0xFF005B49),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Stack(
              children: [
                _buildCircleBox(
                  size,
                  alignment: Alignment.topRight,
                  offset: Offset(size.width * .3, -size.width * .1),
                  colors: const [
                    Color(0xFF37C7AA),
                    Color(0xFF87decd),
                  ],
                ),
                _buildCircleBox(
                  size,
                  alignment: Alignment.centerLeft,
                  offset: Offset(-size.width * .3, -size.width * .1),
                  colors: const [
                    Color(0xFFECB903),
                    Color(0xFFECB903),
                  ],
                ),
                SvgPicture.asset(
                  "assets/images/day58/shoes.svg",
                  color: Colors.white,
                  width: 60,
                  height: 18,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/day58/1.png",
                      width: size.width,
                    height: size.height * .5,
                      fit: BoxFit.scaleDown,
                    ),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SizedBox(
                          width: size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Summer Collections",
                                style: TextStyle(
                                  color: Color(0xFF122A2F),
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                "2022",
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontSize: 45,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: size.height * .02),
                              const Text(
                                "His ability to control his movement\nkeeps defenders guessing",
                                style: TextStyle(
                                  color: Color(0xFF122A2F),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: size.height * .05),
                              Center(
                                child: Container(
                                  width: size.width * .5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 20,
                                        offset: Offset(0, 10),
                                      ),
                                    ],
                                  ),
                                  child: MaterialButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) =>
                                            const CollectionsScreen(),
                                      ));
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    color: const Color(0xFFECB903),
                                    child: const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 13),
                                      child: Text(
                                        "Get Started",
                                        style: TextStyle(
                                          color: Color(0xFF122A2F),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Align _buildCircleBox(Size size,
      {required AlignmentGeometry alignment,
      required Offset offset,
      required List<Color> colors}) {
    return Align(
      alignment: alignment,
      child: Transform.translate(
        offset: offset,
        child: Container(
          width: size.width * .6,
          height: size.width * .6,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.topRight,
              colors: colors,
            ),
          ),
        ),
      ),
    );
  }
}
