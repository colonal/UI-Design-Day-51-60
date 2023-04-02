class Food {
  final String image;
  final String title;
  final String description;
  final double price;
  final double evaluation;
  final List<String> types;
  final List<String> sizes;
  Food({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.evaluation,
    required this.types,
    required this.sizes,
  });
}

String description =
    "Hyderabadi biryani is a style of biryani originating from Hyderabad, India made with basmati rice and meat. Originating in the kitchens of the Nizam of Hyderabad, it combines elements of Hyderabadi and Mughlai";
List<Food> foods = [
  Food(
      image: "assets/images/day55/3.png",
      title: "Awadhi biryani",
      description: description,
      price: 460,
      evaluation: 4.1,
      types: ["Herbs", "Chilli"],
      sizes: ["1kg", "2kg", "3kg"]),
  Food(
      image: "assets/images/day55/4.png",
      title: "Lucknowi biryani",
      description: description,
      price: 390,
      evaluation: 3.7,
      types: ["Herbs", "Chilli"],
      sizes: ["1kg", "2kg", "3kg"]),
  Food(
      image: "assets/images/day55/5.png",
      title: "Hyderabadi biryani",
      description: description,
      price: 620,
      evaluation: 4.9,
      types: ["Herbs", "Chilli"],
      sizes: ["1kg", "2kg", "3kg"]),
  Food(
      image: "assets/images/day55/6.png",
      title: "Hyderabadi biryani",
      description: description,
      price: 450,
      evaluation: 4.9,
      types: ["Herbs", "Chilli"],
      sizes: ["1kg", "2kg", "3kg"]),
];
