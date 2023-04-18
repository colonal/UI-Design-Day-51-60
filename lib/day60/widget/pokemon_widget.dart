import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_design_day_51_60/day60/screen/select_pokemon.dart';

import '../data/data.dart';

class PokemonWidget extends StatefulWidget {
  const PokemonWidget({super.key});

  @override
  State<PokemonWidget> createState() => _PokemonWidgetState();
}

class _PokemonWidgetState extends State<PokemonWidget>
    with SingleTickerProviderStateMixin {
  late PageController _controller;
  late int _selectPage;

  late AnimationController _animatedContainer;
  @override
  void initState() {
    _controller = PageController(viewportFraction: .4, initialPage: 1);
    _selectPage = 1;
    _animatedContainer = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    super.initState();
    _animatedContainer.forward();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        PageView.builder(
          controller: _controller,
          itemCount: pokemon.length,
          scrollDirection: Axis.vertical,
          onPageChanged: (index) {
            setState(() {
              _selectPage = index;
              _animatedContainer.forward(from: 0);
            });
          },
          itemBuilder: (context, index) => _selectPage == index
              ? const Center()
              : _buildPokemon(size, index),
        ),
        FadeTransition(
          // duration: const Duration(milliseconds: 300),
          opacity: _animatedContainer,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildPokemon(size, _selectPage),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildPokemon(Size size, int index) {
    return Transform.translate(
      offset: Offset(
          _selectPage == index ? 0 : 50,
          (_selectPage == index
              ? 0
              : _selectPage - 1 == index
                  ? size.width * .2
                  : -size.width * .2)),
      child: GestureDetector(
        onTap: () {
          setState(() {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SelectPokemon(index: index),));
          });
        },
        onPanUpdate: (details) {
          if (details.delta.dy > 0) {
            _controller.animateToPage(index-1, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
          }

          if (details.delta.dy < 0) {
            
              _controller.animateToPage(index+1, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
            
          }
        },
        child: Transform.rotate(
          angle: (_selectPage == index
                  ? 1
                  : _selectPage - 1 == index
                      ? 15
                      : -15) *
              pi /
              180,
          child: Center(
            child: Container(
              width: size.width * .5,
              height: size.width * .5,
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              decoration: BoxDecoration(
                color: pokemon[index].color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    pokemon[index].backgroundImage,
                    width: size.width * .5,
                    height: size.width * .5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Transform.scale(
                          scale: 1.5,
                          child: Transform.translate(
                            offset: const Offset(10, -10),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Image.asset(
                                pokemon[index].image,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        pokemon[index].name,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          children: [
                            _buildCategory(
                              child: Row(
                                children: [
                                  Image.asset(
                                    pokemon[index].type.img,
                                    width: 12,
                                    height: 12,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    pokemon[index].type.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 7),
                            _buildCategory(
                              child: Text(
                                "Evolution-${pokemon[index].evolution}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategory({required child}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: child,
        ),
      ),
    );
  }
}
