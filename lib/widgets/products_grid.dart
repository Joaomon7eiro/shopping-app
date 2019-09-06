import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/favorites_provider.dart';
import '../widgets/product_item.dart';
import '../providers/products_provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool onlyFavorites;

  ProductsGrid(this.onlyFavorites);

  @override
  Widget build(BuildContext context) {
    var provider;

    onlyFavorites
        ? provider = Provider.of<FavoritesProvider>(context)
        : provider = Provider.of<ProductsProvider>(context);

    final products = provider.products;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (ctx, i) => ProductItem(products[i]),
      itemCount: products.length,
      padding: const EdgeInsets.all(10),
    );
  }
}
