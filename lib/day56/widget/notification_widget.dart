import 'package:flutter/material.dart';

class NotificationWisget extends StatelessWidget {
  const NotificationWisget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: const [
        Icon(
          Icons.notifications,
          color: Colors.white,
          size: 30,
        ),
        CircleAvatar(
          radius: 8,
          backgroundColor: Color(0xFFFF002E),
          child: Center(
            child: Text(
              "5",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}
