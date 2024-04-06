import 'package:flutter/material.dart';
import 'package:products_app/core/providers/products_provider.dart';
import 'package:products_app/core/utils/colors.dart';
import 'package:products_app/core/utils/constants.dart';
import 'package:products_app/src/products_list/widgets/product_card.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatelessWidget {
  static const String routeName = '/product-list';

  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.lightGrey,
      appBar: AppBar(
        title: const Text(
          Constants.appName,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Consumer<ProductsProvider>(builder: (context, provider, _) {
        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo.metrics.maxScrollExtent ==
                (scrollInfo.metrics.pixels)) {
              provider.fetchProducts();
              return true;
            }
            return false;
          },
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Builder(
                  builder: (context) {
                    if (provider.products.isEmpty &&
                        !provider.isFetchingProducts) {
                      return const Text(
                        'No products found',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      );
                    }
                    return Column(
                      children: [
                        Wrap(
                          spacing: 4,
                          runSpacing: 4,
                          children: List.generate(
                            provider.products.length,
                            (index) => ProductCard(
                              product: provider.products[index],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          height: 24,
                          width: 24,
                          child: provider.isFetchingProducts
                              ? const CircularProgressIndicator()
                              : const SizedBox(),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
