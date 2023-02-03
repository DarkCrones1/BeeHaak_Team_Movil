class Product{
  final int id;
  final String category;
  final String name;
  final String description;
  final int? price;
  final int? stock;
  final String imageURL;

  const Product
  ({
    required this.id,
    required this.category,
    required this.name,
    required this.description,
    this.price,
    this.stock,
    required this.imageURL,
  });
}