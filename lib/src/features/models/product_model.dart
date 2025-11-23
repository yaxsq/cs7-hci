class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double? oldPrice;
  final String imageUrl;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.oldPrice,
    required this.imageUrl,
    required this.category,
  });
}
