import 'package:flutter/material.dart';
import 'package:products_app/core/extensions/double.dart';
import 'package:products_app/core/models/product.dart';
import 'package:products_app/core/utils/constants.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';

  final Product product;

  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.thumbnail,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "stock: ${product.stock}",
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Text(
                          product.discountedPrice.toPeso,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          product.price.toPeso,
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "- ${product.discountPercentage.toPercentage}",
                          style: const TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Description",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Lorem ipsum",
                      style: TextStyle(fontSize: 12, height: 1.5),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32)
          ],
        ),
      ),
    );
  }
}
