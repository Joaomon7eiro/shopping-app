import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';

import '../pages/product_detail_page.dart';
import '../models/product.dart';
import '../providers/favorites_provider.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem(this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, ProductDetailPage.routeName,
          arguments: product.id),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
            footer: Consumer<FavoritesProvider>(
              builder: (ctx, favoritesProvider, _) {
                return GridTileBar(
                  leading: IconButton(
                    icon: favoritesProvider.isFavorite(product)
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border),
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      favoritesProvider.handleFavorite(product);
                    },
                  ),
                  trailing: Consumer<CartProvider>(
                    builder: (context, cartProvider, child) {
                      return IconButton(
                        icon: Icon(Icons.shopping_cart),
                        color: Theme.of(context).accentColor,
                        onPressed: () {
                          cartProvider.addProduct(
                              product.id, product.price, product.title);
                        },
                      );
                    },
                  ),
                  backgroundColor: Colors.black87,
                  title: Text(
                    product.title,
                    textAlign: TextAlign.center,
                  ),
                );
              },
            )),
      ),
    );
  }
}
