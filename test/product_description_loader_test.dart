import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:products_app/core/models/product.dart';
import 'package:products_app/src/product/widgets/product_description_loader.dart';

void main() {
  testWidgets(
    "ProductDescriptionLoader displays the correct widget",
    (WidgetTester tester) async {
      String productTitle = 'Product 1';
      double price = 100;
      int stock = 1;
      double discountPercentage = 69.9;

      Product product = Product(
        id: '1',
        discountPercentage: discountPercentage,
        price: price,
        title: productTitle,
        stock: stock,
      );
      await tester.pumpWidget(
        MaterialApp(
          home: ProductDescriptionLoader(
            product: product,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(ProductDescriptionLoader), findsOneWidget);
    },
  );
}
