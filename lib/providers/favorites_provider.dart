import 'package:flutter/material.dart';

import '../models/product.dart';

class FavoritesProvider with ChangeNotifier {
  List<Product> _favorites = [];

  List<Product> get products {
    return [..._favorites];
  }

  void handleFavorite(Product product) {
    _favorites.contains(product)
        ? _favorites.remove(product)
        : _favorites.add(product);
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return _favorites.contains(product);
  }
}
