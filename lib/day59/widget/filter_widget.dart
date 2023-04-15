import 'package:flutter/material.dart';

import '../data/data.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => FfilterWidgetState();
}

class FfilterWidgetState extends State<FilterWidget> {
  int _select = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric( vertical: 25),
        scrollDirection: Axis.horizontal,
        itemCount: filter.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              setState(() {
                _select = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              decoration: BoxDecoration(

                color:_select==index? const Color(0xFF393939):Colors.transparent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text(
                  filter[index],
                  style:  TextStyle(
                    color:_select==index? Colors.white: const Color(0xFF191D21),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
