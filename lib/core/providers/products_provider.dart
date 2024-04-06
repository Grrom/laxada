import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:products_app/core/models/product.dart';
import 'package:products_app/core/services/products_service.dart';

class ProductsProvider extends ChangeNotifier {
  ProductsProvider() {
    fetchProducts();
  }

  final List<Product> _products = [];
  final Map<String, bool> _productsFetching = {};
  final Map<String, Product> _productsCache = {};

  int _currentPage = 0;
  bool _isFetchingProducts = false;

  bool isProductFetching(String id) {
    return _productsFetching[id] ?? false;
  }

  Product getProductById(String id) {
    if (_productsCache.containsKey(id)) {
      return _productsCache[id]!;
    }
    return _products.firstWhere((element) => element.id == id);
  }

  set setProductFetching(MapEntry<String, bool> entry) {
    _productsFetching[entry.key] = entry.value;
    notifyListeners();
  }

  void _saveProductCache(Product product) {
    _productsCache[product.id] = product;
    notifyListeners();
  }

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

  Future<void> fetchProduct(String id) async {
    if (_productsCache.containsKey(id)) return;

    setProductFetching = MapEntry(id, true);
    try {
      _saveProductCache(await ProductsService.getProductById(id));
      return;
    } catch (e) {
      log(e.toString());
    } finally {
      setProductFetching = MapEntry(id, false);
    }
  }
}
