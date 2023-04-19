import 'package:flutter/material.dart';
import 'package:ui_design_day_51_60/day53/data/data.dart';

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
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff474C72),
      body: SafeArea(child: widgetOptions.elementAt(_selectedIndex).child),
      bottomNavigationBar: SizedBox(
        height: 85,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: 2,
              width: double.infinity,
              color: Colors.white30,
            ),
            Expanded(
              child: Center(
                child: BottomNavigationBar(
                  selectedFontSize: 0.0,
                  unselectedFontSize: 0.0,
                  currentIndex: _selectedIndex,
                  items: widgetOptions
                      .map((e) => e.bottomNavigationBarItem)
                      .toList(),
                  onTap: _onItemTapped,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: const Color(0xff474C72),
                  selectedItemColor: Colors.white,
                  unselectedItemColor: Colors.grey,
                  elevation: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
