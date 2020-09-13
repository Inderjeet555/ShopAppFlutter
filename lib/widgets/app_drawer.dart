import 'package:flutter/material.dart';
import '../screens/orders_screen.dart';
import '../screens/user_products_screen.dart';

class AppDrawer extends StatelessWidget {
  Widget buildListTile(String title,IconData iconData, Function callBack) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(title),
      onTap: callBack,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          buildListTile('Shop',Icons.shop, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          Divider(),
          buildListTile('Orders',Icons.payment,  () {
            Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
          }),
          Divider(),
          buildListTile('Manage Products', Icons.edit, () {
            Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
          }),
        ],
      ),
    );
  }
}
