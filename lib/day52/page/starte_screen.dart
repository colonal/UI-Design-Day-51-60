import 'package:flutter/material.dart';
import 'package:ui_design_day_51_60/day52/page/home_screen.dart';
import '../widget/beam_custom_painter.dart';
import '../widget/images_widget.dart';

class Day52StareScreen extends StatelessWidget {
  const Day52StareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * .08),
              const ImageStartWidget(),
              SizedBox(
                height: size.height * .41,
                width: size.width,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Keep strong",
                          style: TextStyle(
                            fontSize: 50,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeCap = StrokeCap.round
                              ..strokeWidth = 2
                              ..color = const Color(0xff141414),
                          ),
                        ),
                        const Text(
                          "body with us",
                          style: TextStyle(
                            color: Color(0xff141414),
                            fontSize: 47,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Transform.translate(
                          offset: const Offset(0, -7),
                          child: Transform.rotate(
                            angle: 270,
                            child: SizedBox(
                              width: 120,
                              height: 5,
                              child: CustomPaint(
                                painter: SignatureCustomPainter(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          "No matter how slow you go you're still lapping everyone on the couch",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff141414),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 60,
                          width: 140,
                          child: ClipRRect(
                            clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.circular(16),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const HomeScreen(),
                                ));
                              },
                              color: const Color(0xff141414),
                              child: const Text(
                                "Get Sterted",
                                style: TextStyle(
                                    color: Color(0xffFDFDFD), fontSize: 17),
                              ),
                            ),
                          ),
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
    );
  }
}
