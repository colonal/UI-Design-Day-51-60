import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../data/data.dart';
import '../widget/choose_attack_widget.dart';

class BattlegroundScreen extends StatelessWidget {
  final Pokemon you;
  const BattlegroundScreen({required this.you, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      appBar: AppBar(
        backgroundColor: const Color(0xFF000000),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Battleground",
          style: TextStyle(
            color: Colors.white,
            fontSize: 35,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Column(
            children: [
              SizedBox(
                height: size.height * .4,
                width: size.width,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildGameImage(size, player, true),
                      SizedBox(
                        width: size.width * .18,
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                              child: Container(
                                width: 40,
                                height: 40,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(.1),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: const Center(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      "V/S",
                                      style: TextStyle(
                                        color: Color(0xFF757575),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      _buildGameImage(size, you, false),
                    ],
                  ),
                ),
              ),
              Container(
                height: 100,
                width: size.width * .9,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    _showPlayer(size, player, playerImage, true),
                    SizedBox(width: size.width * .1),
                    _showPlayer(size, you, youImage, false),
                  ],
                ),
              ),
              Container(
                height: 1,
                width: size.width,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 2,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Choose Your Attack",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              ChooseAttackWidget(you: you),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showPlayer(Size size, Pokemon play, String image, bool isLeft) {
    return SizedBox(
      width: size.width * .4,
      child: Column(
        crossAxisAlignment:
            isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          isLeft
              ? FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(image),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        play.name,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
              )
              : FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        play.name,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 10),
                      CircleAvatar(
                        backgroundImage: NetworkImage(image),
                      ),
                    ],
                  ),
              ),
          const SizedBox(height: 10),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment:
                  isLeft ? MainAxisAlignment.start : MainAxisAlignment.end,
              children: List.generate(
                10,
                (index) {
                  bool show = isLeft
                      ? (index >= play.evolution)
                      : (index <= 9 - play.evolution);
                  return Transform.rotate(
                    angle: (isLeft ? 15 : -15) * pi / 180,
                    child: Container(
                      height: 30,
                      width: 12,
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0, 2],
                          colors: show
                              ? [Colors.grey[400]!, Colors.grey[800]!]
                              : [
                                  Colors.white,
                                  play.color,
                                ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGameImage(Size size, Pokemon play, bool isLeft) {
    return SizedBox(
      width: size.width * .4,
      child: Stack(
        children: [
          Transform.translate(
            offset: Offset(isLeft ? -size.width * .2 : size.width * .2, 0),
            child: Container(
              width: size.width * .4,
              height: size.height * .4,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(.5),
                    blurRadius: 40,
                  ),
                  BoxShadow(
                    color: play.color.withOpacity(1),
                    blurRadius: 40,
                    offset: const Offset(-10, 0),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
            child: Image.asset(
              play.image,
              height: size.height * .4,
            ),
          )
        ],
      ),
    );
  }
}
