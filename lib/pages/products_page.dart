import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShopName'),
      ),
      body: ProductsGrid(),
    );
  }
}
