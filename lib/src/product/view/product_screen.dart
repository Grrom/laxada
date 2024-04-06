import 'package:flutter/material.dart';
import 'package:products_app/core/extensions/double.dart';
import 'package:products_app/core/models/product.dart';
import 'package:products_app/core/providers/products_provider.dart';
import 'package:products_app/src/product/widgets/product_description_loader.dart';
import 'package:products_app/src/product/widgets/product_images_carousel.dart';
import 'package:products_app/src/product/widgets/rating_renderer.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductScreen extends StatefulWidget {
  static const String routeName = '/product';

  final Product product;

  const ProductScreen({super.key, required this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductsProvider>(context, listen: false)
          .fetchProduct(widget.product.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.product.title),
      ),
      body: Consumer<ProductsProvider>(builder: (context, provider, _) {
        Product product = provider.getProductById(widget.product.id);
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 260,
                child: ProductImageCarousel(
                  images: provider.getProductById(product.id).images ??
                      (product.thumbnail != null ? [product.thumbnail!] : []),
                ),
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
                      Skeletonizer(
                        enabled: product.rating == null,
                        child: product.rating == null
                            ? const SizedBox()
                            : Padding(
                                padding: const EdgeInsets.all(16),
                                child: RatingRenderer(rating: product.rating!),
                              ),
                      ),
                      ProductDescriptionLoader(product: product),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32)
            ],
          ),
        );
      }),
    );
  }
}
