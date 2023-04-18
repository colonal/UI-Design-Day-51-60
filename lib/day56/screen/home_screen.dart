// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../data/data.dart';
import '../widget/background_widget.dart';

class StartScreenDay56 extends StatefulWidget {
  const StartScreenDay56({super.key});

  @override
  State<StartScreenDay56> createState() => _StartScreenDay56State();
}

class _StartScreenDay56State extends State<StartScreenDay56> {
  int _selectItem = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF0F111E),
      body: BakgroundWidget(child: bottomBarItems[_selectItem].child),
      floatingActionButton: _buildfloatingActionButton(size),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomAppBar(size),
    );
  }

  Widget _buildfloatingActionButton(Size size) {
    return Transform.translate(
      offset: const Offset(0, 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          setState(() {
            _selectItem = 2;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: size.width*.15,
              height: size.width*.15,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(0xff0061FF),
                    Color(0xff6100FF),
                  ],
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  bottomBarItems[2].img,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              bottomBarItems[2].label,
              style: TextStyle(
                color:
                    _selectItem == 2 ? Colors.white : const Color(0xFF999999),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomAppBar(Size size) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: SizedBox(
        width: size.width,
        child: BottomAppBar(
          notchMargin: 0,
          padding: EdgeInsets.zero,
          height: 75,
          color: Colors.transparent,
          child: ClipRRect(
            borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(30)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 35, sigmaY: 35),
              child: Container(
                clipBehavior: Clip.antiAlias,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.2)),
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(30)),
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF444444).withOpacity(.1),
                      const Color(0xFF515151).withOpacity(.1)
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: _buildItemsBottomAppBar(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItemsBottomAppBar() {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...List.generate(
              bottomBarItems.length,
              (index) => index == 2
                  ? Container()
                  : InkWell(
                      onTap: () {
                        setState(() {
                          _selectItem = index;
                        });
                      },
                      child: Column(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  bottomBarItems[index].img,
                                  color: _selectItem == index
                                      ? Colors.white
                                      : const Color(0xFF999999),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  bottomBarItems[index].label,
                                  style: TextStyle(
                                    color: _selectItem == index
                                        ? Colors.white
                                        : const Color(0xFF999999),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 5,
                              width: 50,
                              decoration: BoxDecoration(
                                color: _selectItem == index
                                    ? Colors.white
                                    : Colors.transparent,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ],
    );
  }
}
