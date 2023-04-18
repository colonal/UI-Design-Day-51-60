import 'package:flutter/material.dart';

import '../data/data.dart';

class ChooseAttackWidget extends StatefulWidget {
  final Pokemon you;
  const ChooseAttackWidget({required this.you, super.key});

  @override
  State<ChooseAttackWidget> createState() => _ChooseAttackWidgetState();
}

class _ChooseAttackWidgetState extends State<ChooseAttackWidget> {
  int _selectAttack = 0;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.you.attacks.attack.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        mainAxisExtent: 160,
      ),
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          color: _selectAttack == index
              ? widget.you.attacks.backgroundColor
              : const Color(0xFF222222),
          border: _selectAttack == index
              ? Border.all(color: widget.you.attacks.color, width: 2)
              : null,
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          onTap: (){
            setState(() {
              _selectAttack = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(child: Transform.scale(
                  scale: 1.2,
                  child: Transform.translate(
                    offset: const Offset(0,-10),
                    child: Image.asset(widget.you.attacks.attack[index].image)),
                )),
                Text(
                  widget.you.attacks.attack[index].name,
                  style: TextStyle(
                    color: _selectAttack == index
                        ? widget.you.attacks.color
                        : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
