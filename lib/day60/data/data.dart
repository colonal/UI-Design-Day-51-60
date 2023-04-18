import 'package:flutter/material.dart';

class Pokemon {
  final String image;
  final String name;
  final Color color;
  final String backgroundImage;
  final int evolution;
  final PokemonType type;
  final Attacks attacks;
  Pokemon({
    required this.image,
    required this.name,
    required this.color,
    required this.backgroundImage,
    required this.evolution,
    required this.type,
    required this.attacks,
  });
}

class PokemonType {
  final String img;
  final String name;
  PokemonType({
    required this.img,
    required this.name,
  });
}

List<Pokemon> pokemon = [
  Pokemon(
    image: "assets/images/day60/bulbasaur.png",
    name: "Bulbasaur",
    color: const Color(0xFFB2FFE2),
    backgroundImage: "assets/images/day60/bulbasaur-b.png",
    evolution: 4,
    type: PokemonType(
      img: "assets/images/day60/bulbasaur-type.png",
      name: "Plant",
    ),
    attacks: attacks,
  ),
  Pokemon(
    image: "assets/images/day60/charizard.png",
    name: "Charizard",
    color: const Color(0xFFFFB444),
    backgroundImage: "assets/images/day60/charizard-b.png",
    evolution: 8,
    type: PokemonType(
      img: "assets/images/day60/charizard-type.png",
      name: "Fire",
    ),
    attacks: attacks,
  ),
  Pokemon(
    image: "assets/images/day60/blastoise.png",
    name: "Blastoise",
    color: const Color(0xFFA2DDF4),
    backgroundImage: "assets/images/day60/blastoise-b.png",
    evolution: 5,
    type: PokemonType(
      img: "assets/images/day60/blastoise-type.png",
      name: "Water",
    ),
    attacks: attacks,
  ),
];

Pokemon player = Pokemon(
  image: "assets/images/day60/player.png",
  name: "Player 1",
  color: const Color(0xFF00AFED),
  backgroundImage: "assets/images/day60/blastoise-b.png",
  evolution: 4,
  type: PokemonType(
    img: "assets/images/day60/blastoise-type.png",
    name: "Water",
  ),
  attacks: attacks,
);

String youImage =
    "https://images.unsplash.com/photo-1542909168-82c3e7fdca5c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZmFjZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60";
String playerImage =
    "https://slp-statics.astockcdn.net/static_assets/staging/23winter/home/curated-collections/Card3_SLP_534605341.jpg?width=580";

class Attacks {
  final List<Attack> attack;
  final Color color;
  final Color backgroundColor;

  Attacks({
    required this.attack,
    required this.color,
    required this.backgroundColor,
  });
}

class Attack {
  final String name;
  final String image;
  Attack({
    required this.name,
    required this.image,
  });
}

Attacks attacks = Attacks(
  attack: [
    Attack(image: "assets/images/day60/attack-1.png", name: "Giga Impact"),
    Attack(image: "assets/images/day60/attack-2.png", name: "Aerial Ace"),
    Attack(image: "assets/images/day60/attack-3.png", name: "Flamethrower"),
    Attack(image: "assets/images/day60/attack-4.png", name: "Dragon Tail"),
  ],
  color: const Color(0xFFFF4210),
  backgroundColor: const Color(0xFFFFE4DD),
);
