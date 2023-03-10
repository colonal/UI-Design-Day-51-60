import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_design_day_51_60/day53/screen/details_screen.dart';
import 'package:ui_design_day_51_60/day53/widget/build_box_widget.dart';
import 'package:ui_design_day_51_60/day53/widget/search_painter.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: SizedBox(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildTopBar(),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            BuildBoxWidget(
                              height: 150,
                              width: size.width,
                              onTap: () => _navigator(context),
                              colors: const [
                                Color(0xffa8bed6),
                                Color(0x8887A4C6),
                                Color(0x6687A4C6),
                              ],
                              child: _buildAds(
                                text: "Facebook\nads",
                                icon: FontAwesomeIcons.facebookF,
                                star: "4.9",
                                review: 2468,
                              ),
                            ),
                            const SizedBox(height: 20),
                            BuildBoxWidget(
                              height: 100,
                              width: size.width,
                              onTap: () => _navigator(context),
                              colors: const [
                                Color(0xff92d3bf),
                                Color(0x6687A4C6),
                                Color(0x6687A4C6),
                              ],
                              child: _buildClassification(size,
                                  text: "Art & draw\nillustration",
                                  icon: FontAwesomeIcons.sketch),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * .05),
                    Expanded(
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BuildBoxWidget(
                              height: 100,
                              width: size.width,
                              colors: const [
                                Color(0xffe8cacf),
                                Color(0x6687A4C6),
                                Color(0x6687A4C6),
                              ],
                              onTap: () => _navigator(context),
                              child: _buildClassification(size,
                                  text: "UI/UX\nDesign",
                                  icon: FontAwesomeIcons.paintbrush),
                            ),
                            const SizedBox(height: 20),
                            BuildBoxWidget(
                              height: 150,
                              width: size.width,
                              onTap: () => _navigator(context),
                              colors: const [
                                Color(0xffc9c3ef),
                                Color(0x6687A4C6),
                                Color(0x6687A4C6),
                              ],
                              child: _buildAds(
                                text: "Google\nads",
                                icon: FontAwesomeIcons.google,
                                star: "4.9",
                                review: 468,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Best Service",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white.withOpacity(.9),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                _buildBestService(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBestService(Size size) {
    return BuildBoxWidget(
      height: 180,
      width: size.width,
      colors: const [
        Color(0xff8B90B8),
        Color(0xff575C84),
      ],
      child: Container(
        height: 180,
        width: size.width * .8,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(
                "assets/images/day53/4.png",
                fit: BoxFit.cover,
                height: 200,
                width: size.width * .8,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Website Design\n& Development",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: const [
                          Icon(
                            FontAwesomeIcons.desktop,
                            color: Colors.white54,
                            size: 10,
                          ),
                          SizedBox(width: 7),
                          Text(
                            "Complete Website",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white54,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          ...List.generate(5, (index) => index)
                              .map(
                                (e) => Icon(
                                  Icons.star,
                                  size: 12,
                                  color: e == 4
                                      ? const Color(0x888BD4F9)
                                      : const Color(0xff8BD4F9),
                                ),
                              )
                              .toList(),
                          const SizedBox(width: 7),
                          const Text(
                            "264 Review",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white54,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "\$1250",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xff8BD4F9),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildClassification(Size size,
      {required String text, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              SizedBox(width: size.width * .2),
              const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Row _buildAds(
      {required String text,
      required IconData icon,
      required String star,
      required int review}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              const SizedBox(height: 15),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 10,
                  ),
                  Text(
                    star,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "$review review",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withOpacity(.6),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Flexible(
          child: Text(
            "Hey Rakib!\nFind what you want",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
          ),
        ),
        Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              radius: 2,
              center: Alignment.topLeft,
              colors: [
                Color(0xff87A4C6),
                Color(0x5587A4C6),
                Color(0x55474C72),
              ],
            ),
          ),
          child: IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            icon: Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CustomPaint(
                  painter: SearchPainter(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _navigator(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const DetailsScreen()));
  }
}
