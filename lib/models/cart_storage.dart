import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product.dart';

class CartStorage {
  // Save cart items to SharedPreferences
  Future<void> saveCartItems(List<Product> items) async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = jsonEncode(items.map((item) => item.toJson()).toList());
    prefs.setString('cartItems', encodedData);
  }

  // Load cart items from SharedPreferences
  Future<List<Product>> loadCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final String? encodedData = prefs.getString('cartItems');
    if (encodedData != null) {
      final List<dynamic> decodedData = jsonDecode(encodedData);
      return decodedData.map((item) => Product.fromJson(item)).toList();
    }
    return [];
  }
}

// Ensure the Product model includes toJson and fromJson methods
extension ProductSerialization on Product {
  Map<String, dynamic> toJson() => {
    'name': name,
    'imageUrl': imageUrl,
    'price': price,
    'description': description,
  };

  static Product fromJson(Map<String, dynamic> json) => Product(
    name: json['name'],
    imageUrl: json['imageUrl'],
    price: json['price'],
    description: json['description'],
  );
}
