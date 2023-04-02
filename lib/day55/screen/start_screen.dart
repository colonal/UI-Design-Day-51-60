import 'package:flutter/material.dart';

import '../widget/start_widget.dart';

class StartScreenDay55 extends StatelessWidget {
  const StartScreenDay55({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0XFF1C1D21),
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.35,
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Transform.translate(
                      offset: const Offset(25, 20),
                      child: const Text.rich(
                        TextSpan(
                            text: "G",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: "8B",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Color(0xffEA95D0),
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: "iryani",
                              )
                            ]),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/images/day55/1.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.4,
                child: Transform.translate(
                  offset: const Offset(0, 20),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * .1, vertical: 10),
                    child: const FittedBox(
                      fit: BoxFit.fill,
                      alignment: Alignment.center,
                      child: Text.rich(
                        TextSpan(
                            text: "Cooking\n",
                            style: TextStyle(
                                fontSize: 30,
                                color: Color(0xffEA95D0),
                                fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: "experience\n",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: "like a chef\n",
                              )
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
              const StartButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
