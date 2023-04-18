import 'package:flutter/material.dart';
import 'package:ui_design_day_51_60/day60/data/data.dart';
import 'package:ui_design_day_51_60/day60/screen/battleground_screen.dart';

class SwipeUpWidget extends StatefulWidget {
  final int index;
  const SwipeUpWidget({required this.index, super.key});

  @override
  State<SwipeUpWidget> createState() => _SwipeUpWidgetState();
}

class _SwipeUpWidgetState extends State<SwipeUpWidget> {
  bool isDrag = false;

  @override
  void dispose() {
    isDrag = false;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Center(
                  child: Container(
                    width: 50,
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(.2),
                          blurRadius: 20,
                          spreadRadius: -1,
                          offset: const Offset(0, 10)
                        )
                      ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DragTarget(
                            onAccept: (data) => Navigator.of(context).push(MaterialPageRoute(builder: (context) => BattlegroundScreen(you: pokemon[widget.index]))),
                            builder: (context, candidateData, rejectedData) =>
                              isDrag?Opacity(
                                    opacity: .5,
                                    child: _pokemonImage(),
                                  ):  const Icon(
                              Icons.keyboard_arrow_up_outlined,
                              color: Colors.black,
                            ),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_up_outlined,
                            color: Colors.black87,
                          ),
                          const Icon(
                            Icons.keyboard_arrow_up_outlined,
                            color: Colors.black45,
                          ),
                          const Icon(
                            Icons.keyboard_arrow_up_outlined,
                            color: Colors.black12,
                          ),
                          Draggable(
                            data: "",
                            onDragStarted: () {
                              setState(() {
                                isDrag = true;
                              });
                            },
                            onDragEnd: (details) {
                              setState(() {
                                isDrag = false;
                              });
                            },
                            feedback: _pokemonImage(),
                            child: isDrag
                                ? Container()
                                : _pokemonImage(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Swipe Up to select",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(height: constraints.maxHeight * .1),
          ],
        );
      }),
    );
  }

  Transform _pokemonImage() {
    return Transform.scale(
      scale: 1.2,
      child: Image.asset(
        "assets/images/day60/pokemon.png",
      ),
    );
  }
}
