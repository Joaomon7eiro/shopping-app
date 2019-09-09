import 'package:shop_app/models/cart_product.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartProduct> products;
  final DateTime dateTime;

  OrderItem({this.dateTime, this.id, this.products, this.amount});
}
