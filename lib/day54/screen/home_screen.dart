import 'package:flutter/material.dart';
import 'package:ui_design_day_51_60/day54/data/data.dart';


class StartScreenDay54 extends StatefulWidget {
  const StartScreenDay54({super.key});

  @override
  State<StartScreenDay54> createState() => _StartScreenDay54State();
}

class _StartScreenDay54State extends State<StartScreenDay54> {
    int selectOptions = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C161E),
      body: widgetOptions[selectOptions].child,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color(0xff1C161E),
        ),
        child: BottomNavigationBar(
          currentIndex: selectOptions,
          backgroundColor: const Color(0xff1C161E),
          selectedItemColor: const Color(0xffEFE3C8),
          unselectedItemColor: const Color(0xff746763),
          type:BottomNavigationBarType.shifting,
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (value) {
            setState(() {
              selectOptions = value;
            });
          },
          items:widgetOptions.map((e) => e.bottomNavigationBarItem).toList()),
      ),
    );
  }
}
