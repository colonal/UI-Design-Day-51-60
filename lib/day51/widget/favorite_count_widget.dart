import 'package:flutter/material.dart';
import 'package:ui_design_day_51_60/day51/data/data.dart';

class FavoriteCountWidget extends StatefulWidget {
  final Images image;
  final double opacity;
  const FavoriteCountWidget({required this.image, this.opacity = 0.2, Key? key})
      : super(key: key);

  @override
  State<FavoriteCountWidget> createState() => _FavoriteCountWidgetState();
}

class _FavoriteCountWidgetState extends State<FavoriteCountWidget> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        width: 90,
        height: 34,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(widget.opacity),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: Colors.white.withOpacity(0.8),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                setState(() {
                  widget.image.favorite = !widget.image.favorite;
                  widget.image.countFavorite = widget.image.favorite
                      ? ++widget.image.countFavorite
                      : --widget.image.countFavorite;
                });
              },
              icon: Icon(
                  widget.image.favorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.white),
            ),
            Text(
              widget.image.countFavorite.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
