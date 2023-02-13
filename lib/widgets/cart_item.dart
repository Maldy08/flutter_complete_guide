import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  //const CartItem({Key key}) : super(key: key);,
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  CartItem(
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).colorScheme.error,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: Padding(
                padding: const EdgeInsets.all(5),
                child:
                    CircleAvatar(child: FittedBox(child: Text('\$${price}')))),
            title: Text(title),
            subtitle:
                Text('Total:  \$${(price * quantity).toStringAsFixed(2)}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: ((context) => AlertDialog(
                  title: Text('Are you sure?'),
                  content: Text(
                    'Do you want to remove the item from the cart?',
                  ),
                  actions: [
                    TextButton(
                        onPressed: (() {
                          Navigator.of(context).pop(true);
                        }),
                        child: Text('Yes')),
                    TextButton(
                        onPressed: (() {
                          Navigator.of(context).pop(false);
                        }),
                        child: Text('No'))
                  ],
                )));
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).remoteItem(productId);
      },
    );
  }
}
