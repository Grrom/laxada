import 'package:flutter/material.dart';

class RatingRenderer extends StatelessWidget {
  final double rating;
  const RatingRenderer({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < 5; i++)
                Icon(
                  i < rating.floor()
                      ? Icons.star
                      : i < rating.ceil()
                          ? Icons.star_half
                          : Icons.star_border,
                  color: Colors.amber,
                ),
            ],
          ),
          Text(
            rating.toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
