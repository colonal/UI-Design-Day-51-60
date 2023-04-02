import 'package:flutter/material.dart';
import 'package:ui_design_day_51_60/day55/data/data.dart';

import '../widget/benner_widget.dart';
import '../widget/food_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildTopBar(),
                const SizedBox(height: 50),
                const BennerWidget(),
                const SizedBox(height: 25),
                _buildDisplayOffer(),
                const SizedBox(height: 12),
                _buildFoods(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFoods() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        mainAxisExtent: 260,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: foods.length,
      itemBuilder: (context, index) => FoodItemWidget(food: foods[index]),
    );
  }

  Widget _buildDisplayOffer() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "Biryani",
                style: TextStyle(
                  color: Color(0xFF22222E),
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "#Veg",
                style: TextStyle(
                  color: Color(0xFF4D65F0),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "70 Offers",
                style: TextStyle(
                  color: Color(0xFF22222E),
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "#Non-Veg",
                style: TextStyle(
                  color: Color(0xFFEB6139),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTopBar() {
    return Row(
      children: [
        Icon(
          Icons.menu,
          color: Colors.grey[700],
          size: 28,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: SizedBox(
            height: 40,
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Search music",
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0xffA5A5A5),
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Colors.blueAccent.withOpacity(0.1))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey[100]!)),
                  suffixIcon:
                      Image.asset("assets/images/day55/icon_search.png")),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
                image: NetworkImage(
                    "https://i2.wp.com/litcaf.com/wp-content/uploads/pp-avatar/59b514174bffe4ae402b3d63aad79fe0.png"),
                fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }
}
