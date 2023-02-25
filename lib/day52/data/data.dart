import 'package:flutter/material.dart';

import 'package:ui_design_day_51_60/day52/widget/home_widget.dart';

class NavigationBarModel {
  final Widget child;
  final BottomNavigationBarItem bottomNavigationBarItem;

  NavigationBarModel(
      {required this.child, required this.bottomNavigationBarItem});
}

final List<NavigationBarModel> widgetOptions = <NavigationBarModel>[
  NavigationBarModel(
    child: const HomeWidget(),
    bottomNavigationBarItem:
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
  ),
  NavigationBarModel(
    child: const Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    bottomNavigationBarItem: const BottomNavigationBarItem(
        icon: Icon(Icons.bookmark_add_outlined), label: ""),
  ),
  NavigationBarModel(
    child: const Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    bottomNavigationBarItem:
        const BottomNavigationBarItem(icon: Icon(Icons.workspaces), label: ""),
  ),
  NavigationBarModel(
    child: const Text('Acount Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    bottomNavigationBarItem: const BottomNavigationBarItem(
        icon: Icon(Icons.person_outline), label: ""),
  ),
  NavigationBarModel(
    child: const Text('Setting Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    bottomNavigationBarItem:
        const BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
  ),
];

class NearbYouModel {
  final String image;
  final String subject;
  final String time;
  final Color splashColor;
  bool isMark;
  NearbYouModel({
    required this.image,
    required this.subject,
    required this.time,
    required this.splashColor,
    required this.isMark,
  });
}

List<NearbYouModel> nearbYouList = [
  NearbYouModel(
    image: "assets/images/day52/5.png",
    subject: "Barre studio",
    time: "Open: 8 am - 10 pm",
    splashColor: const Color(0xffB4B2C0),
    isMark: false,
  ),
  NearbYouModel(
    image: "assets/images/day52/6.png",
    subject: "Fitness club",
    time: "Open: 6 am - 10 pm",
    splashColor: const Color(0xffFFDAAB),
    isMark: false,
  ),
  NearbYouModel(
    image: "assets/images/day52/7.png",
    subject: "ASD club",
    time: "Open: 9 am - 10 pm",
    splashColor: const Color(0xff70ABF3),
    isMark: false,
  ),
];

List<String> imageFace = [
  "https://images.unsplash.com/photo-1582233479366-6d38bc390a08?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZmFjZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1597223557154-721c1cecc4b0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZmFjZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZmFjZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8ZmFjZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGZhY2VzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
  "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGZhY2VzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
];
