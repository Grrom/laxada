import 'package:flutter/material.dart';
import 'package:products_app/src/product/view/product_screen.dart';

class AppRoutes {
  static dynamic _extractArgs(BuildContext context) =>
      ModalRoute.of(context)!.settings.arguments;

  static Map<String, WidgetBuilder> routeMap = {
    ProductScreen.routeName: (context) {
      return ProductScreen(
        product: (_extractArgs(context) as ProductScreen).product,
      );
    },
  };
}
