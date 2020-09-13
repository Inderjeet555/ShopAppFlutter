import 'package:flutter/material.dart';
import '../models/products_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/productDetailScreen';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final products = Provider.of<ProductsProvider>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(products.title),
      ),
      body: SingleChildScrollView(
          child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(products.imageUrl, fit: BoxFit.cover,),
            ),
            SizedBox(height: 10,),
            Container(padding: EdgeInsets.symmetric(horizontal: 10),child: Text('\$${products.price}', style: TextStyle(color: Colors.grey, fontSize: 20),)),
            SizedBox(height: 10,),
            Text(products.description, textAlign: TextAlign.center, softWrap: true,)
          ],
        ),
      ),
    );
  }
}
