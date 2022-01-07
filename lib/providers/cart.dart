import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.title,
    required this.id,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  int get getItemCount {
    return _items.length;
  }

  void addItem(String productId, String title, double price) {
    if(_items.containsKey(productId)) {
      //...
      _items.update(
          productId,
          (value) => CartItem(
              title: value.title,
              id: value.id,
              quantity: value.quantity + 1,
              price: value.price,
          ),
      );
    }
    else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              title: title,
              id: DateTime.now().toString(),
              quantity: 1,
              price: price,
          ),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }
}