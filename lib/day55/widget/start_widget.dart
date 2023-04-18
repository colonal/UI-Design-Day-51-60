import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ui_design_day_51_60/day55/screen/home_screen.dart';

class StartButtonWidget extends StatefulWidget {
  const StartButtonWidget({super.key});

  @override
  State<StartButtonWidget> createState() => _StartButtonWidgetState();
}

class _StartButtonWidgetState extends State<StartButtonWidget> {
  bool _isDropped = false;
  GlobalKey startKey = GlobalKey();
  GlobalKey endKey = GlobalKey();
  double percentage = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    

    return Container(
      height: size.height * 0.2,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      // margin: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Container(
          height: size.height * 0.13,
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          decoration: BoxDecoration(
            color: const Color(0xffEA95D0),
            borderRadius: BorderRadius.circular(50),
            gradient:  LinearGradient(
              begin: Alignment.centerLeft, //Starting point
              end: Alignment.centerRight, //Ending point
              stops: [percentage, 0],
              colors: [ Colors.white.withOpacity(0.8),const Color(0xffEA95D0)],
            ),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Draggable(
                  data: "",
                  key: startKey,
                  feedback: _buildDroppedWidget(size),
                  child: _isDropped ? Container() : _buildDroppedWidget(size),
                  onDraggableCanceled: (velocity, offset) {
                    setState(() {
                      _isDropped = !_isDropped;
                      percentage = 0;
                    });
                    
                  },
                  onDragStarted: () {
                    setState(() {
                      _isDropped = !_isDropped;
                    });
                  },
                  
                  onDragUpdate: (details) {
                    RenderBox startBox = startKey.currentContext!.findRenderObject() as RenderBox;
                    Offset startPosition = startBox.localToGlobal(Offset.zero);

                    RenderBox endBox = endKey.currentContext!.findRenderObject() as RenderBox;
                    Offset endPosition = endBox.localToGlobal(Offset.zero);
                    
                    


                    final distancePointsStartAndCurrent =sqrt(pow((details.globalPosition.dx - startPosition.dx), 2) + pow((details.globalPosition.dy - startPosition.dy), 2));
                    
                    final distancePointsStartAndEnd =sqrt(pow((endPosition.dx - startPosition.dx), 2) + pow((endPosition.dy - startPosition.dy), 2));


                    
                    setState(() {
                      percentage = (distancePointsStartAndCurrent / distancePointsStartAndEnd) - .1;
                    });

                    
                  },
                ),
                const FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DragTarget(
                  key: endKey,
                  onAccept: (String _) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen(),));
                  },
                  builder: (BuildContext context, List<dynamic> accepted,
                      List<dynamic> rejected) {
                    return !_isDropped
                        ? Container()
                        : Opacity(
                            opacity: .4, child: _buildDroppedWidget(size));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buildDroppedWidget(Size size) {
    return Container(
      height: size.height * 0.1,
      width: 100,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.arrow_right_alt_rounded,
        color: Color(0XFF1C1D21),
        size: 40,
      ),
    );
  }
}
