import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:products_app/core/models/product.dart';
import 'package:products_app/core/services/products_service.dart';

class ProductsProvider extends ChangeNotifier {
  ProductsProvider() {
    fetchProducts();
  }

  final List<Product> _products = [];
  int _currentPage = 0;
  bool _isFetchingProducts = false;

  List<Product> get products => _products;
  set addProducts(List<Product> products) {
    _products.addAll(products);
    notifyListeners();
  }

  bool get isFetchingProducts => _isFetchingProducts;
  set isFetchingProducts(bool value) {
    _isFetchingProducts = value;
    notifyListeners();
  }

  Future<void> fetchProducts() async {
    try {
      if (isFetchingProducts) return;
      isFetchingProducts = true;
      addProducts = await ProductsService.getProducts(_currentPage);
      _currentPage++;
    } catch (e) {
      log(e.toString());
    } finally {
      isFetchingProducts = false;
    }
  }
}
