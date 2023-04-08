import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  const BackgroundWidget({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        tileMode: TileMode.mirror,
        colors: [
          const Color(0xFF8667F2).withOpacity(.2),
          const Color(0xFF3A63FB).withOpacity(.2),
          const Color(0xFF8667F2).withOpacity(.2),
        ],
      )),
      child: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                width: size.width,
                height: size.height,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: size.width,
                        height: size.height * .1,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xff3A63FB).withOpacity(.3),
                              blurRadius: 70,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(-size.width * .2, -size.width * .2),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          width: size.width * .5,
                          height: size.width * .5,
                          decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                            BoxShadow(
                              color: const Color(0xffFFFFFF).withOpacity(.7),
                              blurRadius: 50,
                              spreadRadius: 1,
                            )
                          ]),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(size.width * .2, 0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: size.width,
                          height: size.height * .2,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xffFFFFFF).withOpacity(.5),
                                blurRadius: 50,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
