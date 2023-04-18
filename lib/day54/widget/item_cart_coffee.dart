import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ui_design_day_51_60/day54/data/data.dart';

class ItemCartCoffee extends StatefulWidget {
  final CartCoffee cartCoffee;
  final Function setState;
  const ItemCartCoffee(
      {required this.cartCoffee, required this.setState, super.key});

  @override
  State<ItemCartCoffee> createState() => _ItemCartCoffeeState();
}

class _ItemCartCoffeeState extends State<ItemCartCoffee> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.cartCoffee.coffee.title),
      crossAxisEndOffset: 0.2,
      dragStartBehavior: DragStartBehavior.down,
      behavior: HitTestBehavior.deferToChild,

      confirmDismiss: (direction) async{ 
        if (direction == DismissDirection.endToStart){
          widget.setState();
          return true;
        }

         return false;
      },
      background: Container(),
      secondaryBackground: Container(
        height: 96,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
      ),
      child: Container(
        height: 96,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: const Color(0xff362C36),
          borderRadius: BorderRadius.circular(15),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              children: [
                SizedBox(
                  width: constraints.maxWidth*.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      widget.cartCoffee.coffee.image,
                      height: 72,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: constraints.maxWidth*.5,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            widget.cartCoffee.coffee.filter,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.cartCoffee.coffee.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "₹${widget.cartCoffee.coffee.price}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: constraints.maxWidth*.3,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerRight,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                      color: const Color(0xff463D46),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          _buildButton(
                              icon: Icons.remove,
                              onTap: () {
                                setState(() {
                                  if (widget.cartCoffee.quantity > 0) {
                                    --widget.cartCoffee.quantity;
                                    if (widget.cartCoffee.quantity == 0) {
                                      cartCoffee.remove(widget.cartCoffee);
                                    }
                                      widget.setState();
                                  }
                                });
                              }),
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: Center(
                              child: Text(
                                widget.cartCoffee.quantity.toString(),
                                style:
                                    const TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                          _buildButton(
                              icon: Icons.add,
                              onTap: () {
                                setState(() {
                                  ++widget.cartCoffee.quantity;
                                  widget.setState();
                                });
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }

  InkWell _buildButton({required Function() onTap, required IconData icon}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xffEFE3C8),
        ),
        child: Center(
          child: Icon(icon),
        ),
      ),
    );
  }
}
