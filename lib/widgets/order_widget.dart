import 'package:flutter/material.dart';

import '../models/order_item.dart';

class OrderWidget extends StatelessWidget {
  final OrderItem order;

  const OrderWidget(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${order.amount}'),
            subtitle: Text(order.dateTime.toString()),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
