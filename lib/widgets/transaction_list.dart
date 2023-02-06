import 'package:flutter/material.dart';
import './transaction_item.dart';
import '../model/transaction.dart';

class TranstacionList extends StatelessWidget {
  // const TranstacionList({Key key}) : super(key: key);
  final List<Transaction> trasnsactions;
  final Function deleteTx;

  TranstacionList(this.trasnsactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return trasnsactions.isEmpty
        ? LayoutBuilder(builder: ((ctx, constraints) {
            return Column(
              children: [
                Text(
                  'No transactions added yet!!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          }))
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(
                trasnsaction: trasnsactions[index],
                deleteTx: deleteTx,
              );
            },
            itemCount: trasnsactions.length,
          );
  }
}
