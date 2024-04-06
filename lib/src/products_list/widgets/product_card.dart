import 'package:flutter/material.dart';
import 'package:products_app/core/extensions/double.dart';
import 'package:products_app/core/models/product.dart';
import 'package:products_app/src/product/view/product_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 166,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            ProductScreen.routeName,
            arguments: ProductScreen(product: product),
          );
        },
        child: Card(
          elevation: .1,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.network(
                        product.thumbnail,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.red,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      child: Text(
                        "- ${product.discountPercentage.toPercentage}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 44,
                      child: Text(
                        product.title,
                        maxLines: 2,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          height: 1.5,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.discountedPrice.toPeso,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          product.price.toPeso,
                          style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 10,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "stock: ${product.stock}",
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
