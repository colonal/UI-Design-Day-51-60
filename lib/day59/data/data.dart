import 'package:flutter/material.dart';

List<String> filter = [
  "Sleep",
  "Inner Peace",
  "Stress",
  "Anxiety",
];

class Music {
  String name;
  String image;
  int time;
  Color color;
  Music({
    required this.name,
    required this.image,
    required this.time,
    required this.color,
  });
}

Music banner = Music(
    name: "Zen Meditation",
    image: "assets/images/day59/smallHappinessEntertainment.png",
    time: 20,
    color: const Color(0xFFFFE3D3),
  );

List<Music> music = [
  
  Music(
    name: "Reflection",
    image: "assets/images/day59/imageContainer.png",
    time: 6,
    color: const Color(0xFFE7F6FF),
  ),
  Music(
    name: "Visualization",
    image: "assets/images/day59/smallHappinessStanding.png",
    time: 15,
    color: const Color(0xFFFFE8EC),
  ),
  Music(
    name: "Loving Kindness",
    image: "assets/images/day59/imageContainer1.png",
    time: 15,
    color: const Color(0xFFFFFACA),
  ),
  Music(
    name: "Focused Attention",
    image: "assets/images/day59/imageContainer2.png",
    time: 15,
    color: const Color(0xFFEEE5FF),
  ),
  
];
