import 'package:flutter/material.dart';

import '../data/data.dart';

class MusicWidget extends StatefulWidget {
  final Music music;
  const MusicWidget({required this.music, super.key});

  @override
  State<MusicWidget> createState() => _MusicWidgetState();
}

class _MusicWidgetState extends State<MusicWidget> {
  double sliderValue = 10;
  bool isPlay = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFFFFACA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFACA),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            color: Colors.black,
            icon: const Icon(Icons.file_download_outlined),
          ),
        ],
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          maxRadius: constraints.maxHeight * .218,
                          backgroundColor: const Color(0xFFFFE3D3),
                          child: CircleAvatar(
                            maxRadius: constraints.maxHeight * .21,
                            backgroundColor: const Color(0xFFFFFFFF),
                            child: CircleAvatar(
                              maxRadius: constraints.maxHeight * .2,
                              backgroundColor: const Color(0xFFFFE3D3),
                              child: ClipOval(
                                child: Image.asset("assets/images/day59/2.png"),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          widget.music.name,
                          style: const TextStyle(
                            color: Color(0xFF191D21),
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Inner Peace",
                          style: TextStyle(
                            color: Color(0xFF656F77),
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Flexible(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.skip_previous,
                                    color: Color(0xFFACB8C2),
                                    size: 40,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      isPlay = !isPlay;
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: const Color(0xFFFFE3D3),
                                    maxRadius: 40,
                                    child: Icon(
                                      isPlay
                                          ? Icons.pause
                                          : Icons.play_arrow_rounded,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.skip_next,
                                    color: Color(0xFFACB8C2),
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "15:00",
                                style: TextStyle(
                                  color: Color(0xFF656F77),
                                  fontSize: 12,
                                ),
                              ),
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                  trackHeight: 4,
                                  thumbColor: const Color(0xFFFFFACA),
                                  overlayColor:
                                      const Color(0xFFFFFACA).withOpacity(.2),
                                  thumbShape: const RoundSliderThumbShape(
                                    disabledThumbRadius: 10,
                                    enabledThumbRadius: 5,
                                  ),
                                  overlayShape: const RoundSliderOverlayShape(
                                    overlayRadius: 20,
                                  ),
                                  activeTrackColor:
                                      const Color.fromARGB(255, 250, 243, 172),
                                  inactiveTrackColor: Colors.grey,
                                ),
                                child: Slider(
                                  value: sliderValue,
                                  max: 100,
                                  min: 0,
                                  divisions: 100,
                                  onChanged: (value) {
                                    setState(() {
                                      sliderValue = value;
                                    });
                                  },
                                ),
                              ),
                              const Text(
                                "13:35",
                                style: TextStyle(
                                  color: Color(0xFF656F77),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            _buildBottomBar(size),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar(Size size) {
    return ColoredBox(
      color: Colors.white,
      child: Container(
        height: size.height * .1,
        decoration: const BoxDecoration(
          color: Color(0xFFFFE3D3),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              color: const Color(0xFF656F77),
              icon: const Icon(Icons.favorite, size: 30),
            ),
            IconButton(
              onPressed: () {},
              color: const Color(0xFF656F77),
              icon: const Icon(Icons.playlist_play_outlined, size: 30),
            ),
            IconButton(
              onPressed: () {},
              color: const Color(0xFF656F77),
              icon: const Icon(Icons.last_page_outlined, size: 30),
            ),
          ],
        ),
      ),
    );
  }
}
