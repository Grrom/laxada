import 'dart:convert';

import 'package:products_app/core/models/product.dart';
import 'package:http/http.dart' show Client, Response;

class ProductsService {
  static const String baseUrl = 'https://dummyjson.com/products';
  static final Client _client = Client();

  static Future<List<Product>> getProducts(int paginationSkip) async {
    Uri uri = Uri.parse(
      "$baseUrl?limit=10&skip=$paginationSkip&select=title,price,thumbnail,stock,discountPercentage",
    );

    final Response response = await _client.get(uri, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final List<dynamic> productsJson = json.decode(response.body)["products"];
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  static Future<Product> getProductById(String id) async {
    Uri uri = Uri.parse("$baseUrl/$id");

    final Response response = await _client.get(uri, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> productJson = json.decode(response.body);
      return Product.fromJson(productJson);
    } else {
      throw Exception('Failed to load product');
    }
  }
}
