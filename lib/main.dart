import 'package:flutter/material.dart';
import 'package:products_app/core/providers/products_provider.dart';
import 'package:products_app/core/utils/constants.dart';
import 'package:products_app/core/utils/route_map.dart';
import 'package:products_app/src/products_list/view/product_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(create: (_) => ProductsProvider()),
      ],
      child: MaterialApp(
        title: Constants.appName,
        home: const ProductListScreen(),
        routes: AppRoutes.routeMap,
      ),
    );
  }
}
