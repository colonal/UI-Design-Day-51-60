import 'package:flutter/material.dart';

import '../data/data.dart';
import 'nfts_widget.dart';
import 'tokens_widget.dart';

class ClassificationWidget extends StatefulWidget {
  const ClassificationWidget({super.key});

  @override
  State<ClassificationWidget> createState() => CclassificationStateWidget();
}

class CclassificationStateWidget extends State<ClassificationWidget> {
  ClassificationItem selectClassification = ClassificationItem(
      child: const TokensWidget(), state: Classification.tokens);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.width * .7,
          height: 40,
          decoration: BoxDecoration(
              color: const Color(0xff212436),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildClassificationLable(
                  "Tokens",
                  ClassificationItem(
                      child: const TokensWidget(),
                      state: Classification.tokens)),
              _buildClassificationLable(
                  "NFTs",
                  ClassificationItem(
                      child: const NftsWidget(), state: Classification.nft)),
            ],
          ),
        ),
        selectClassification.child
      ],
    );
  }

  Widget _buildClassificationLable(
      String text, ClassificationItem classification) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectClassification = classification;
          });
        },
        child: AnimatedContainer(
          duration: Duration(
              milliseconds: classification == selectClassification ? 500 : 0),
          margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
          decoration: BoxDecoration(
            color: classification.state == selectClassification.state
                ? const Color(0xff3B3F58)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: classification.state == selectClassification.state
                    ? const Color(0xFFE9E9E9)
                    : const Color(0xFF7C7D82),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
