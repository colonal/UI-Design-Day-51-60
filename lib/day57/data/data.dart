// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widget/home_widget.dart';

class Room {
  final String title;
  final String name;
  final String image;
  final String lastMessage;
  final String time;
  final int count;
  final int view;
  final int pepole;
  final List<String> images;
  final List<Message> messages;
  Room({
    required this.title,
    required this.name,
    required this.image,
    required this.lastMessage,
    required this.time,
    required this.count,
    required this.view,
    required this.pepole,
    required this.images,
    required this.messages,
  });
}

List<Room> rooms = [
  Room(
    title: "Purple haze",
    name: "Esther Howard",
    image:
        "https://images.unsplash.com/photo-1611265023526-707d240623af?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTh8fFB1cnBsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
    lastMessage: "I posted a new video on YouTub",
    time: "11:36",
    count: 2,
    view: 8936,
    pepole: 14,
    images: [
      "https://images.unsplash.com/photo-1680763921539-afae7b2c219e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1Mnx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1680669158867-cc840299ec33?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4OXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1680728841730-481c20899554?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1N3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1680618051492-9f2b51e1642c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNDJ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      "https://plus.unsplash.com/premium_photo-1666265384443-5edc1b9c5831?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMDB8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1630169882874-532167e6c492?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDV8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    ],
    messages: messages,
  ),
  Room(
    title: "BIDMAS",
    name: "Ronald Richards",
    image:
        "https://images.unsplash.com/photo-1603683402476-f7a1cadccb0e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXRodW1ibmFpbHx8dEZQWHo3VHhTaUl8fGVufDB8fHx8&dpr=1&auto=format&fit=crop&w=294&q=60",
    lastMessage: "I posted a new video on YouTub",
    time: "11:20",
    count: 2,
    view: 8936,
    pepole: 14,
    images: [
      "https://images.unsplash.com/photo-1630169882874-532167e6c492?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDV8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      "https://plus.unsplash.com/premium_photo-1666265384443-5edc1b9c5831?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMDB8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1680763921539-afae7b2c219e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1Mnx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1680728841730-481c20899554?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1N3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
    ],
    messages: messages,
  ),
  Room(
    title: "Fanboys connectives",
    name: "Marvin McKinney",
    image:
        "https://images.unsplash.com/photo-1653256112684-2fdf4991c0f5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXRodW1ibmFpbHx8MjMxMDExOHx8ZW58MHx8fHw%3D&dpr=1&auto=format&fit=crop&w=294&q=60",
    lastMessage: "Love to watch our great game",
    time: "11:16",
    count: 0,
    view: 2136,
    pepole: 14,
    images: [
      "https://plus.unsplash.com/premium_photo-1666265384443-5edc1b9c5831?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMDB8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1630169882874-532167e6c492?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDV8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1680728841730-481c20899554?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1N3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1680763921539-afae7b2c219e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1Mnx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
    ],
    messages: messages,
  ),
  Room(
    title: "BIDMAS",
    name: "Ronald Richards",
    image:
        "https://images.unsplash.com/photo-1550047849-607ede6975fe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8OXwyMzEwMTE4fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    lastMessage: "Love to watch our great game",
    time: "10:26",
    count: 0,
    view: 2136,
    pepole: 14,
    images: [
      "https://plus.unsplash.com/premium_photo-1666265384443-5edc1b9c5831?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMDB8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1630169882874-532167e6c492?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDV8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1680728841730-481c20899554?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1N3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1680763921539-afae7b2c219e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1Mnx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
    ],
    messages: messages,
  ),
];

class NavigationBarModel {
  final Widget child;
  final BottomNavigationBarItem bottomNavigationBarItem;

  NavigationBarModel(
      {required this.child, required this.bottomNavigationBarItem});
}

Iterable<NavigationBarModel> bottomNavigationBarItem(int select) {
  return [
    NavigationBarModel(
      child: const HomeWidget(),
      bottomNavigationBarItem: BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/images/day57/icon1.svg",
          color:
              select == 0 ? const Color(0xFF8667F2) : const Color(0xFF8C8098),
        ),
        label: "",
      ),
    ),
    NavigationBarModel(
      child: Container(),
      bottomNavigationBarItem: BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/images/day57/icon2.svg",
          color:
              select == 1 ? const Color(0xFF8667F2) : const Color(0xFF8C8098),
        ),
        label: "",
      ),
    ),
    NavigationBarModel(
      child: Container(),
      bottomNavigationBarItem: BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/images/day57/icon3.svg",
          color:
              select == 2 ? const Color(0xFF8667F2) : const Color(0xFF8C8098),
        ),
        label: "",
      ),
    ),
    NavigationBarModel(
      child: Container(),
      bottomNavigationBarItem: BottomNavigationBarItem(
        icon: SvgPicture.asset(
          "assets/images/day57/icon4.svg",
          color:
              select == 3 ? const Color(0xFF8667F2) : const Color(0xFF8C8098),
        ),
        label: "",
      ),
    ),
  ];
}

class Classification {
  final String name;
  final String img;
  Classification({
    required this.name,
    required this.img,
  });
}

List<Classification> classification = [
  Classification(name: "Animals", img: "assets/images/day57/img1.jpg"),
  Classification(name: "Nature", img: "assets/images/day57/img2.jpg"),
  Classification(name: "Entertainment", img: "assets/images/day57/img3.jpg"),
];

class Message {
  final String id;
  final String cover;
  final String message;
  final String view;
  final int like;
  final String time;
  final String name;
  final MessagesType messageType;
  final bool me;
  Message({
    required this.id,
    required this.cover,
    required this.message,
    required this.view,
    required this.like,
    required this.time,
    required this.name,
    required this.messageType,
    required this.me,
  });
}

enum MessagesType {
  text,
  image,
}

List<Message> messages = [
  Message(
    id: "1",
    cover:
        "https://images.unsplash.com/photo-1680763921539-afae7b2c219e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1Mnx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
    message:
        "https://plus.unsplash.com/premium_photo-1671751033625-46175f2eb03d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fFB1cnBsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
    view: "1.6K",
    like: 110,
    time: "12:00",
    name: "Jenny Wilson",
    messageType: MessagesType.image,
    me: false,
  ),
  Message(
    id: "1",
    cover:
        "https://images.unsplash.com/photo-1680763921539-afae7b2c219e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1Mnx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
    message:
        "I want to share with you a photo of my plant that I took today. I hope you will like it😅🌸",
    view: "1.6K",
    like: 110,
    time: "12:00",
    name: "Jenny Wilson",
    messageType: MessagesType.text,
    me: false,
  ),
  
  Message(
    id: "2",
    cover:
        "https://images.unsplash.com/photo-1680669158867-cc840299ec33?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4OXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
    message:
        "https://images.unsplash.com/photo-1482686115713-0fbcaced6e28?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fFB1cnBsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
    view: "1.6K",
    like: 110,
    time: "12:00",
    name: "Cameron Williamson",
    messageType: MessagesType.image,
    me: false,
  ),
   Message(
    id: "3",
    cover:
        "https://images.unsplash.com/photo-1680728841730-481c20899554?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1N3x8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60",
    message:
        "I want to share with you a photo of my plant that I took today. I hope you will like it😅🌸",
    view: "1.6K",
    like: 110,
    time: "12:00",
    name: "Jenny Wilson",
    messageType: MessagesType.text,
    me: true,
  ),
];


