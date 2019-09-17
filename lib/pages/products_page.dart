import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/pages/cart_page.dart';

import '../widgets/badge.dart';
import '../widgets/app_drawer.dart';
import '../widgets/products_grid.dart';
import '../providers/cart_provider.dart';

enum FilterOptions { Favorites, All }

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  bool _onlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('ShopName'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions option) {
              if (option == FilterOptions.Favorites) {
                setState(() {
                  _onlyFavorites = true;
                });
              } else {
                setState(() {
                  _onlyFavorites = false;
                });
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Favoritos'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Mostrar Tudo'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<CartProvider>(
            builder: (context, cartProvider, iconChild) {
              return Badge(
                child: iconChild,
                value: cartProvider.productsCount.toString(),
              );
            },
            child: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, CartPage.routeName);
              },
            ),
          )
        ],
      ),
      body: ProductsGrid(_onlyFavorites),
    );
  }
}
