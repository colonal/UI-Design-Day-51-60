import 'package:flutter/material.dart';
import 'package:ui_design_day_51_60/day53/data/data.dart';
import 'package:ui_design_day_51_60/day53/widget/start_screen_bottom.dart';
import 'package:ui_design_day_51_60/day53/widget/start_screen_top.dart';

class StartScreenDay53 extends StatefulWidget {
  const StartScreenDay53({super.key});

  @override
  State<StartScreenDay53> createState() => _StartScreenDay53State();
}

class _StartScreenDay53State extends State<StartScreenDay53> {
  int selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xff474C72),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            StartScreenTop(onPageChanged: (index) {
              setState(() {
                selectIndex = index;
              });
            }),
            
            StartScreenBottom(selectIndex: selectIndex),
          ],
        ),
      ),
    );
  }
}
