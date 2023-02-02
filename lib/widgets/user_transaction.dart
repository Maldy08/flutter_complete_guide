import 'package:flutter/material.dart';
import '../model/transaction.dart';
import './new_transcation.dart';
import './transaction_list.dart';

class UserTranstacions extends StatefulWidget {
  //const UserTranstacions({Key key}) : super(key: key);

  @override
  State<UserTranstacions> createState() => _UserTranstacionsState();
}

class _UserTranstacionsState extends State<UserTranstacions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: "t1",
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(String title, double amount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TranstacionList(_userTransactions),
      ],
    );
  }
}
