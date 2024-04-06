import 'package:flutter/material.dart';
import 'package:products_app/core/models/product.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  final Product product;

  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Center(
        child: Column(
          children: [
            const Placeholder(
              fallbackHeight: 200,
              fallbackWidth: 200,
            ),
            Text(product.title),
            Text(product.price.toString()),
            Text(product.stock),
            Text(product.discountPercentage),
          ],
        ),
      ),
    );
  }
}
