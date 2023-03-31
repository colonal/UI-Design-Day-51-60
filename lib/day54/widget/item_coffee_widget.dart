import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_design_day_51_60/day54/data/data.dart';
import 'package:ui_design_day_51_60/day54/screen/caffee_details_screen.dart';

class ItemCoffeeWidget extends StatelessWidget {
  final Coffee coffee;
  const ItemCoffeeWidget({required this.coffee, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => CaffeeDetailsScreen(coffee: coffee),))
      ;},
      child: SizedBox(
        width: 130,
        height: 250,
        child: Card(
          color: const Color(0xff362C36),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 111,
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(coffee.image),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Text(
                      coffee.title,
                      style: const TextStyle(color: Color(0xffefe3c8), fontSize: 20),
                    ),
                    Container(
                      height: 40,
                      // padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xFF463D46),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Text(
                            "\$${coffee.price}",
                            style: const TextStyle(
                              color: Color(0xffefe3c8),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xffefe3c8),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                color: Color(0xff1C161E),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                  child: BackdropFilter(
                     filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.5),
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),bottomRight: Radius.circular(10))
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star, color: Colors.amber,size: 15,),
                          const SizedBox(width: 5),
                          Text(coffee.evaluation.toString(), style: const TextStyle(color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
