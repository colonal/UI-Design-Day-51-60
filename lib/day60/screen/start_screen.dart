import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_design_day_51_60/day60/widget/pokemon_widget.dart';

import '../data/data.dart';

class StartScreenDay60 extends StatelessWidget {
  const StartScreenDay60({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      appBar: AppBar(
        backgroundColor: const Color(0xFF000000),
        actions: [
          Center(
            child: Container(
              width: 40,
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                color: const Color(0xFFC5F2CE),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network(youImage),
            ),
          )
        ],
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Transform.translate(
              offset: Offset(-size.width * .2, size.height * .05),
              child: SvgPicture.asset(
                "assets/images/day60/background.svg",
                width: size.width,
                height: size.width,
              ),
            ),
            Positioned(
              left: size.width * .05,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Select Your",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 25,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Text(
                        "Pokèmon",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 40,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Image.asset(
                        "assets/images/day60/pokemon.png",
                        width: 35,
                        height: 35,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 10,
              left: size.width * .05,
              child: const Text(
                "12 Pokèmons\nin your\nPokèdex",
                style: TextStyle(
                  color: Color(0xFFDDDDDD),
                  fontWeight: FontWeight.w200,
                  fontSize: 19,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: size.width * .6,
                child: const PokemonWidget(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
