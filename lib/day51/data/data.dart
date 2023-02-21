class Images {
  final String iamge;
  int countFavorite;
  final String title;
  final String lable;
  final double price;
  bool favorite;

  Images(this.iamge, this.countFavorite, this.title, this.lable, this.price,
      this.favorite);
}

const List type = [
  "Trending",
  "Populer",
  "Following",
];

List<Images> image = [
  Images("assets/images/day51/2.1.png", 320, "Radis Rosbery", "Saskehh Rio",
      0.20, false),
  Images("assets/images/day51/2.2.png", 320, "Radis Rosbery", "Saskehh Rio",
      0.20, false),
  Images("assets/images/day51/2.3.png", 320, "Radis Rosbery", "Saskehh Rio",
      0.20, false),
];

const List profile = [
  "https://media.istockphoto.com/id/1264106963/photo/headshot-of-44-year-old-mixed-race-man-in-casual-polo-shirt.jpg?b=1&s=170667a&w=0&k=20&c=ZRbnu6rRVV_-SWHbYRtFYOEBDM6OS-TBq0nRI6rkCas=",
  "Saskehh Rio",
  "Creator",
  "Auction ending in",
  "Hidhest Bid",
  "05 : 35 : 09",
  290,
];

List<Images> profileImage = [
  Images("assets/images/day51/3.1.png", 320, "Radis Rosbery", "Saskehh Rio",
      0.20, false),
  Images("assets/images/day51/2.2.png", 320, "Radis Rosbery", "Saskehh Rio",
      0.20, false),
  Images("assets/images/day51/2.3.png", 320, "Radis Rosbery", "Saskehh Rio",
      0.20, false),
];
