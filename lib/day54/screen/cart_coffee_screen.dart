import 'package:flutter/material.dart';

import '../data/data.dart';
import '../widget/coupon_code_clipper.dart';
import '../widget/item_cart_coffee.dart';
import '../widget/my_separator.dart';

class CartCoffeeScreen extends StatefulWidget {
  const CartCoffeeScreen({super.key});

  @override
  State<CartCoffeeScreen> createState() => _CartCoffeeScreenState();
}

class _CartCoffeeScreenState extends State<CartCoffeeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Cart",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            ListView.separated(
              itemCount: cartCoffee.length,
              padding: const EdgeInsets.symmetric(vertical: 20),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return ItemCartCoffee(
                  cartCoffee: cartCoffee[index],
                  setState: () {
                    setState(() {});
                  },
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const MySeparator(), 
                  const SizedBox(height: 9),
                  ClipPath(
                    clipper: CouponCodeClipper(),
                    child: Container(
                      color: const Color(0xff38232A),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Apply Coupon Code",
                            style:
                                TextStyle(color: Color(0xffEFE3C8), fontSize: 15),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              color: Colors.white, size: 18),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Delivery Charges",
                        style:
                            TextStyle(color: Color(0xffEFE3C8), fontSize: 15),
                      ),
                      Text(
                        "₹49",
                        style:
                            TextStyle(color: Color(0xffEFE3C8), fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Taxes",
                        style:
                            TextStyle(color: Color(0xffEFE3C8), fontSize: 15),
                      ),
                      Text(
                        "₹64.87",
                        style:
                            TextStyle(color: Color(0xffEFE3C8), fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  const MySeparator(), 
                  const SizedBox(height: 7),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Grand Total",
                        style:
                            TextStyle(color: Color(0xffEFE3C8), fontSize: 20),
                      ),
                      Text(
                        "₹${_getPrise()}",
                        style: const TextStyle(
                            color: Color(0xffEFE3C8), fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  MaterialButton(
                    onPressed: () {},
                    minWidth: MediaQuery.of(context).size.width *.8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    color: const Color(0xffEFE3C8),
                    child: const Text("PAY NOW", style: TextStyle(color: Color(0xff4A2B29), fontSize: 16),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _getPrise() {
    double total = 0;
    for (var element in cartCoffee) {
      total += (element.quantity * element.coffee.price);
    }

    return total;
  }
}



