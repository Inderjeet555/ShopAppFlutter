import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart' show Cart;
import '../widgets/cartItem.dart';
import '../models/orders.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '.cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Total'),
                  Spacer(),
                  Chip(
                      label: Text(
                        '\$${cart.getTotalAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                            color: Theme.of(context)
                                .primaryTextTheme
                                .headline1
                                .color),
                      ),
                      backgroundColor: Theme.of(context).primaryColor),
                  FlatButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                          cart.items.values.toList(), cart.getTotalAmount);
                      cart.clearCart();
                    },
                    child: Text('Order Now'),
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, i) => CartItem(
                cart.items.values.toList()[i].id,
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].title,
                cart.items.keys.toList()[i]),
            itemCount: cart.getItemsCount,
          ))
        ],
      ),
    );
  }
}
