import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_design_day_51_60/day53/widget/build_box_widget.dart';
import 'package:ui_design_day_51_60/day53/widget/custom_clipper_widget.dart';

import '../widget/oredr_now_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff474C72),
      appBar: AppBar(
        backgroundColor: const Color(0xff474C72),
        elevation: 0,
        toolbarHeight: 70,
        leadingWidth: 70,
        leading: _buldIocn(
            icon: Icons.arrow_back,
            colors: [Colors.white, Colors.white60],
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: const Text(
          "Details",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        centerTitle: true,
        actions: [
          _buldIocn(
              icon: Icons.favorite,
              colors: [Colors.white, const Color(0xff5FE4AC)],
              onPressed: () {})
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              SizedBox(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * .3,
                      width: size.width * .8,
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          ClipPath(
                            clipper: Up(),
                            child: BuildBoxWidget(
                              height: size.height * .3,
                              width: size.width * .8,
                              colors: const [
                                Color(0xff7EDEFA),
                                Color(0x6687A4C6),
                                Color(0x8887A4C6),
                              ],
                              child: SizedBox(
                                height: 250,
                                width: size.width * .8,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: SizedBox(
                                        height: 250 * .72,
                                        width: size.width * .8,
                                        child: Image.asset(
                                          "assets/images/day53/4.png",
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: size.width * .8 * .6,
                                      height: 250 * .28,
                                      child: const FittedBox(
                                        fit: BoxFit.fill,
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            "Mobile App Design &\nDevelopment",
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
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
                          SizedBox(
                            height: size.height * .3,
                            width: size.width * .2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                BuildBoxWidget(
                                  height: size.height * .3 * .28,
                                  width: size.width * .2,
                                  colors: const [
                                    Color(0x8887A4C6),
                                    Color(0x6687A4C6),
                                    Color(0xff867FCE),
                                  ],
                                  child: SizedBox(
                                    height: size.height * .3 * .28,
                                    width: size.width * .2,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Icon(Icons.star,
                                                  color: Colors.white),
                                              Text(
                                                "4.8",
                                                style: TextStyle(
                                                    fontSize: 28,
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          const Text(
                                            "568 Review",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: Center(
                          child: SizedBox(
                            width: size.width * .7,
                            height: size.height * .3,
                            child: const SingleChildScrollView(
                              child: Text(
                                "We provide full UX/UI for mobile. You don't have to worry about complexity, Just let us know your project details. We'll make your app unique and Eye-Catchy. We'll do Prototype.",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  height: 2,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 7,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * .8,
                      height: size.height * .1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          LayoutBuilder(builder: (context, constraints) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: SizedBox(
                                    width: constraints.maxWidth * .5,
                                    child: _buildDetailsWidget(
                                        text: "Total Screen",
                                        value: "28 - 40",
                                        icon: Icons.chat_bubble),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: SizedBox(
                                    width: constraints.maxWidth * .5,
                                    child: _buildDetailsWidget(
                                        text: "Delivery Time",
                                        value: "20-25 Days",
                                        icon: Icons.access_time_filled),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width * .8,
                      height: size.height * .12,
                    ),
                  ],
                ),
              ),
              const OrderNowWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailsWidget(
      {required String text, required String value, required IconData icon}) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          BuildBoxWidget(
            height: 40,
            width: 40,
            colors: const [
              Color(0x8887A4C6),
              Color(0x6687A4C6),
              Color(0xff867FCE),
            ],
            alignment: Alignment.center,
            child: Icon(
              icon,
              color: const Color(0xff91abba),
              size: 20,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white70,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buldIocn(
      {required IconData icon,
      required List<Color> colors,
      required void Function()? onPressed}) {
    return Center(
      child: Container(
        width: 60,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.15),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: onPressed,
          padding: EdgeInsets.zero,
          icon: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: colors,
            ).createShader(bounds),
            child: Icon(
              icon,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
