import 'package:flutter/material.dart';

import '../data/data.dart';

class FilterCoffeesWidget extends StatefulWidget {
  const FilterCoffeesWidget({super.key});

  @override
  State<FilterCoffeesWidget> createState() => FfilterCoffeesWidgetState();
}

class FfilterCoffeesWidgetState extends State<FilterCoffeesWidget> {
  int selectFilter = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: 40,
        height: size.height * .7,
        decoration: const BoxDecoration(
            color: Color(0xff704341),
            borderRadius: BorderRadius.only(topRight: Radius.circular(60))),
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 20),
          itemCount: filterCoffees.length,
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemBuilder: (context, index) => RotatedBox(
            quarterTurns: 3,
            child: Center(
              child: InkWell(
                onTap: (){
                  setState(() {
                    selectFilter = index;
                  });
                },
                child: Text(
                  filterCoffees[index],
                  style:  TextStyle(color: selectFilter == index?const Color(0xffE4D7BE) :const Color(0xff938379), fontSize: 18),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
