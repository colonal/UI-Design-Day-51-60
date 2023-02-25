import 'package:flutter/material.dart';
import 'package:ui_design_day_51_60/day52/data/data.dart';

class NavigationBarModel {
  final Widget child;
  final BottomNavigationBarItem bottomNavigationBarItem;

  NavigationBarModel(
      {required this.child, required this.bottomNavigationBarItem});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: widgetOptions.elementAt(_selectedIndex).child),
      bottomNavigationBar: SizedBox(
        height: 65,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            items: widgetOptions.map((e) => e.bottomNavigationBarItem).toList(),
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            backgroundColor: const Color(0xff141414),
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
