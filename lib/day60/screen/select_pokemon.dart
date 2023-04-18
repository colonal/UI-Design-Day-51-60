import 'dart:ui';

import 'package:flutter/material.dart';

import '../data/data.dart';
import '../widget/buttom_clipper.dart';
import '../widget/swipe_up_widget.dart';

class SelectPokemon extends StatefulWidget {
  final int index;
  const SelectPokemon({required this.index, super.key});

  @override
  State<SelectPokemon> createState() => _SelectPokemonState();
}

class _SelectPokemonState extends State<SelectPokemon> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: pokemon.length,
              itemBuilder: (context, index) => _buildItem(size, index),
            ),
            _buildTopBar(size, context),
            _buildButton(size),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(Size size, int index) {
    return Column(
      children: [
        SizedBox(
          height: size.height * .4,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(pokemon[index].backgroundImage),
                  fit: BoxFit.cover),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: pokemon[index].color.withOpacity(0.2),
                        blurRadius: 250,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Transform.scale(
                    scale: 1.2,
                    child: Image.asset(
                      pokemon[index].image,
                      fit: BoxFit.fitHeight,
                      height: size.height * .35,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: size.height * .3,
          child: Stack(
            children: [
              SizedBox(
                height: 50,
                width: size.width,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    pokemon[index].name,
                    style: const TextStyle(
                      color: Color(0xFF0c0c0c),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    pokemon[index].name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w600),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                pokemon[index].type.img,
                                width: 12,
                                height: 12,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                pokemon[index].type.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: pokemon[index].color,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Charizard is known for its dragon-like appearance, with a large wingspan and a long, pointed tail.  He is capable of using powerful Fire-type attacks as well as Flying-type moves.",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  // const SizedBox(height: 20),
                  Text(
                    "View Stats",
                    style: TextStyle(
                      color: pokemon[index].color,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SwipeUpWidget(index: index),
      ],
    );
  }

  Positioned _buildTopBar(Size size, BuildContext context) {
    return Positioned(
      left: 10,
      top: 10,
      right: 10,
      child: SafeArea(
        child: SizedBox(
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Transform.translate(
                          offset: const Offset(3, 0),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
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
        ),
      ),
    );
  }

  Positioned _buildButton(Size size) {
    return Positioned(
      bottom: 10,
      child: SizedBox(
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipPath(
              clipper: ButtonClipper(),
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () {
                  _pageController.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linearToEaseOut);
                },
                child: Container(
                  height: size.height * .2,
                  width: size.width * .2,
                  color: const Color(0xFF232323),
                  alignment: Alignment.centerRight,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            RotatedBox(
              quarterTurns: 2,
              child: ClipPath(
                clipper: ButtonClipper(),
                clipBehavior: Clip.hardEdge,
                child: InkWell(
                  onTap: () {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linearToEaseOut);
                  },
                  child: Container(
                    height: size.height * .2,
                    width: size.width * .2,
                    color: const Color(0xFF232323),
                    alignment: Alignment.centerRight,
                    child: const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
