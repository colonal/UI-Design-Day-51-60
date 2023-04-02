import 'package:flutter/material.dart';

class BennerWidget extends StatefulWidget {
  const BennerWidget({super.key});

  @override
  State<BennerWidget> createState() => _BennerWidgetState();
}

class _BennerWidgetState extends State<BennerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(_controller);
    super.initState();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0XFFEA95D0),
            Color(0XFF4D65F0),
          ],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ...List.generate(
                  4,
                  (index) => Transform.rotate(
                    angle: -0.1,
                    child: Transform.scale(
                      scale: 1.8,
                      child: Transform(
                        transform: Matrix4.rotationX(-1.1),
                        alignment: Alignment.center,
                        child: Container(
                          height: 50.0 * index,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black12)),
                        ),
                      ),
                    ),
                  ),
                ).toList(),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(_animation.value * -100, 0),
                      child: Transform.scale(
                          scale: 1.4,
                          child: Image.asset("assets/images/day55/1.png")),
                    );
                  },
                ),
              ],
            ),
          ),
           Expanded(
            child: AnimatedBuilder(
              animation:  _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(_animation.value * 100, 0),
                  child:child,
                );
                
              },
              child:const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        "50%\nOFF",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
