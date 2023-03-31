import 'package:flutter/material.dart';
import 'package:ui_design_day_51_60/day54/screen/cart_coffee_screen.dart';

import '../widget/home_widget.dart';

class Coffee {
  String image;
  String title;
  double price;
  double evaluation;
  String filter;
  String description;
  List<String> choiceOfMilk;
  bool isFaverit;
  bool isCart;
  Coffee({
    required this.image,
    required this.title,
    required this.price,
    required this.evaluation,
    required this.filter,
    required this.description,
    required this.choiceOfMilk,
    this.isFaverit = false,
    this.isCart = false,
  });
}

List<Coffee> coffees = [
  Coffee(
    image: "assets/images/day54/2.png",
    title: "Cinnamon & Cocoa",
    filter: filterCoffees[0],
    description:
        "A single espresso shot poured into hot foamy milk, with the surface topped with mildly sweetened cocoa powder and drizzled with scrumptious caramel syrup",
    choiceOfMilk: choiceOfMilk,
    price: 199,
    evaluation: 4.5,
  ),
  Coffee(
    image: "assets/images/day54/3.png",
    title: "Drizzled with Caramel",
    filter: filterCoffees[1],
    description:
        "A single espresso shot poured into hot foamy milk, with the surface topped with mildly sweetened cocoa powder and drizzled with scrumptious caramel syrup",
    choiceOfMilk: choiceOfMilk,
    price: 249,
    evaluation: 4.5,
  ),
  Coffee(
    image: "assets/images/day54/4.png",
    title: "Bursting Blueberry",
    filter: filterCoffees[2],
    description:
        "A single espresso shot poured into hot foamy milk, with the surface topped with mildly sweetened cocoa powder and drizzled with scrumptious caramel syrup",
    choiceOfMilk: choiceOfMilk,
    price: 279,
    evaluation: 4.9,
  ),
  Coffee(
    image: "assets/images/day54/5.png",
    title: "Dalgona Whipped Macha",
    filter: filterCoffees[3],
    description:
        "A single espresso shot poured into hot foamy milk, with the surface topped with mildly sweetened cocoa powder and drizzled with scrumptious caramel syrup",
    choiceOfMilk: choiceOfMilk,
    price: 299,
    evaluation: 4.9,
  ),
];

List<String> filterCoffees = [
  "Cappuccino",
  "Latte",
  "Americano",
  "Flat White",
];
List<String> choiceOfMilk = [
  "Oat Milk",
  "Soy Milk",
  "Almond Milk",
];

class NavigationBarModel {
  final Widget child;
  final BottomNavigationBarItem bottomNavigationBarItem;

  NavigationBarModel(
      {required this.child, required this.bottomNavigationBarItem});
}

final List<NavigationBarModel> widgetOptions = [
  NavigationBarModel(
    child: const HomeWidget(),
    bottomNavigationBarItem:
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
  ),
  NavigationBarModel(
    child: const CartCoffeeScreen(),
    bottomNavigationBarItem: const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart), label: ""),
  ),
  NavigationBarModel(
    child: Container(),
    bottomNavigationBarItem:
        const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
  ),
  NavigationBarModel(
    child: Container(),
    bottomNavigationBarItem: const BottomNavigationBarItem(
        icon: Icon(Icons.notifications), label: ""),
  ),
];

class CartCoffee {
  final Coffee  coffee;
  int quantity;
  
  CartCoffee({
    required this.coffee,
    required this.quantity,
  });
}

List<CartCoffee> cartCoffee = [
  CartCoffee(coffee: coffees[0], quantity: 1),
  CartCoffee(coffee: coffees[1], quantity: 2),
  CartCoffee(coffee: coffees[2], quantity: 1),
];