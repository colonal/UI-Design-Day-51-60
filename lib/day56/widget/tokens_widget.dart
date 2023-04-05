import 'package:flutter/material.dart';
import 'package:ui_design_day_51_60/day56/widget/digital_currency_chart_widget.dart';

import '../data/data.dart';

class TokensWidget extends StatelessWidget {
  const TokensWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      itemCount: tokens.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) =>
          const Divider(color: Colors.white30),
      itemBuilder: (context, index) {
        return SizedBox(
          height: 50,
          child: Row(
            children: [
              Row(
                children: [
                  Image.asset(
                    tokens[index].image,
                    width: 45,
                    height: 45,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tokens[index].subName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        tokens[index].name,
                        style: const TextStyle(
                          color: Color(0xFFA0A0A0),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Expanded(
                child:  LayoutBuilder(
                  builder: (BuildContext context,BoxConstraints constraints) {
                    return FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: constraints.maxWidth *.5,
                            height: constraints.maxHeight,
                            child: Center(child: DigitalCurrencyChart(tokens: tokens[index]))),
                        ],
                      ),
                    );
                  }
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    tokens[index].prise,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    tokens[index].rate,
                    style: TextStyle(
                      color: tokens[index].state == TokensState.up
                          ? const Color(0xFF0AFF96)
                          : const Color(0xFFFF002E),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
