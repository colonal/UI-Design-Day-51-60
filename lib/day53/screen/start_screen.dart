import 'dart:ui';

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
            if (1 == 2)
              Expanded(
                flex: 2,
                child: LayoutBuilder(builder: (context, constraints) {
                  return Stack(
                    children: [
                      Transform.scale(
                        scale: 1.4,
                        child: SizedBox(
                          height: constraints.maxHeight,
                          width: constraints.maxWidth,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                            child: Stack(
                              alignment: Alignment.center,
                              children:
                                  List.generate(7, (index) => 7 - index).map(
                                (index) {
                                  return Center(
                                    child: Container(
                                      height: index * 50,
                                      width: index * 50,
                                      decoration: BoxDecoration(
                                        color: index % 2 == 0
                                            ? const Color(0xff52567B)
                                            : const Color(0xff474C72),
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Center(),
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ),
                      ),
                      LayoutBuilder(builder: (context, constraints) {
                        return PageView.builder(
                          itemCount: imageStartScreen.length,
                          onPageChanged: (index) {
                            setState(() {
                              selectIndex = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            return Center(
                              child: Image.asset(
                                imageStartScreen[index],
                                fit: BoxFit.fill,
                                height: constraints.maxHeight * .8,
                                width: constraints.maxWidth * .8,
                              ),
                            );
                          },
                        );
                      }),
                    ],
                  );
                }),
              ),
            StartScreenBottom(selectIndex: selectIndex),
          ],
        ),
      ),
    );
  }
}
