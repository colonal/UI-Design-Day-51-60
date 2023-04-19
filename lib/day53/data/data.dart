import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_design_day_51_60/day53/widget/home_widget.dart';

const List imageStartScreen = [
  "assets/images/day53/2.png",
  "assets/images/day53/1.png",
  "assets/images/day53/3.png",
];

class NavigationBarModel {
  final Widget child;
  final BottomNavigationBarItem bottomNavigationBarItem;

  NavigationBarModel(
      {required this.child, required this.bottomNavigationBarItem});
}

final List<NavigationBarModel> widgetOptions = <NavigationBarModel>[
  NavigationBarModel(
    child: const Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    bottomNavigationBarItem: const BottomNavigationBarItem(
        icon: Center(child: Icon(Icons.home, size: 22)), label: ""),
  ),
  NavigationBarModel(
    child: const Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    bottomNavigationBarItem: const BottomNavigationBarItem(
        icon: Center(child: Icon(FontAwesomeIcons.fileLines, size: 22)),
        label: ""),
  ),
  NavigationBarModel(
    child: const HomeWidget(),
    bottomNavigationBarItem: BottomNavigationBarItem(
        icon: FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xff4FCBED),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 6),
                  blurRadius: 10,
                  spreadRadius: 8,
                  color: const Color(0xff4FCBED).withOpacity(.2),
                ),
              ],
            ),
            child: const Icon(
              FontAwesomeIcons.briefcase,
              size: 28,
            ),
          ),
        ),
        label: ""),
  ),
  NavigationBarModel(
    child: const Text('Acount Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    bottomNavigationBarItem: const BottomNavigationBarItem(
        icon: Center(child: Icon(FontAwesomeIcons.chartPie, size: 22)),
        label: ""),
  ),
  NavigationBarModel(
    child: const Text('Setting Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    bottomNavigationBarItem: const BottomNavigationBarItem(
        icon: Center(child: Icon(FontAwesomeIcons.user, size: 22)), label: ""),
  ),
];
