import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/order_item.dart';

import '../providers/orders.dart' show Orders;

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Orders",
        ),
      ),
      body: ListView.builder(
          itemCount: orderData.orders.length,
          itemBuilder: (_,i) => OrderItem(orderData.orders[i])
      ),
    );
  }
}