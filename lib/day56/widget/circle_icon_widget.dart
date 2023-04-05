// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircleIconWidget extends StatelessWidget {
  final String image;
  final String lable;
  final Color? color;
  final void Function()? onTap;
  const CircleIconWidget(
      { this.color,
      required this.image,
      required this.lable,
      this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration:  BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              gradient:color != null?null:const LinearGradient(
                colors: [
                  Color(0xff0061FF),
                  Color(0xff6100FF),
                ],
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                image,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            lable,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
