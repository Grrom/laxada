class Product {
  final String title;
  final double price;
  final String thumbnail;
  final int stock;
  final double discountPercentage;

  double get discountedPrice {
    return price / (1 + (discountPercentage / 100));
  }

  Product({
    required this.title,
    required this.price,
    required this.thumbnail,
    required this.stock,
    required this.discountPercentage,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      price: double.parse(json['price'].toString()),
      thumbnail: json['thumbnail'],
      stock: json['stock'],
      discountPercentage: double.parse(json['discountPercentage'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'price': price,
      'thumbnail': thumbnail,
      'stock': stock,
      'discount_percentage': discountPercentage,
    };
  }
}
