import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ui_design_day_51_60/day55/data/data.dart';
import 'package:ui_design_day_51_60/day55/screen/food_details_screen.dart';

class FoodItemWidget extends StatefulWidget {
  final Food food;
  const FoodItemWidget({required this.food, super.key});

  @override
  State<FoodItemWidget> createState() => _FoodItemWidgetState();
}

class _FoodItemWidgetState extends State<FoodItemWidget> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0.5,
      end: 1,
    ).animate(_controller);
    super.initState();
    _controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => FoodDetailsScreen(food: widget.food),));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [.2, 1],
              colors: [
                Color(0xFF58586B),
                Color(0xFF06060A),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: constraints.maxHeight *.65,
                width: constraints.maxWidth * .9,
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white,
                            Colors.white.withOpacity(.05),
                            Colors.white.withOpacity(.05),
                            Colors.white,
                          ],
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color(0xFF58586B),
                              Color(0xFF58586B),
                              Color(0xFF424251),
                              Color(0xff23232C),
                              Color(0xff23232C),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Hero(
                      tag: "${widget.food.title}${widget.food.price}",
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (context,child) {
                          return Transform.rotate(
                            angle: _controller.value  * pi,
                            child: Transform.scale(
                              scale: _animation.value * 1.1,
                              child: Image.asset(
                                widget.food.image,
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        }
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: constraints.maxHeight * .1,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    widget.food.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                height: constraints.maxHeight * .13,
                width: constraints.maxWidth,
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "₹${widget.food.price}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          ),
                          Text(
                            "${widget.food.evaluation}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
