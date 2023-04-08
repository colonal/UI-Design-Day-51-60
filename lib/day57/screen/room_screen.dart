import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_design_day_51_60/day57/widget/background_widget.dart';

import '../data/data.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundWidget(
        child: SingleChildScrollView(
          child: SizedBox(
            width: size.width,
            child: Column(
              children: [
                _buildImage(size,context),
                _buildInfo(size),
                _buildItem("Mute", "assets/images/day57/img4.jpg", "No"),
                const SizedBox(height: 4),
                _buildItem(
                    "Reacted messages", "assets/images/day57/img5.jpg", "142"),
                const SizedBox(height: 4),
                _buildItem("Search", "assets/images/day57/img6.jpg", ""),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(String text, String img, String lable) {
    return Container(
      height: 35,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: const[
          BoxShadow(
            color: Colors.white,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                img,
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 3),
              Text(
                text,
                style: const TextStyle(
                  color: Color(0xFF200E32),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                lable,
                style: const TextStyle(
                  color: Color(0xFF8C8098),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(width: 3),
              const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Color(0xFF8C8098),
                size: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfo(Size size) {
    return Transform.translate(
      offset: const Offset(0, -15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        width: size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Cat lovers",
              style: TextStyle(
                  color: Color(0xFF200E32),
                  fontSize: 32,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Row(
              children: const [
                Icon(
                  Icons.person,
                  color: Color(0xFF8C8098),
                  size: 12,
                ),
                SizedBox(width: 5),
                Text(
                  "4",
                  style: TextStyle(
                    color: Color(0xFF8C8098),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 8),
                Icon(
                  Icons.visibility,
                  color: Color(0xFF8C8098),
                  size: 12,
                ),
                SizedBox(width: 5),
                Text(
                  "2 482",
                  style: TextStyle(
                    color: Color(0xFF8C8098),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              "Our mission is not to bother you. But we can only share information about what happens with poor animals in this cruel world.🐈💜.",
              style: TextStyle(
                color: Color(0xFF200E32),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 14),
            SizedBox(
              height: 40,
              child: ListView.separated(
                itemCount: classification.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 20),
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: const Color(0xFFCCC7D1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        classification[index].img,
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        classification[index].name,
                        style: const TextStyle(
                          color: Color(0xFF200E32),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
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

  Widget _buildImage(Size size,context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.network(
          "https://images.unsplash.com/photo-1582769923195-c6e60dc1d8dc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8UHVycGxlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
          height: size.height * .48,
          width: size.width,
          fit: BoxFit.cover,
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                  Navigator.of(context).pop();
                }, icon: const Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: Colors.white,
                  size: 25,
                ),),
                SvgPicture.asset("assets/images/day57/share.svg"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
