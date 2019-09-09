import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_product.dart';
import '../providers/cart_provider.dart';

class CartItem extends StatelessWidget {
  final CartProduct product;

  const CartItem(this.product);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(product.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<CartProvider>(context, listen: false)
            .removeItem(product.productId);
      },
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: FittedBox(
                child: Text('\$${product.price}'),
              ),
            ),
            title: Text(product.title),
            subtitle: Text('Total: \$${product.price * product.quantity}'),
            trailing: Text('${product.quantity} x'),
          ),
        ),
      ),
    );
  }
}
