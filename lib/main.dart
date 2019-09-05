import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/products_provider.dart';
import './pages/products_page.dart';
import './pages/product_detail_page.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (ctx) => ProductsProvider(),
      child: MaterialApp(
        title: 'title',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.deepOrange,
        ),
        routes: {
          '/': (ctx) => ProductsPage(),
          ProductDetailPage.routeName: (ctx) => ProductDetailPage(),
        },
      ),
    );
  }
}
