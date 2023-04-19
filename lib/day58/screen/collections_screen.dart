// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../data/data.dart';
import '../widget/slider_component_shape.dart';
import '../widget/slider_component_shape1.dart';


class CollectionsScreen extends StatefulWidget {
  const CollectionsScreen({super.key});

  @override
  State<CollectionsScreen> createState() => _CollectionsScreenState();
}

class _CollectionsScreenState extends State<CollectionsScreen> {
  int _currentSliderValue = 2;
  int _selectNike = 0;
  SliderComponentShape? thumbShape;
  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void load() {
    getUiImage("assets/images/day58/sliderImage.png", 30, 30).then((value) {
      thumbShape = ImageSliderThumbCircle(image: value);
      setState(() {});
    });
  }

  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    _selectShose(),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: size.height*.35,
                      child: Transform.translate(
                          offset: const Offset(0, 20),
                          child: Image.asset(
                              nike[_selectNike][_currentSliderValue])),
                    ),
                    Center(
                      child: Container(
                        height: 70,
                        width: size.width * .7,
                        color: Colors.transparent,
                        child: SliderTheme(
                          data: SliderThemeData(
                            trackHeight: 8,
                            thumbShape: thumbShape,
                            trackShape: const CustomTrackShape(),
                            overlayColor: Colors.transparent,
                            inactiveTrackColor: const Color(0xFF37C7AA),
                            activeTrackColor: const Color(0xFF37C7AA),
                          ),
                          child: Slider(
                            value: _currentSliderValue.toDouble(),
                            min: 0.0,
                            max: 4,
                            onChanged: (newValue) {
                              setState(() {
                                _currentSliderValue = newValue.toInt();
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                _buildInfoWidget(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoWidget(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "Zoom Freak",
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: Color(0xFF122A2F),
            ),
          ),
        ),
        const SizedBox(height: 7),
        const FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            "Basketball Shoes",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Color(0xFF122A2F),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          """There has never been a player like Giannis. His freakishly athletic game combines massive strides,""",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: Color(0xFF122A2F),
          ),
        ),
        const SizedBox(height: 10),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: SizedBox(
            width: size.width,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Price",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF122A2F),
                          ),
                        ),
                        Text(
                          "\$180",
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF122A2F),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        _buildCircleWidget(
                          colors: [
                            const Color(0xa9122A2F),
                            const Color(0xFF122A2F),
                          ],
                          child: Center(
                            child: SvgPicture.asset(
                                "assets/images/day58/icon1.svg"),
                          ),
                        ),
                        const SizedBox(width: 10),
                        _buildCircleWidget(
                          colors: [
                            const Color(0xFF2DB398),
                            const Color(0x9F00261F),
                          ],
                          child: Stack(
                            children: [
                              Center(
                                child: SvgPicture.asset(
                                    "assets/images/day58/icon2.svg"),
                              ),
                              Transform.translate(
                                offset: const Offset(-10, -15),
                                child: const Align(
                                  alignment: Alignment.centerRight,
                                  child: CircleAvatar(
                                    radius: 6,
                                    backgroundColor: Color(0xFFECB903),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCircleWidget(
      {required List<Color> colors, required Widget child}) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: colors,
        ),
      ),
      child: child,
    );
  }

  Widget _selectShose() {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemCount: nike.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 20),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              _selectNike = index;
            });
          },
          child: Container(
            width: 90,
            height: 80,
            decoration: BoxDecoration(
              color: _selectNike == index
                  ? const Color(0xFFECB903)
                  : const Color(0xFFF3F3F3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                nike[index][2],
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const CircleAvatar(
            backgroundColor: Color(0xFFF3F3F3),
            child: Center(
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      centerTitle: true,
      title: SvgPicture.asset(
        "assets/images/day58/shoes.svg",
        color: Colors.black,
        // width: 60,
        // height: 18,
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Color(0xFFF3F3F3),
            child: Center(
              child: Icon(
                Icons.more_vert_outlined,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
