import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  final List<String> cartItems = [];

  void addItem(String item) {
    if (!cartItems.contains(item)) {
      cartItems.add(item);
      notifyListeners();
    }
  }

  void removeItem(String item) {
    cartItems.remove(item);
    notifyListeners();
  }

  void clearCart() {
    cartItems.clear();
    notifyListeners();
  }

  bool isInCart(String item) {
    return cartItems.contains(item);
  }

  int get cartCount {
    return cartItems.length;
  }
}