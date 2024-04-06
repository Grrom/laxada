class Product {
  final String title;
  final double price;
  final String thumbnail;
  final String stock;
  final String discountPercentage;

  Product(
      {required this.title,
      required this.price,
      required this.thumbnail,
      required this.stock,
      required this.discountPercentage});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      price: json['price'],
      thumbnail: json['thumbnail'],
      stock: json['stock'],
      discountPercentage: json['discount_percentage'],
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
