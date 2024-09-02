import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'product.dart';

class Cart with ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items;

  Cart() {
    loadCartItems();  // Load items when the Cart is initialized
  }

  void addProduct(Product product) {
    _items.add(product);
    saveCartItems();  // Save items whenever the cart is updated
    notifyListeners();
  }

  void removeProduct(Product product) {
    _items.remove(product);
    saveCartItems();  // Save items whenever the cart is updated
    notifyListeners();
  }

  double get totalPrice {
    return _items.fold(0.0, (sum, item) => sum + item.price);
  }

  // Method to save cart items to SharedPreferences
  void saveCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = jsonEncode(_items.map((item) => item.toJson()).toList());
    prefs.setString('cartItems', encodedData);
  }

  // Method to load cart items from SharedPreferences
  void loadCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final String? encodedData = prefs.getString('cartItems');
    if (encodedData != null) {
      final List<dynamic> decodedData = jsonDecode(encodedData);
      _items.addAll(decodedData.map((item) => Product.fromJson(item)).toList());
      notifyListeners();  // Notify listeners that the cart has been updated
    }
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
