import 'package:flutter/material.dart';
import 'package:products_app/core/models/product.dart';
import 'package:products_app/core/providers/products_provider.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductDescriptionLoader extends StatelessWidget {
  final Product product;
  const ProductDescriptionLoader({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(
      builder: (context, provider, _) {
        Product product = provider.getProductById(this.product.id);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Description",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Skeletonizer(
              enabled: product.description == null ||
                  provider.isProductFetching(product.id),
              child: Text(
                product.description ?? "",
                style: const TextStyle(fontSize: 12, height: 1.5),
              ),
            ),
            const SizedBox(height: 8),
            Skeletonizer(
              enabled: product.brand == null ||
                  provider.isProductFetching(product.id),
              child: Text(
                'brand: ${product.brand ?? ""}',
                style: const TextStyle(fontSize: 12, height: 1.5),
              ),
            ),
            Skeletonizer(
              enabled: product.category == null ||
                  provider.isProductFetching(product.id),
              child: Text(
                'category: ${product.category ?? ""}',
                style: const TextStyle(fontSize: 12, height: 1.5),
              ),
            ),
          ],
        );
      },
    );
  }
}
