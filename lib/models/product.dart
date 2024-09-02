class Product {
  final String name;
  final String imageUrl;
  final double price;
  final String description;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
  });

  // JSON serialization
  Map<String, dynamic> toJson() => {
    'name': name,
    'imageUrl': imageUrl,
    'price': price,
    'description': description,
  };

  // JSON deserialization
  factory Product.fromJson(Map<String, dynamic> json) => Product(
    name: json['name'],
    imageUrl: json['imageUrl'],
    price: json['price'].toDouble(),  // Ensure this is a double
    description: json['description'],
  );
}
