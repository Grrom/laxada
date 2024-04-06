class Product {
  final String id;
  final String title;
  final double price;
  final String thumbnail;
  final int stock;
  final double discountPercentage;
  final String? brand;
  final String? category;
  final List<String>? images;

  double get discountedPrice {
    return price / (1 + (discountPercentage / 100));
  }

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
    required this.stock,
    required this.discountPercentage,
    this.brand,
    this.category,
    this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      title: json['title'],
      price: double.parse(json['price'].toString()),
      thumbnail: json['thumbnail'],
      stock: json['stock'],
      discountPercentage: double.parse(json['discountPercentage'].toString()),
      brand: json['brand'],
      category: json['category'],
      images: json['images']?.cast<String>(),
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
