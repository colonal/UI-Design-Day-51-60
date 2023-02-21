import 'package:flutter/material.dart';
import '../widget/background_widget.dart';
import '../data/data.dart';
import '../widget/custom_painting.dart';
import '../widget/show_image_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundWidget(
        isShowShadowBottom: false,
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: size.height * .3,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/day51/3.3.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Color(
                                0xff110F2F,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, 20),
                      child: FittedBox(
                        child: SizedBox(
                          height: 100,
                          width: 90,
                          child: CustomPaint(
                            painter: ImageProfilePainter(),
                            child: ClipPath(
                              clipBehavior: Clip.antiAlias,
                              clipper: BackgroundClipper(),
                              child: ColoredBox(
                                color: Colors.teal,
                                child: Image.network(
                                  profile[0],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SizedBox(
                    height: 50,
                    child: Text(
                      profile[1],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: SizedBox(
                    height: 50,
                    child: Text(
                      profile[2],
                      style: const TextStyle(
                        color: Color(0xffFFA14A),
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                _buildText(profile[3], profile[4], size, isBold: true),
                _buildText(profile[5], "${profile[6]} ETH", size),
                const SizedBox(height: 40),
                Container(
                  height: 300,
                  clipBehavior: Clip.antiAlias,
                  alignment: Alignment.topLeft,
                  decoration: const BoxDecoration(),
                  child: Transform.translate(
                    offset: Offset(-size.width * 0.15, 0),
                    child: Transform.translate(
                      offset: Offset(
                          profileImage.length * 25, profileImage.length * 10),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          ...List.generate(
                            profileImage.length,
                            (index) => Dismissible(
                              key: Key(DateTime.now().toIso8601String()),
                              onDismissed: (direction) {
                                setState(() {
                                  profileImage.insert(
                                      0, profileImage.removeAt(index));
                                });
                              },
                              child: Transform.translate(
                                offset: Offset(index * -25, index * -10),
                                child: SizedBox(
                                  height: 250,
                                  child: ShowImageWidget(
                                    image: profileImage[index],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildText(String textLeft, String textRight, Size size,
      {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        height: 50,
        width: size.width,
        child: Row(
          children: [
            Flexible(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  textLeft,
                  style: TextStyle(
                    color: Colors.white.withOpacity(isBold ? 1 : 0.7),
                    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Flexible(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  textRight,
                  style: TextStyle(
                    color: Colors.white.withOpacity(isBold ? 1 : 0.7),
                    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
