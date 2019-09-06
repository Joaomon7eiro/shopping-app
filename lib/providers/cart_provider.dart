import 'package:flutter/foundation.dart';

class CardItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  const CardItem({this.id, this.title, this.quantity, this.price});
}

class CartProvider with ChangeNotifier {
  Map<String, CardItem> _products = {};

  Map<String, CardItem> get products {
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
        (CardItem item) => CardItem(
            price: item.price,
            title: item.title,
            quantity: item.quantity + 1,
            id: item.id),
      );
    } else {
      _products.putIfAbsent(
        id,
        () => CardItem(
            quantity: 1,
            id: DateTime.now().toString(),
            price: price,
            title: title),
      );
    }
    notifyListeners();
  }
}
