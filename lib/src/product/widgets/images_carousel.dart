import 'package:flutter/material.dart';
import 'package:products_app/src/products_list/widgets/custom_carousel.dart';

class ProductImageCarousel extends StatelessWidget {
  final List<String> images;
  const ProductImageCarousel({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return CustomCarousel(
      viewportFraction: 1,
      height: MediaQuery.of(context).size.height * 0.6,
      items: images.map((e) {
        return Image.network(
          e,
          fit: BoxFit.cover,
        );
      }).toList(),
    );
  }
}
