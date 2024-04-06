import 'package:flutter/material.dart';
import 'package:products_app/core/models/product.dart';
import 'package:products_app/core/utils/colors.dart';
import 'package:products_app/core/utils/constants.dart';
import 'package:products_app/src/products_list/widgets/product_card.dart';

class ProductListScreen extends StatelessWidget {
  static const String routeName = '/product-list';

  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.foreground,
      appBar: AppBar(
        title: const Text(
          Constants.appName,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              spacing: 4,
              runSpacing: 4,
              children: List.generate(
                10,
                (index) => ProductCard(
                  product: Product(
                    title: "Dumbell",
                    price: 69,
                    thumbnail: "thumbnail",
                    stock: "99",
                    discountPercentage: "99%",
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
