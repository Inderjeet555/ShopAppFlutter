import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_App/models/products_provider.dart';
import '../widgets/products_item.dart';

class ProductsGrid extends StatelessWidget {
  final showFavorites;

  ProductsGrid(this.showFavorites);

  @override
  Widget build(BuildContext context) {
    final productsData = !showFavorites
        ? Provider.of<ProductsProvider>(context).items
        : Provider.of<ProductsProvider>(context).favoriteItems;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: productsData[i],
        child: ProductItem(),
      ),
      itemCount: productsData.length,
    );
  }
}
