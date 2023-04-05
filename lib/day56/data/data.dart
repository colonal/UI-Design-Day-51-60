import 'package:flutter/material.dart';

import '../widget/home_widget.dart';
import '../widget/market_wisget.dart';

class BottomBarItem {
  final String img;
  final String label;
  final Widget child;
  BottomBarItem({
    required this.img,
    required this.label,
    required this.child,
  });
}

List<BottomBarItem> bottomBarItems = [
  BottomBarItem(img: "assets/images/day56/home.svg",label: "Home", child: const HomeWidget()),
  BottomBarItem(img: "assets/images/day56/wallet.svg",label: "Wallet",child: const HomeWidget()),
  BottomBarItem(img: "assets/images/day56/swap.svg",label: "Swap",child: const HomeWidget()),
  BottomBarItem(img: "assets/images/day56/chart.svg",label: "Market",child: const MarketWidget()),
  BottomBarItem(img: "assets/images/day56/profile.svg",label: "Profile",child: const HomeWidget()),
];

enum TokensState{
  up,
  down
}

class Tokens {
  final String image;
  final String name;
  final String subName;
  final String prise;
  final String rate;
  final TokensState state;
  final List<CurrencyValue> data;
  Tokens({
    required this.image,
    required this.name,
    required this.subName,
    required this.prise,
    required this.rate,
    required this.state,
    required this.data,
  });
}

List<Tokens> tokens = [
  Tokens(image: "assets/images/day56/bitcoin.png", name: "Bitcoin", subName: "BTC", prise: "\$36,590.00", rate: "+6.21%", state: TokensState.up, data:dataBitcoin),
  Tokens(image: "assets/images/day56/ethereum.png", name: "Ethereum", subName: "ETH", prise: "\$2,590.00", rate: "+5.21%", state: TokensState.down,data:dataEthereum),
  Tokens(image: "assets/images/day56/solona.png", name: "Solona", subName: "SOL", prise: "\$390.00", rate: "+2.21%", state: TokensState.down,data:dataSolona),
];

class CurrencyValue {
  final DateTime date;
  final int value;

  CurrencyValue(this.date, this.value);
}

final List<CurrencyValue> dataBitcoin = [
  CurrencyValue(DateTime(2022, 1, 1), 400),
  CurrencyValue(DateTime(2022, 2, 1), 50),
  CurrencyValue(DateTime(2022, 2, 10), 200),
  CurrencyValue(DateTime(2022, 3, 1), 150),
  CurrencyValue(DateTime(2022, 4, 1), 400),
];

final List<CurrencyValue> dataEthereum = [
  CurrencyValue(DateTime(2022, 1, 1), 300),
  CurrencyValue(DateTime(2022, 1, 15), 300),
  CurrencyValue(DateTime(2022, 2, 1), 260),
  CurrencyValue(DateTime(2022, 3, 1), 250),
  CurrencyValue(DateTime(2022, 4, 1), 280),
  CurrencyValue(DateTime(2022, 4, 13), 300),
];

final List<CurrencyValue> dataSolona = [
  CurrencyValue(DateTime(2022, 1, 1), 300),
  CurrencyValue(DateTime(2022, 1, 15), 350),
  CurrencyValue(DateTime(2022, 2, 1), 150),
  CurrencyValue(DateTime(2022, 2, 15), 210),
  CurrencyValue(DateTime(2022, 3, 1), 250),
  CurrencyValue(DateTime(2022, 4, 1), 100),
  CurrencyValue(DateTime(2022, 4, 13), 300),
];


class Nfts {
  final String image;
  final String tag;
  final String name;
  final double eth;
  final double price;
  final TokensState state;
  Nfts({
    required this.image,
    required this.tag,
    required this.name,
    required this.eth,
    required this.price,
    required this.state,
  });

}

List<Nfts> nfts = [
  Nfts(image: "assets/images/day56/7.png", tag: "#1957", name: "Bored Ape Yacht Club", eth:6.64, price:23114.57, state: TokensState.up),
  Nfts(image: "assets/images/day56/8.png", tag: "#6513", name: "Bored Ape Yacht Club", eth:199.8, price:45114.57, state: TokensState.up),
  Nfts(image: "assets/images/day56/7.png", tag: "#1957", name: "Bored Ape Yacht Club", eth:6.64, price:23114.57, state: TokensState.up),
  Nfts(image: "assets/images/day56/8.png", tag: "#6513", name: "Bored Ape Yacht Club", eth:199.8, price:45114.57, state: TokensState.up),

];

enum Classification { tokens, nft }

class ClassificationItem {
  final Classification state;
  final Widget child;
  ClassificationItem({
    required this.state,
    required this.child,
  });
  
}


class Market {
  final String image;
  final String title;
  final String tag;
  final double prise;
  Market({
    required this.image,
    required this.title,
    required this.tag,
    required this.prise,
  });
}

List<Market> markets = [
  Market(image: "assets/images/day56/1.png", title: "Super Influencers", tag: "#1267", prise: 6.64),
  Market(image: "assets/images/day56/2.png", title: "Super Influencers", tag: "#1267", prise: 6.64),
  Market(image: "assets/images/day56/3.png", title: "Super Influencers", tag: "#1267", prise: 6.64),
  Market(image: "assets/images/day56/4.png", title: "Super Influencers", tag: "#1267", prise: 6.64),
  Market(image: "assets/images/day56/5.png", title: "Super Influencers", tag: "#1267", prise: 6.64),
  Market(image: "assets/images/day56/6.png", title: "Super Influencers", tag: "#1267", prise: 6.64),
];

List marketsFilter = [
  "All NFTs",
  "Art",
  "Collectibles",
  "Music",
  "Photography",
];