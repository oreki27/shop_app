import 'package:flutter/foundation.dart';
import './cart.dart';

class OrderItem {
  final String id;
  final double total;
  final DateTime dateTime;
  final List<CartItem> products;

  OrderItem({
    required this.id,
    required this.total,
    required this.dateTime,
    required this.products,
  });
}

class Orders with ChangeNotifier{
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
        0,
        OrderItem(
            id: DateTime.now().toString(),
            total: total,
            dateTime: DateTime.now(),
            products: cartProducts
        )
    );
    notifyListeners();
  }
}