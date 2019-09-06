import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/favorites_provider.dart';
import './providers/products_provider.dart';
import './providers/cart_provider.dart';
import './pages/products_page.dart';
import './pages/product_detail_page.dart';
import './pages/cart_page.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          builder: (context) => FavoritesProvider(),
        ),
        ChangeNotifierProvider(
          builder: (context) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'title',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.deepOrange,
        ),
        routes: {
          '/': (ctx) => ProductsPage(),
          ProductDetailPage.routeName: (ctx) => ProductDetailPage(),
          CartPage.routeName: (ctx) => CartPage(),
        },
      ),
    );
  }
}
