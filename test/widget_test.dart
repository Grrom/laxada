import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:products_app/core/extensions/double.dart';
import 'package:products_app/core/models/product.dart';
import 'package:products_app/src/product/widgets/product_description_loader.dart';
import 'package:products_app/src/product/widgets/rating_renderer.dart';
import 'package:products_app/src/products_list/widgets/product_card.dart';
import 'package:products_app/src/shared/components/custom_carousel.dart';

class CustomBindings extends AutomatedTestWidgetsFlutterBinding {
  @override
  bool get overrideHttpClient => false;
}

void main() {
  CustomBindings();

  testWidgets(
    "Product Card display all required data",
    (WidgetTester tester) async {
      TestWidgetsFlutterBinding.ensureInitialized();
      String productTitle = 'Product 1';
      double price = 100;
      int stock = 1;
      double discountPercentage = 69.9;

      ProductCard productCard = ProductCard(
        product: Product(
          id: '1',
          discountPercentage: discountPercentage,
          price: price,
          title: productTitle,
          stock: stock,
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                productCard,
              ],
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.text(productTitle), findsOneWidget);
      expect(find.text(price.toPeso), findsOneWidget);
      expect(find.text("stock: $stock"), findsOneWidget);
      expect(find.text("- ${discountPercentage.toPercentage}"), findsOneWidget);
    },
  );

  testWidgets(
    "CustomCarousel displays correct number items",
    (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: CustomCarousel(
          items: [
            Text("Item 1"),
            Text("Item 2"),
            Text("Item 3"),
          ],
        ),
      ));
      await tester.pump();

      expect(find.text("Item 1"), findsOneWidget);
      expect(find.text("Item 2"), findsOneWidget);
      expect(find.text("Item 3"), findsOneWidget);
    },
  );

  testWidgets(
    "RatingRenderer displays the correct number of stars",
    (WidgetTester tester) async {
      RatingRenderer ratingRenderer = const RatingRenderer(rating: 4.5);

      await tester.pumpWidget(MaterialApp(
        home: ratingRenderer,
      ));

      expect(find.byIcon(Icons.star), findsNWidgets(4));
      expect(find.byIcon(Icons.star_half), findsOneWidget);
    },
  );

  testWidgets(
    "ProductDescriptionLoader displays the correct widget",
    (WidgetTester tester) async {
      Product product = Product(
        id: '1',
        discountPercentage: 69.9,
        description: "Product description",
        price: 100,
        title: 'Product 1',
        brand: 'Brand X',
        stock: 69,
        category: 'Shrek action figures',
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
      expect(find.text(product.description!), findsOneWidget);
      expect(find.text('brand: ${product.brand ?? ""}'), findsOneWidget);
      expect(find.text('category: ${product.category ?? ""}'), findsOneWidget);
    },
  );
}
