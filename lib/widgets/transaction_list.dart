import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';

class TranstacionList extends StatelessWidget {
  // const TranstacionList({Key key}) : super(key: key);
  final List<Transaction> trasnsactions;

  TranstacionList(this.trasnsactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: trasnsactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet!!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text('\$${trasnsactions[index].amount}')),
                      ),
                    ),
                    title: Text(
                      trasnsactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(trasnsactions[index].date),
                    ),
                  ),
                );
              },
              itemCount: trasnsactions.length,
            ),
    );
  }
}
