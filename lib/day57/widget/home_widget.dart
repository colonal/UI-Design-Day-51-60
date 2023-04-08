import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../data/data.dart';
import 'banner_widget.dart';
import 'room_item_widget.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          children: [
            _buildTopBar(),
            const SizedBox(height: 25),
            _buildSearchWidget(size),
            const SizedBox(height: 18),
            const BannerWidget(percentage: 71),
            ListView.separated(
              itemCount: rooms.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(vertical: 20),
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemBuilder: (context, index) => RoomItemWidget(room: rooms[index]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchWidget(Size size) {
    return Container(
      width: size.width * .9,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Center(
        child: TextFormField(
          cursorColor: const Color(0xFF8667F2),
          decoration: const InputDecoration(
            hintText: "Search by chats",
            hintStyle: TextStyle(
              color: Color(0xFF8C8098),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Color(0xFF8C8098),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Flexible(
          child: Text(
            "Chates",
            style: TextStyle(
              color: Color(0xff200E32),
              fontSize: 34,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SvgPicture.asset("assets/images/day57/edit.svg")
      ],
    );
  }
}
