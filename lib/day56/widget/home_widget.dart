import 'package:flutter/material.dart';

import 'circle_icon_widget.dart';
import 'classification_widget.dart';
import 'notification_widget.dart';

int selectDropdownButton = 1;

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildTopBar(),
          _buildWalletBalance(),
          const SizedBox(height: 20),
          _buildButtonMoney(),
          const SizedBox(height: 20),
          const ClassificationWidget(),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Row _buildButtonMoney() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        CircleIconWidget(
            color: Color(0xFF2A3547),
            image: "assets/images/day56/money-send.svg",
            lable: "Send"),
        CircleIconWidget(image: "assets/images/day56/add.svg", lable: "Buy"),
        CircleIconWidget(
            color: Color(0xFF2A3547),
            image: "assets/images/day56/money-recive.svg",
            lable: "Receive")
      ],
    );
  }

  Widget _buildWalletBalance() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Current Wallet Balance",
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        StatefulBuilder(builder: (context, setState) {
          return DropdownButton(
            value: selectDropdownButton,
            onChanged: (value) {
              setState(() {
                selectDropdownButton = value!;
              });
            },
            borderRadius: BorderRadius.circular(20),
            underline: Container(),
            dropdownColor: const Color(0xFF0F111E),
            icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white60),
            iconSize: 25,
            items: const [
              DropdownMenuItem(
                value: 1,
                child: Text(
                  "\$ 5,323.00",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600),
                ),
              ),
              DropdownMenuItem(
                value: 2,
                child: Text(
                  "\$ 1,423.00",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          );
        }),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xFF2F2F34),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                "BTC : 0,00335",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.arrow_drop_up,
                color: Color(0xff00FFA3),
              ),
              SizedBox(width: 5),
              Text(
                "+6.54%",
                style: TextStyle(
                  color: Color(0xff00FFA3),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 55,
                height: 55,
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF0AFF96),
                      Color(0xFF00E0FF),
                    ],
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF0F111E),
                  ),
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1597223557154-721c1cecc4b0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZmFjZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60"),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                "Account_1",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const NotificationWisget(),
        ],
      ),
    );
  }
}
