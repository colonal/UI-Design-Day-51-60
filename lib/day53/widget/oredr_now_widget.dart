import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'build_box_widget.dart';
import 'custom_clipper_widget.dart';

class OrderNowWidget extends StatelessWidget {
  const OrderNowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: size.height*.1,
        width: size.width * .8,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            ClipPath(
              clipper: Botton(),
              child: BuildBoxWidget(
                height: 60,
                width: size.width * .8,
                colors: const [
                  Color(0xffe8cacf),
                  Color(0x6687A4C6),
                  Color(0x6687A4C6),
                ],
                child: SizedBox(
                  width: size.width * .7,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 50),
                      SizedBox(
                        height: 40,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "App Price",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "\$1,200",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      BuildBoxWidget(
                        height: 50,
                        width: size.width * .24,
                        colors: const [
                          Color(0x6687A4C6),
                          Color(0x6687A4C6),
                          Color(0x66807BC4),
                        ],
                        alignment: Alignment.center,
                        child: const Text(
                          "Order Now",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                width: 50,
                height: 50,
                child: BuildBoxWidget(
                  width: 40,
                  height: 40,
                  colors: [
                    Color(0xff6BABC7),
                    Color(0xff575B84),
                  ],
                  alignment: Alignment.center,
                  child: Icon(
                    FontAwesomeIcons.comments,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}