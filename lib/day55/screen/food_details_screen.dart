import 'package:flutter/material.dart';
import 'package:ui_design_day_51_60/day55/data/data.dart';

class FoodDetailsScreen extends StatelessWidget {
  final Food food;
  const FoodDetailsScreen({required this.food, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF1C1D21),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1D21),
        toolbarHeight: 40,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: SizedBox(
        height: size.height,
        width: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildImage(size),
            _buidItemInfo(size),
            _buidBuyButton(size),
          ],
        ),
      ),
    );
  }

  Widget _buidBuyButton(Size size) {
    return SizedBox(
      height: size.height * .1,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: const LinearGradient(
              colors: [
                Color(0xFFF8B1E2),
                Color(0xFFE184C5),
              ],
            ),
          ),
          child: MaterialButton(
            onPressed: () {},
            child: const Text(
              "Buy now",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buidItemInfo(Size size) {
    return Container(
      height: size.height * .35,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SizedBox(
                    height: 80,
                    width: size.width,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        food.title ,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 37,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  "₹ ${food.price}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                food.description ,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ...food.types.map((type) => _builBoxText(type)),
                Container(
                  height: 42,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffEE9DD5)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: DropdownButton(
                    value: food.sizes[0],
                    icon: const Icon(Icons.keyboard_arrow_down_sharp,
                        color: Color(0xffEE9DD5)),
                    style:
                        const TextStyle(color: Color(0xffEE9DD5), fontSize: 17),
                    borderRadius: BorderRadius.circular(20),
                    underline: Container(),
                    dropdownColor: const Color(0xFF1C1D21),
                    items: food.sizes
                        .map((foodSize) => DropdownMenuItem(
                              value: foodSize,
                              child: Text(foodSize),
                            ))
                        .toList(),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildImage(Size size) {
    return SizedBox(
      height: size.height * .4,
      width: size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 10,
            child: Text(
              food.title.split(" ").last,
              style: TextStyle(
                color: const Color(0xFFE7FFA7).withOpacity(.1),
                fontSize: 80,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Hero(
              tag: "${food.title}${food.price}",
              child: Image.asset(
                height: size.height * .3,
                food.image,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _builBoxText(String text) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
    );
  }
}
