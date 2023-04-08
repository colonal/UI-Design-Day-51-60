import 'package:flutter/material.dart';

import 'progress_painter.dart';

class BannerWidget extends StatefulWidget {
  final int percentage;
  const BannerWidget({required this.percentage, super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late double _percentage;

  @override
  void initState() {
    super.initState();
    _percentage = widget.percentage.toDouble();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation =
        Tween<double>(begin: 0, end: _percentage).animate(_animationController);
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .9,
      height: 138,
      decoration: BoxDecoration(
          color: const Color(0xFF8667F2),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color(0xF08667F2),
              blurRadius: 20,
              spreadRadius: -2,
            ),
          ]),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Bust your room",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 7),
                  const Text(
                    "Up to 75% more profit",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 7),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        final oldPercentage = _percentage;
                        _percentage = 10;
                        _animationController.reset();
                        _animation = Tween<double>(
                                begin: oldPercentage, end: _percentage)
                            .animate(_animationController);
                        _animationController.forward();
                      });
                    },
                    color: Colors.white,
                    height: 38,
                    minWidth: 200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: const Text(
                      "Try now",
                      style: TextStyle(
                        color: Color(0xFF8667F2),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: CustomPaint(
                      painter: ProgressPainter(percentage: _animation.value),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Center(
                          child: Text(
                            "${_percentage.toInt()}%",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
