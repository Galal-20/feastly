import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final double starSize;
  final Color color;

  const StarRating({
    super.key,
    required this.rating,
    this.starSize = 24,
    this.color = Colors.amber,
  });

  @override
  Widget build(BuildContext context) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < fullStars; i++)
          Icon(Icons.star, color: color, size: starSize),
        if (hasHalfStar) Icon(Icons.star_half, color: color, size: starSize),
        for (int i = 0; i < emptyStars; i++)
          Icon(Icons.star_border, color: color, size: starSize),
      ],
    );
  }
}
