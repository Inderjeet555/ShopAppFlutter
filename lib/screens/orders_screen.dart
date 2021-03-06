import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/orders.dart' show Orders;
import '../widgets/orderItem.dart';
import '../widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemBuilder: (context, i) => OrderItem(orderData.orders[i]),
        itemCount: orderData.orders.length,
      ),
    );
  }
}
