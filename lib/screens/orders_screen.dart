import 'package:flutter/material.dart';
import 'package:provider/provider.dart'
;
import '../widgets/app_drawer.dart';
import '../widgets/order_item.dart';

import '../providers/orders.dart' show Orders;

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);
  static const routeName = "/orders-screen";
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders",),
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
          itemCount: orderData.orders.length,
          itemBuilder: (_,i) => OrderItem(orderData.orders[i])
      ),
    );
  }
}
