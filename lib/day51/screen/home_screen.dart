import 'package:flutter/material.dart';
import '../widget/background_widget.dart';
import '../data/data.dart';
import '../widget/favorite_count_widget.dart';
import 'dart:math' as math;

import 'profile_screen.dart';
import '../widget/show_image_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectType = 0;
  late PageController controller;
  int selectImage = 1;

  @override
  void initState() {
    controller = PageController(
      initialPage: selectImage,
      viewportFraction: 0.8,
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundWidget(
        isShowShadowBottom: false,
        isLeft: true,
        child: SafeArea(
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildIconDrow(),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.18),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Image.asset(
                                "assets/images/day51/search-normal.png",
                                width: 24,
                                height: 24,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: SizedBox(
                            // height: size.height * .15,
                            width: size.width,
                            child: const Text(
                              "Find Your\nNTF'S Today",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 45,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          width: size.width,
                          child: ListView.separated(
                            itemCount: type.length,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: 15),
                            itemBuilder: (_, index) => _buildItmeType(index),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: size.height * 0.4,
                    child: PageView.builder(
                      controller: controller,
                      itemCount: image.length,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (value) {
                        setState(() {
                          selectImage = value;
                        });
                      },
                      itemBuilder: (_, index) => _buildImge(index, context),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Latest Collection",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        _buildLatestCollection(size),
                        const SizedBox(height: 10)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImge(int index, BuildContext context) {
    return Transform.translate(
      offset: Offset(
        selectImage == index ? 0 : (selectImage > index ? -10 : 10),
        selectImage == index ? 0 : 20,
      ),
      child: Transform.rotate(
        angle: (selectImage == index ? 0 : (selectImage > index ? -15 : 15)) *
            (math.pi / 180),
        child: ShowImageWidget(
          image: image[index],
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const ProfileScreen()));
          },
        ),
      ),
    );
  }

  FittedBox _buildLatestCollection(Size size) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.white.withOpacity(0.7),
            width: 0.8,
          ),
        ),
        child: Center(
          child: SizedBox(
            width: size.width * 0.85,
            height: 100,
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: size.width * 0.85 * 0.25,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset("assets/images/day51/2.4.png"),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  width: size.width * 0.85 * 0.75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        image[0].title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        image[0].lable,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: SizedBox(
                          height: 30,
                          width: size.width * 0.85 * 0.75,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${image[0].price}ETH",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 16,
                                ),
                              ),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: FavoriteCountWidget(
                                    image: image[0], opacity: 0.07),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell _buildItmeType(int index) {
    return InkWell(
      onTap: () => setState(() {
        selectType = index;
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: selectType == index
              ? Colors.white.withOpacity(0.4)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
              color: selectType == index
                  ? Colors.white.withOpacity(0.8)
                  : Colors.transparent,
              width: 1),
        ),
        child: Center(
          child: Text(
            type[index],
            style: TextStyle(
                color: selectType == index ? Colors.white : Colors.grey,
                fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildIconDrow() {
    return SizedBox(
      height: 17,
      width: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildItneIcon(12),
          _buildItneIcon(24),
          _buildItneIcon(12),
        ],
      ),
    );
  }

  Container _buildItneIcon(double width) {
    return Container(
      height: 2,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
