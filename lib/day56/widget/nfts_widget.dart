import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_design_day_51_60/day56/data/data.dart';

class NftsWidget extends StatelessWidget {
  const NftsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      itemCount: nfts.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) =>
          const Divider(color: Colors.white30),
      itemBuilder: (context, index) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: constraints.minWidth*.5,
                  child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Image.asset(
                            nfts[index].image,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nfts[index].tag,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              nfts[index].name,
                              style: const TextStyle(
                                  color: Color(0xFFA0A0A0),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: constraints.minWidth*.5,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset("assets/images/day56/ethereum.svg"),
                            const SizedBox(width: 5),
                            Text(
                              nfts[index].eth.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_drop_up_outlined,
                              color: nfts[index].state == TokensState.up
                                  ? const Color(0xFF0AFF96)
                                  : const Color(0xFFFF002E),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              "\$${nfts[index].price}",
                              style: TextStyle(
                                  color: nfts[index].state == TokensState.up
                                      ? const Color(0xFF0AFF96)
                                      : const Color(0xFFFF002E),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        );
      },
    );
  }
}
