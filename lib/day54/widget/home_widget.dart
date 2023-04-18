import 'package:flutter/material.dart';

import '../data/data.dart';
import 'filter_coffee_widget.dart';
import 'item_coffee_widget.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  _buildTopBar(size),
                  const SizedBox(height: 10),
                  _buildSearsh(size),
                  const SizedBox(height: 25),
                  _buildCoffee()
                ],
              ),
            ),
            const FilterCoffeesWidget(),
          ],
        ),
      ),
    );
  }

  Row _buildCoffee() {
    return Row(
      children: [
        const SizedBox(width: 50),
        Expanded(
          child: GridView.builder(
            itemCount: coffees.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              crossAxisSpacing: 6.0,
              mainAxisSpacing: 6.0,
              mainAxisExtent: 250,
            ),
            itemBuilder: (context, index) {
              return ItemCoffeeWidget(coffee: coffees[index]);
            },
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  Container _buildSearsh(Size size) {
    return Container(
      height: 40,
      width: size.width * .85,
      decoration: BoxDecoration(
        color: const Color(0xff171017),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        cursorColor: Colors.white,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(7),
          focusedBorder: InputBorder.none,
          hintText: "Browse your favourite coffee...",
          hintStyle: TextStyle(
            color: Color(0x4fEFE3C8),
            fontSize: 14,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xffEFE3C8),
          ),
        ),
      ),
    );
  }

  SizedBox _buildTopBar(Size size) {
    return SizedBox(
      width: size.width * .85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const FittedBox(
            fit: BoxFit.scaleDown,
            child: Text.rich(
              TextSpan(
                text: "déjà\n",
                style: TextStyle(color: Color(0x4fefe3c8), fontSize: 25),
                children: [
                  TextSpan(
                    text: " Brew",
                    style: TextStyle(
                        color: Color(0xffefe3c8),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(1),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xffefe3c8),
              ),
            ),
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNBintDkigpmYvjhmI8IuGlBoMthL-BzknWCS-yRL5SqwfhfhkYN3g_RgBTv9CAMB4mq0&usqp=CAU"),
              backgroundColor: Color(0xffefe3c8),
            ),
          )
        ],
      ),
    );
  }
}
