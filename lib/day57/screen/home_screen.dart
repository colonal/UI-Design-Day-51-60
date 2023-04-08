import 'package:flutter/material.dart';

import '../data/data.dart';
import '../widget/background_widget.dart';


class StartScreenDay57 extends StatefulWidget {
  const StartScreenDay57({super.key});

  @override
  State<StartScreenDay57> createState() => _StartScreenDay57State();
}

class _StartScreenDay57State extends State<StartScreenDay57> {
  int _selectBottomNavigation = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: BackgroundWidget(
        child: bottomNavigationBarItem(_selectBottomNavigation).toList()[_selectBottomNavigation].child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: _selectBottomNavigation,
        showSelectedLabels: false,
        onTap: (value) {
          setState(() {
            _selectBottomNavigation = value;
          });
        },
        items: bottomNavigationBarItem(_selectBottomNavigation).map((e) => e.bottomNavigationBarItem).toList(),
      ),
    );
  }


}
