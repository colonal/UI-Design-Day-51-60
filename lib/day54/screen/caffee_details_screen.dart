import 'dart:ui';

import 'package:flutter/material.dart';

import '../data/data.dart';

class CaffeeDetailsScreen extends StatefulWidget {
  final Coffee coffee;
  const CaffeeDetailsScreen({required this.coffee, super.key});

  @override
  State<CaffeeDetailsScreen> createState() => _CaffeeDetailsScreenState();
}

class _CaffeeDetailsScreenState extends State<CaffeeDetailsScreen> {
  int _choiceOfMilk = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff362C36),
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                _buildImageBackground(size, context),
                SliverList(
                  delegate: SliverChildListDelegate([
                    _buildInfo(),
                    _buildChoiceOfMilk(),
                    const SizedBox(height: 72),
                  ]),
                )
              ],
            ),
            _buildbottomSide(size)
          ],
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  widget.coffee.filter,
                  style: const TextStyle(
                    color: Color(0xffefe3c8),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    widget.coffee.isFaverit = !widget.coffee.isFaverit;
                  });
                },
                color: widget.coffee.isFaverit ? Colors.redAccent : Colors.grey,
                icon: const Icon(Icons.favorite),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Flexible(
                child: Text(
                  widget.coffee.title,
                  style: const TextStyle(
                    color: Color(0xffefe3c8),
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.star, color: Colors.orange, size: 15),
              const SizedBox(width: 2),
              Text(
                widget.coffee.evaluation.toString(),
                style: const TextStyle(
                  color: Color(0xffefe3c8),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            widget.coffee.description,
            style: const TextStyle(
              color: Color(0xffefe3c8),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }


  Positioned _buildbottomSide(Size size) {
    return Positioned(
      bottom: 0,
      child: Container(
        color:  const Color(0xff362C36),
        width: size.width,
        height: 68,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text.rich(
                TextSpan(
                  text: "Price\n",
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xffefe3c8),
                  ),
                  children: [
                    TextSpan(
                      text: "₹ ${widget.coffee.price}",
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color(0xffefe3c8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ColoredBox(
                    color: const Color(0xffefe3c8),
                    child: MaterialButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text(
                        "BUY NOW",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildImageBackground(Size size, BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color(0xff362C36),
      expandedHeight: size.height * .45,
      floating: true,
      pinned: true,
      snap: true,
      elevation: 0,
      leading: Align(
        alignment: Alignment.bottomRight,
        child: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.4),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(widget.coffee.image, fit: BoxFit.fill),
          ),
        ),
      ),
    );
  }

  Widget _buildChoiceOfMilk() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Flexible(
            child: Text(
              "Choice of Milk",
              style: TextStyle(
                color: Color(0xffefe3c8),
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            height: 30,
            child: ListView.separated(
              itemCount: choiceOfMilk.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 15),
              itemBuilder: (context, index) => InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  setState(() {
                    _choiceOfMilk = index;
                  });
                },
                child: Container(
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: _choiceOfMilk == index
                          ? const Color(0xffefe3c8)
                          : const Color(0xff362C36),
                      border: Border.all(
                        color: _choiceOfMilk == index
                            ? const Color(0xff362C36)
                            : const Color(0xffefe3c8),
                      )),
                  child: Center(
                    child: Text(
                      choiceOfMilk[index],
                      style: TextStyle(
                        color: _choiceOfMilk == index
                            ? const Color(0xff362C36)
                            : const Color(0xffefe3c8),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
