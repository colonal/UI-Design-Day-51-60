import 'package:flutter/material.dart';
import 'package:ui_design_day_51_60/day59/screen/music_widget.dart';

import '../data/data.dart';
import '../widget/filter_widget.dart';

int count = 0;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Center(
          child: Container(
            width: 32,
            height: 32,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: const Color(0xFFFFE8EC),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              "assets/images/day59/leaves.png",
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        title: const Text(
          "Hi, Martha",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF191D21),
          ),
        ),
        actions: const [
          Icon(
            Icons.menu_rounded,
            size: 30,
            color: Color(0xFF191D21),
          ),
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const FilterWidget(),
                _buildBanner(context,size),
                const SizedBox(height: 15),
                ListView.separated(
                  itemCount: (music.length / 2).ceil(),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    return FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildItem(
                            context,
                            size,
                            index * 2,
                          ),
                          const SizedBox(width: 20),
                          _buildItem(
                            context,
                            size,
                            index * 2 + 1,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBanner(BuildContext context, Size size) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MusicWidget(music: banner),));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        width: size.width,
        height: 150,
        decoration: BoxDecoration(
          color: banner.color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    banner.name,
                    style: const TextStyle(
                      color: Color(0xFF191D21),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "${banner.time} min",
                      style: const TextStyle(
                        color: Color(0xFF191D21),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Image.asset(
                banner.image,
                fit: BoxFit.fitHeight,
                filterQuality: FilterQuality.high,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context,Size size, int index) {
    count += index + 0 % 2;
    return index > music.length - 1
        ? Container()
        : FittedBox(
          fit: BoxFit.scaleDown,
          child: InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MusicWidget(music: music[index]),))
            ;},
            child: Transform.translate(
                offset: Offset(0, index == 1 ?0:( count % 2 != 1) || ( index % 2 != 0)? 0:-40),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    width: size.width * .4,
                    height: count % 2 != 1 ? 150 : 200,
                    decoration: BoxDecoration(
                      color: music[index].color,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            music[index].name,
                            style: const TextStyle(
                              color: Color(0xFF191D21),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "${music[index].time} min",
                              style: const TextStyle(
                                color: Color(0xFF191D21),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              music[index].image,
                              fit: BoxFit.fitHeight,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ),
        );
  }
}
