import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../data/data.dart';
import 'notification_widget.dart';

int setectFilter = 0;

class MarketWidget extends StatelessWidget {
  const MarketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildTopBar(),
          _buildFilterWidget(),
          _buildMarketsItems()
        ],
      ),
    );
  }

  Widget _buildFilterWidget() {
    return StatefulBuilder(builder: (context, setState) {
      return SizedBox(
        height: 40,
        child: ListView.separated(
          itemCount: marketsFilter.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  setectFilter = index;
                });
              },
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: setectFilter == index
                      ? const LinearGradient(
                          colors: [
                            Color(0xFF0AFF96),
                            Color(0xFF00E0FF),
                          ],
                        )
                      : null,
                ),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2F2F34),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      marketsFilter[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }

  Widget _buildMarketsItems() {
    return GridView.builder(
      itemCount: markets.length,
      padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate:  const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        mainAxisExtent: 250,
      ),
      itemBuilder: (context, index) {
        return _buildMarketsItem(index);
      },
    );
  }

  Widget _buildMarketsItem(int index) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xFF171C2B),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              markets[index].image,
              height: constraints.maxHeight * .7,
              width: constraints.maxWidth,
              fit: BoxFit.fill,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        markets[index].title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            markets[index].tag,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                  "assets/images/day56/ethereum.svg"),
                              const SizedBox(width: 4),
                              Text(
                                markets[index].tag,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          const Text(
            "Market",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const NotificationWisget(),
        ],
      ),
    );
  }
}
