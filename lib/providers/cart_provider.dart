import 'package:flutter/foundation.dart';

import '../models/cart_product.dart';

class CartProvider with ChangeNotifier {
  Map<String, CartProduct> _products = {};

  Map<String, CartProduct> get products {
    return {..._products};
  }

  int get productsCount {
    return _products.length;
  }

  double get totalAmount {
    double total = 0;
    _products.forEach((key, product) {
      total += product.price * product.quantity;
    });
    return total;
  }

  void addProduct(String id, double price, String title) {
    if (_products.containsKey(id)) {
      _products.update(
        id,
        (CartProduct item) => CartProduct(
            price: item.price,
            title: item.title,
            productId: id,
            quantity: item.quantity + 1,
            id: item.id),
      );
    } else {
      _products.putIfAbsent(
        id,
        () => CartProduct(
            quantity: 1,
            id: DateTime.now().toString(),
            price: price,
            productId: id,
            title: title),
      );
    }
    notifyListeners();
  }

  void removeItem(String key) {
    _products.remove(key);
    notifyListeners();
  }
}
