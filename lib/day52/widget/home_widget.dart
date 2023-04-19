import 'package:flutter/material.dart';
import 'package:ui_design_day_51_60/day52/data/data.dart';
import 'package:ui_design_day_51_60/day52/page/info_screen.dart';
import 'package:ui_design_day_51_60/day52/widget/beam_custom_painter.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  static int selectIndex = -1;

  @override
  Widget build(BuildContext context) {
    Color color = const Color(0xFF141414);
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform.translate(
                    offset: const Offset(-10, 0), child: _buildIconDrow()),
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: color.withOpacity(.5)),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    padding: const EdgeInsets.all(4),
                    child: const Icon(Icons.notifications_none_outlined),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Discover new",
              style: TextStyle(fontSize: 24, color: color),
            ),
            const SizedBox(height: 15),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                children: [
                  Text(
                    "Fitness Studios",
                    style: TextStyle(
                      fontSize: 32,
                      color: color,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(-20, -23),
                    child: Transform.rotate(
                      angle: 70,
                      child: Padding(
                        padding: EdgeInsets.only(left: size.width * .05),
                        child: SizedBox(
                          width: 40,
                          height: 30,
                          child: CustomPaint(
                            painter: BeamCustomPainter(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 30,
              width: size.width * .8,
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: "Search",
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              "Nearby you",
              style: TextStyle(
                fontSize: 32,
                color: color,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 30),
            StatefulBuilder(builder: (context, setState) {
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: nearbYouList.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemBuilder: (context, index) =>
                    _buildWidget(context, index, setState),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildWidget(
      context, int index, void Function(void Function()) setState) {
    Color color = const Color(0xFF141414);
    NearbYouModel item = nearbYouList[index];
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => InfoScreen(item: item)));
      },
      borderRadius: BorderRadius.circular(20),
      hoverColor: item.splashColor,
      splashColor: item.splashColor,
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(8),
        child: LayoutBuilder(
          builder: (context,constraints) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: constraints.maxWidth *.3,
                  child: Container(
                    height: 90,
                    width: 120,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: color),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(item.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                   width: constraints.maxWidth *.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.subject,
                        style: TextStyle(
                          fontSize: 20,
                          color: color,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item.time,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xff5C5C5C),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                   width: constraints.maxWidth *.1,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          item.isMark = !item.isMark;
                        });
                      },
                      icon: Icon(
                        item.isMark ? Icons.bookmark : Icons.bookmark_outline,
                        color: color,
                      ),
                    ),
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }

  Widget _buildIconDrow() {
    return InkWell(
      onTap: () {},
      customBorder: const CircleBorder(),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          height: 20,
          width: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildItneIcon(12),
              _buildItneIcon(24),
              _buildItneIcon(12),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildItneIcon(double width) {
    return Container(
      height: 3,
      width: width,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
