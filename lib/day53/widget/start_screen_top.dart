import 'package:flutter/material.dart';
import 'package:ui_design_day_51_60/day53/data/data.dart';

class StartScreenTop extends StatelessWidget {
  final void Function(int)? onPageChanged;
  const StartScreenTop({required this.onPageChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            buildBackground(constraints),
            buildImages(constraints),
          ],
        );
      }),
    );
  }

  Widget buildImages(constraints) {
    return PageView.builder(
      itemCount: imageStartScreen.length,
      onPageChanged: onPageChanged,
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
  }

  Widget buildBackground(constraints) {
    return Transform.scale(
      scale: 1.4,
      child: SizedBox(
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        child: FittedBox(
          fit: BoxFit.cover,
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: List.generate(7, (index) => 7 - index).map(
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
    );
  }
}
