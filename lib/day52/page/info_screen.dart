import 'package:flutter/material.dart';
import 'package:ui_design_day_51_60/day52/data/data.dart';
import 'package:ui_design_day_51_60/day52/widget/beam_custom_painter.dart';

class InfoScreen extends StatelessWidget {
  final NearbYouModel item;
  const InfoScreen({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    Color color = const Color(0xFF141414);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                child: SizedBox(
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            border: Border.all(color: color.withOpacity(.5)),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Transform.translate(
                            offset: const Offset(4, 0),
                            child: Center(
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: color.withOpacity(.5),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      Stack(
                        children: [
                          Transform.rotate(
                              angle: 0.13962634015954636,
                              child: _buildImage(
                                  size, color, "assets/images/day52/9.png")),
                          _buildImage(size, color, "assets/images/day52/8.png"),
                          Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: Transform.translate(
                              offset: const Offset(10, -50),
                              child: Transform.rotate(
                                angle: 70,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: size.width * .05),
                                  child: SizedBox(
                                    width: 60,
                                    height: 50,
                                    child: CustomPaint(
                                      painter: BeamCustomPainter(),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      LayoutBuilder(
                        builder: (context,constraints) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: constraints.maxWidth *.6,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    item.subject,
                                    style: TextStyle(
                                      fontSize: 32,
                                      color: color,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: constraints.maxWidth *.4,
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    item.time,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff5C5C5C),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Flexible(
                            child: Text(
                              "Reviews",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff5C5C5C),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: Text(
                                    "4.5",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: color,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Icon(Icons.star, color: Colors.amber),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SizedBox(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Transform.translate(
                                offset: Offset(
                                    -(imageFace.length > 3
                                            ? 3
                                            : imageFace.length) *
                                        15,
                                    0),
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (imageFace.length > 3)
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.black,
                                          child: Text(
                                            "+${imageFace.length - 3}",
                                            style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ...imageFace
                                          .asMap()
                                          .entries
                                          .map(
                                            (entry) {
                                              int idx = entry.key + 1;
                                              String val = entry.value;
                                              return Transform.translate(
                                                offset: Offset(idx * 15, 0),
                                                child: CircleAvatar(
                                                  radius: 20,
                                                  backgroundImage:
                                                      NetworkImage(val),
                                                ),
                                              );
                                            },
                                          )
                                          .take(3)
                                          .toList()
                                    ],
                                  ),
                                ),
                              ),
                              const Text(
                                "See all",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff5C5C5C),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Address",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff5C5C5C),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Tori H wilson 12, 1289",
                        style: TextStyle(
                          fontSize: 18,
                          color: color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "About us",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff5C5C5C),
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffADADAD),
                        ),
                      ),
                      const SizedBox(height: 90),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: size.width,
                  height: 80,
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white.withOpacity(.7),
                  child: MaterialButton(
                    color: color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "View schedule",
                      style: TextStyle(fontSize: 20, color: Colors.white),
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

  Align _buildImage(Size size, Color color, String image) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 210,
        width: size.width * .8,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
        ),
      ),
    );
  }
}
