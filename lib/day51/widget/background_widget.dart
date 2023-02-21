import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  final bool isShowShadowBottom;
  final bool isLeft;
  const BackgroundWidget(
      {required this.child,
      this.isShowShadowBottom = true,
      this.isLeft = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff110F2F),
              Color(0xff221F53),
            ]),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: !isLeft ? 0 : null,
            left: isLeft ? 0 : null,
            child: Transform.translate(
              offset: isLeft ? const Offset(-100, -60) : const Offset(50, -150),
              child: Container(
                width: size.width,
                height: isLeft ? size.height * 0.2 : size.height * .5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff2E26D6).withOpacity(0.6),
                        blurRadius: 300,
                      )
                    ]),
              ),
            ),
          ),
          if (isShowShadowBottom)
            Positioned(
              bottom: 0,
              right: size.width * 0.2,
              child: Transform.translate(
                offset: const Offset(0, 200),
                child: Container(
                  width: size.width * .6,
                  height: size.height * .3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xff6083FF),
                          blurRadius: 100,
                        )
                      ]),
                ),
              ),
            ),
          child,
        ],
      ),
    );
  }
}
