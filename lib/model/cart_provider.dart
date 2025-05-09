import 'package:flutter/material.dart';

class CartItem {
  final String name;
  final String image;
  final String size;
  final double price;

  CartItem({
    required this.name,
    required this.image,
    required this.size,
    required this.price,
  });
}

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners(); // Notify listeners to update UI
  }

  void removeItem(CartItem item) {
    _items.remove(item);
    notifyListeners(); // Notify listeners to update UI
  }
}
